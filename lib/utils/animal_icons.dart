import 'package:flutter/material.dart';

class AnimalIcons {
  static IconData getIconForAnimal(String animalName) {
    switch (animalName.toLowerCase()) {
      case 'лев':
        return Icons.pets;
      case 'слон':
        return Icons.forest;
      case 'орёл':
        return Icons.flight;
      case 'дельфин':
        return Icons.water;
      case 'тигр':
        return Icons.pets;
      case 'медведь':
        return Icons.forest;
      case 'жираф':
        return Icons.pets;
      case 'пингвин':
        return Icons.ac_unit;
      default:
        return Icons.pets;
    }
  }

  static Color getColorForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'млекопитающее':
        return Colors.orange.shade700;
      case 'птица':
        return Colors.blue.shade700;
      case 'морское':
        return Colors.cyan.shade700;
      default:
        return Colors.brown.shade700;
    }
  }
}
