import 'dart:convert';

import 'package:photo_labs/domain_layer/entity/photo_detail_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteRepository {
  static const key = "favouriteImage";
  Future<List<PhotoDetailEntity>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStringList = prefs.getStringList(key) ?? [];
    return jsonStringList.map((jsonString) {
      final map = json.decode(jsonString);
      return PhotoDetailEntity.fromJson(map);
    }).toList();
  }

  Future<void> saveFavouriteImage(List<PhotoDetailEntity> favourite) async {
    final pref = await SharedPreferences.getInstance();

    final jsonString = favourite.map((photo) {
      final map = photo.toJson();
      return json.encode(map);
    }).toList();
    await pref.setStringList(key, jsonString);
  }

  Future<void> deleteFavouriteImages(PhotoDetailEntity photo) async {
    final favoritemovies = await loadFavorites();

    favoritemovies.removeWhere((element) => element.id == photo.id);
    await saveFavouriteImage(favoritemovies);
  }

  Future<void> toggeledImages(PhotoDetailEntity photo) async {
    final favourite = await loadFavorites();
    if (favourite.any((element) => element.id == photo.id)) {
      favourite.removeWhere((element) => element.id == photo.id);
    } else {
      favourite.add(photo);
    }
    await saveFavouriteImage(favourite);
  }
}
