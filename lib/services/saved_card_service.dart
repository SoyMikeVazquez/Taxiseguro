import 'package:shared_preferences/shared_preferences.dart';
import '../models/saved_card.dart';

class SavedCardService {
  static final SavedCardService _instance = SavedCardService._internal();
  factory SavedCardService() => _instance;
  SavedCardService._internal();

  static const String _prefPrefix = 'taxiseguro_active_card_';

  /// Obtiene la tarjeta guardada para el usuario actual
  Future<SavedCard?> getSavedCard(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = '$_prefPrefix$userId';
      final jsonStr = prefs.getString(key);
      if (jsonStr != null && jsonStr.isNotEmpty) {
        return SavedCard.fromJsonString(jsonStr);
      }
    } catch (_) {}
    return null;
  }

  /// Guarda la tarjeta activa del usuario
  Future<bool> saveCard(String userId, SavedCard card) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = '$_prefPrefix$userId';
      return await prefs.setString(key, card.toJsonString());
    } catch (_) {
      return false;
    }
  }

  /// Elimina la tarjeta guardada del usuario
  Future<bool> removeCard(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = '$_prefPrefix$userId';
      return await prefs.remove(key);
    } catch (_) {
      return false;
    }
  }
}
