import 'dart:async';
import 'package:flutter/material.dart';
import '../services/mapbox_service.dart';
import 'destination_item.dart';
import 'package:latlong2/latlong.dart';

class SearchBottomSheet extends StatefulWidget {
  final String? initialOrigin;
  final String? initialDestination;
  final void Function(String origin, LatLng? originLatLng, String destination, LatLng? destinationLatLng) onRouteSelected;
  final void Function(bool isOrigin) onOpenPinPicker;
  final bool isSearching;
  final Function(bool) onSearchStateChanged;

  const SearchBottomSheet({
    super.key,
    this.initialOrigin,
    this.initialDestination,
    required this.onRouteSelected,
    required this.onOpenPinPicker,
    required this.isSearching,
    required this.onSearchStateChanged,
  });

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  late final TextEditingController _originController;
  late final TextEditingController _searchController;
  final MapboxService _mapboxService = MapboxService();
  final DraggableScrollableController _sheetController = DraggableScrollableController();
  final FocusNode _originFocus = FocusNode();
  final FocusNode _searchFocus = FocusNode();

  List<MapboxPlace> _mapboxSuggestions = [];
  bool _isLoadingSuggestions = false;
  Timer? _debounceTimer;
  String _activeField = 'destination'; // 'origin' or 'destination'
  LatLng? _selectedOriginLatLng;

  @override
  void initState() {
    super.initState();
    _originController = TextEditingController(text: widget.initialOrigin ?? "Ubicación actual");
    _searchController = TextEditingController(text: widget.initialDestination ?? "");

    void expandSheet() {
      if (_sheetController.isAttached && _sheetController.size < 0.92) {
        _sheetController.animateTo(0.92, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      }
    }

    _originFocus.addListener(() {
      if (_originFocus.hasFocus) expandSheet();
    });
    _searchFocus.addListener(() {
      if (_searchFocus.hasFocus) expandSheet();
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _originController.dispose();
    _searchController.dispose();
    _originFocus.dispose();
    _searchFocus.dispose();
    _sheetController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query, String field) {
    _activeField = field;
    _debounceTimer?.cancel();

    if (query.trim().isEmpty) {
      setState(() {
        _mapboxSuggestions = [];
        _isLoadingSuggestions = false;
      });
      return;
    }

    _debounceTimer = Timer(const Duration(milliseconds: 350), () async {
      setState(() {
        _isLoadingSuggestions = true;
      });

      final results = await _mapboxService.searchPlaces(query);

      if (mounted) {
        setState(() {
          _mapboxSuggestions = results;
          _isLoadingSuggestions = false;
        });
      }
    });
  }

  void _selectPlace(MapboxPlace place) {
    if (_activeField == 'origin') {
      _originController.text = place.placeName;
      _selectedOriginLatLng = LatLng(place.latitude, place.longitude);
      setState(() {
        _mapboxSuggestions = [];
      });
      if (_searchController.text.trim().isNotEmpty) {
        widget.onRouteSelected(_originController.text, _selectedOriginLatLng, _searchController.text, null);
      } else {
        _searchFocus.requestFocus();
      }
    } else {
      _searchController.text = place.placeName;
      widget.onRouteSelected(_originController.text, _selectedOriginLatLng, place.placeName, LatLng(place.latitude, place.longitude));
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool showMapboxResults = _mapboxSuggestions.isNotEmpty || _isLoadingSuggestions;

    return DraggableScrollableSheet(
      controller: _sheetController,
      initialChildSize: 0.60,
      minChildSize: 0.30,
      maxChildSize: 0.92,
      snap: true,
      snapSizes: const [0.30, 0.60, 0.92],
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                color: Color(0x1F000000),
                blurRadius: 15,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Drag Handle Pill
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    width: 44,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 4),

                // 2. Input Bar: Origin Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GestureDetector(
                    onTap: () => _originFocus.requestFocus(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: _originFocus.hasFocus ? Colors.blue : Colors.grey[300]!, width: _originFocus.hasFocus ? 1.5 : 1.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                    child: Row(
                      children: [
                        const Icon(Icons.my_location, color: Colors.blueAccent, size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            focusNode: _originFocus,
                            controller: _originController,
                            onChanged: (val) => _onSearchChanged(val, 'origin'),
                            onSubmitted: (val) {
                              if (val.trim().isNotEmpty && _searchController.text.trim().isNotEmpty) {
                                widget.onRouteSelected(val, _selectedOriginLatLng, _searchController.text, null);
                              } else {
                                _searchFocus.requestFocus();
                              }
                            },
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Punto de partida',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.edit, size: 18, color: Colors.black54),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ),
                ),
                ),

                const SizedBox(height: 10),

                // 3. Input Bar: Destination Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GestureDetector(
                    onTap: () => _searchFocus.requestFocus(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: _searchFocus.hasFocus ? Colors.black : Colors.grey[400]!, width: 1.5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.black, size: 22),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            focusNode: _searchFocus,
                            controller: _searchController,
                            onChanged: (val) => _onSearchChanged(val, 'destination'),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            decoration: const InputDecoration(
                              hintText: '¿A dónde vas?',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 10),
                            ),
                            onSubmitted: (value) {
                              if (value.trim().isNotEmpty) {
                                widget.onRouteSelected(_originController.text, _selectedOriginLatLng, value, null);
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.edit, size: 18, color: Colors.black54),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ),
                ),
                ),

                const SizedBox(height: 12),

                // 4. MAPBOX SUGGESTIONS (DIRECTAMENTE ABAJO DE LOS TEXTFIELDS AL ESCRIBIR)
                if (showMapboxResults) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sugerencias',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        if (_isLoadingSuggestions)
                          const SizedBox(
                            width: 14,
                            height: 14,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
                          ),
                      ],
                    ),
                  ),
                  ..._mapboxSuggestions.map((place) => DestinationItem(
                        icon: Icons.location_on,
                        title: place.text,
                        subtitle: place.placeName,
                        onTap: () => _selectPlace(place),
                      )),
                  const SizedBox(height: 12),
                ],

                // 5. OPCIONES FIJAR EN EL MAPA (SIEMPRE VISIBLES)
                DestinationItem(
                  icon: Icons.my_location,
                  title: 'Fijar punto de partida en el mapa',
                  subtitle: 'Mueve el mapa para elegir el punto exacto',
                  onTap: () => widget.onOpenPinPicker(true),
                ),
                DestinationItem(
                  icon: Icons.location_on,
                  title: 'Fijar destino en el mapa',
                  subtitle: 'Mueve el mapa para elegir el punto exacto',
                  onTap: () => widget.onOpenPinPicker(false),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }
}
