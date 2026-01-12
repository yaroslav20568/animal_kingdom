import 'package:animal_kingdom/models/index.dart';

class AnimalsRepository {
  static final List<Animal> _animals = [
    const Animal(
      id: '1',
      name: 'Lion',
      description:
          'The lion is a large predatory mammal from the cat family. It is one of the most recognizable animals in the world.',
      imageUrl: '',
      habitat: 'Savannas and grasslands of Africa',
      diet: 'Carnivore',
      lifespan: '10-14 years in the wild',
      category: 'Mammal',
    ),
    const Animal(
      id: '2',
      name: 'Elephant',
      description:
          'The elephant is the largest land mammal. Known for its intelligence and social behavior.',
      imageUrl: '',
      habitat: 'Savannas, forests and deserts of Africa and Asia',
      diet: 'Herbivore',
      lifespan: '60-70 years',
      category: 'Mammal',
    ),
    const Animal(
      id: '3',
      name: 'Eagle',
      description:
          'The eagle is a large predatory bird with powerful claws and sharp vision. A symbol of strength and freedom.',
      imageUrl: '',
      habitat: 'Mountains, forests, open spaces',
      diet: 'Carnivore',
      lifespan: '20-30 years',
      category: 'Bird',
    ),
    const Animal(
      id: '4',
      name: 'Dolphin',
      description:
          'The dolphin is an intelligent marine mammal known for its friendliness and intelligence.',
      imageUrl: '',
      habitat: 'Oceans and seas around the world',
      diet: 'Carnivore',
      lifespan: '20-50 years',
      category: 'Marine',
    ),
    const Animal(
      id: '5',
      name: 'Tiger',
      description:
          'The tiger is the largest member of the cat family. Known for its strength, grace and distinctive stripes.',
      imageUrl: '',
      habitat: 'Tropical forests, savannas, mangrove swamps of Asia',
      diet: 'Carnivore',
      lifespan: '10-15 years in the wild',
      category: 'Mammal',
    ),
    const Animal(
      id: '6',
      name: 'Bear',
      description:
          'The bear is a large predatory mammal. Known for its strength and ability to hibernate in winter.',
      imageUrl: '',
      habitat: 'Forests, mountains, tundra of the Northern Hemisphere',
      diet: 'Omnivore',
      lifespan: '20-30 years',
      category: 'Mammal',
    ),
    const Animal(
      id: '7',
      name: 'Giraffe',
      description:
          'The giraffe is the tallest land animal. Known for its long neck and unique skin pattern.',
      imageUrl: '',
      habitat: 'Savannas and open forests of Africa',
      diet: 'Herbivore',
      lifespan: '20-25 years',
      category: 'Mammal',
    ),
    const Animal(
      id: '8',
      name: 'Penguin',
      description:
          'The penguin is a flightless seabird, perfectly adapted to life in water and on ice.',
      imageUrl: '',
      habitat: 'Antarctica and coastal waters of the Southern Hemisphere',
      diet: 'Carnivore',
      lifespan: '15-20 years',
      category: 'Bird',
    ),
  ];

  static List<Animal> getAllAnimals() {
    return List.unmodifiable(_animals);
  }

  static Animal? getAnimalById(String id) {
    try {
      return _animals.firstWhere((animal) => animal.id == id);
    } catch (e) {
      return null;
    }
  }
}
