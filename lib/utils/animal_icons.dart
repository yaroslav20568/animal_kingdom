import 'package:flutter/material.dart';

import 'package:animal_kingdom/constants/colors.dart';

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
        return AppColors.categoryMammal;
      case 'bird':
        return AppColors.categoryBird;
      case 'marine':
        return AppColors.categoryMarine;
      default:
        return AppColors.categoryDefault;
    }
  }
}
