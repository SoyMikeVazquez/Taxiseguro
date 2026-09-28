import 'dart:io';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AdminAdsScreen extends StatefulWidget {
  const AdminAdsScreen({super.key});

  @override
  State<AdminAdsScreen> createState() => _AdminAdsScreenState();
}

class _AdminAdsScreenState extends State<AdminAdsScreen> {
  final SupabaseClient _supabase = Supabase.instance.client;
  List<Map<String, dynamic>> _ads = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAds();
  }

  Future<void> _loadAds() async {
    setState(() => _isLoading = true);
    try {
      final res = await _supabase.from('ads').select().order('created_at', ascending: false);
      if (mounted) {
        setState(() {
          _ads = List<Map<String, dynamic>>.from(res);
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading ads: $e');
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _deleteAd(int id) async {
    try {
      await _supabase.from('ads').delete().eq('id', id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Anuncio eliminado')));
        _loadAds();
      }
    } catch (e) {
      debugPrint('Error deleting ad: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al eliminar: $e')));
      }
    }
  }

  void _showAdDialog([Map<String, dynamic>? ad]) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _AdFormDialog(
        ad: ad,
        onSaved: () {
          _loadAds();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text('Administrador de Anuncios', style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.black))
          : _ads.isEmpty
              ? const Center(child: Text('No hay anuncios registrados', style: TextStyle(fontFamily: 'Google Sans', fontSize: 16, color: Colors.black54)))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _ads.length,
                  itemBuilder: (context, index) {
                    final ad = _ads[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (ad['imagen_ads'] != null && ad['imagen_ads'].toString().isNotEmpty)
                            Image.network(
                              ad['imagen_ads'],
                              height: 200,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                height: 200,
                                color: Colors.grey[200],
                                child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                              ),
                            )
                          else
                            Container(
                              height: 200,
                              color: Colors.grey[200],
                              child: const Center(child: Text('Sin Imagen', style: TextStyle(color: Colors.grey))),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ad['titulo_ads'] ?? 'Sin título',
                                        style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 18),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        ad['descripcion_ads'] ?? '',
                                        style: const TextStyle(fontFamily: 'Inter', color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit, color: Colors.blue),
                                      onPressed: () => _showAdDialog(ad),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete, color: Colors.red),
                                      onPressed: () async {
                                        final confirm = await showDialog<bool>(
                                          context: context,
                                          builder: (c) => AlertDialog(
                                            title: const Text('Eliminar Anuncio'),
                                            content: const Text('¿Estás seguro de eliminar este anuncio?'),
                                            actions: [
                                              TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('Cancelar')),
                                              TextButton(
                                                onPressed: () => Navigator.pop(c, true),
                                                child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
                                              ),
                                            ],
                                          ),
                                        );
                                        if (confirm == true) {
                                          _deleteAd(ad['id']);
                                        }
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAdDialog(),
        backgroundColor: const Color(0xFFC7FF2E),
        icon: const Icon(Icons.add, color: Colors.black),
        label: const Text('Nuevo Anuncio', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class _AdFormDialog extends StatefulWidget {
  final Map<String, dynamic>? ad;
  final VoidCallback onSaved;

  const _AdFormDialog({this.ad, required this.onSaved});

  @override
  State<_AdFormDialog> createState() => _AdFormDialogState();
}

class _AdFormDialogState extends State<_AdFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  
  File? _selectedImage;
  String? _existingImageUrl;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    if (widget.ad != null) {
      _titleController.text = widget.ad!['titulo_ads'] ?? '';
      _descController.text = widget.ad!['descripcion_ads'] ?? '';
      _existingImageUrl = widget.ad!['imagen_ads'];
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final file = File(picked.path);
      final sizeMb = file.lengthSync() / (1024 * 1024);
      if (sizeMb > 2) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('La imagen debe pesar menos de 2MB')));
        }
        return;
      }
      setState(() {
        _selectedImage = file;
      });
    }
  }

  Future<void> _saveAd() async {
    if (!_formKey.currentState!.validate()) return;
    
    if (widget.ad == null && _selectedImage == null && _existingImageUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor, selecciona una imagen.')));
      return;
    }

    setState(() => _isSaving = true);
    
    try {
      String? imageUrl = _existingImageUrl;
      final supabase = Supabase.instance.client;

      if (_selectedImage != null) {
        final ext = _selectedImage!.path.split('.').last;
        final fileName = 'ad_${DateTime.now().millisecondsSinceEpoch}.$ext';
        await supabase.storage.from('general').upload('ads/$fileName', _selectedImage!);
        imageUrl = supabase.storage.from('general').getPublicUrl('ads/$fileName');
      }

      final payload = {
        'titulo_ads': _titleController.text.trim(),
        'descripcion_ads': _descController.text.trim(),
        'imagen_ads': imageUrl,
      };

      if (widget.ad == null) {
        // Create
        await supabase.from('ads').insert(payload);
      } else {
        // Update
        await supabase.from('ads').update(payload).eq('id', widget.ad!['id']);
      }

      if (mounted) {
        Navigator.pop(context);
        widget.onSaved();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Anuncio guardado con éxito')));
      }
    } catch (e) {
      debugPrint('Error saving ad: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al guardar: $e')));
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      title: Text(widget.ad == null ? 'Nuevo Anuncio' : 'Editar Anuncio', style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold)),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey[400]!, width: 1.5, style: BorderStyle.solid),
                  ),
                  child: _selectedImage != null
                      ? ClipRRect(borderRadius: BorderRadius.circular(14), child: Image.file(_selectedImage!, fit: BoxFit.cover))
                      : _existingImageUrl != null && _existingImageUrl!.isNotEmpty
                          ? ClipRRect(borderRadius: BorderRadius.circular(14), child: Image.network(_existingImageUrl!, fit: BoxFit.cover))
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add_photo_alternate, size: 40, color: Colors.grey),
                                SizedBox(height: 8),
                                Text('Subir imagen (1080x1920)\nMáx. 2MB', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 12)),
                              ],
                            ),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Título del anuncio',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                validator: (val) => (val == null || val.isEmpty) ? 'Requerido' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSaving ? null : () => Navigator.pop(context),
          child: const Text('Cancelar', style: TextStyle(color: Colors.black54)),
        ),
        ElevatedButton(
          onPressed: _isSaving ? null : _saveAd,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFC7FF2E),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: _isSaving
              ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2))
              : const Text('Guardar', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
