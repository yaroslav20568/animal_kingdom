class FavoritesManager {
  static final Set<String> _favoriteIds = <String>{};

  static bool isFavorite(String animalId) {
    return _favoriteIds.contains(animalId);
  }

  static void toggleFavorite(String animalId) {
    if (_favoriteIds.contains(animalId)) {
      _favoriteIds.remove(animalId);
    } else {
      _favoriteIds.add(animalId);
    }
  }

  static Set<String> getFavoriteIds() {
    return Set.unmodifiable(_favoriteIds);
  }

  static int getFavoriteCount() {
    return _favoriteIds.length;
  }
}
