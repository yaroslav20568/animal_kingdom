import 'package:flutter/material.dart';

class AnimalIcons {
  static IconData getIconForAnimal(String animalName) {
    switch (animalName.toLowerCase()) {
      case 'lion':
        return Icons.pets;
      case 'elephant':
        return Icons.forest;
      case 'eagle':
        return Icons.flight;
      case 'dolphin':
        return Icons.water;
      case 'tiger':
        return Icons.pets;
      case 'bear':
        return Icons.forest;
      case 'giraffe':
        return Icons.pets;
      case 'penguin':
        return Icons.ac_unit;
      case 'wolf':
        return Icons.pets;
      case 'shark':
        return Icons.water;
      case 'owl':
        return Icons.flight;
      case 'zebra':
        return Icons.pets;
      case 'kangaroo':
        return Icons.pets;
      case 'whale':
        return Icons.water;
      case 'flamingo':
        return Icons.flight;
      case 'panda':
        return Icons.forest;
      default:
        return Icons.pets;
    }
  }

  static Color getColorForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'mammal':
        return Colors.orange.shade700;
      case 'bird':
        return Colors.blue.shade700;
      case 'marine':
        return Colors.cyan.shade700;
      default:
        return Colors.brown.shade700;
    }
  }
}
