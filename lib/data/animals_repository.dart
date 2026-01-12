import 'package:animal_kingdom/models/index.dart';

class AnimalsRepository {
  static final List<Animal> _animals = [
    const Animal(
      id: '1',
      name: 'Lion',
      description:
          'The lion is a large predatory mammal from the cat family. It is one of the most recognizable animals in the world.',
      imageUrl:
          'https://images.unsplash.com/photo-1546182990-dffeafbe841d?w=800',
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
      imageUrl:
          'https://images.unsplash.com/photo-1514894780887-121968d00567?w=800',
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
      imageUrl:
          'https://images.unsplash.com/photo-1597848212624-e593b32e5c3a?w=800',
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
      imageUrl:
          'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800',
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
      imageUrl:
          'https://images.unsplash.com/photo-1561731216-c3a4d99437d5?w=800',
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
      imageUrl:
          'https://images.unsplash.com/photo-1530595467537-0b5996c41f2d?w=800',
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
      imageUrl:
          'https://images.unsplash.com/photo-1517849845537-4d257902454a?w=800',
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
      imageUrl:
          'https://images.unsplash.com/photo-1583336663277-620dc1996580?w=800',
      habitat: 'Antarctica and coastal waters of the Southern Hemisphere',
      diet: 'Carnivore',
      lifespan: '15-20 years',
      category: 'Bird',
    ),
    const Animal(
      id: '9',
      name: 'Wolf',
      description:
          'The wolf is a social predator known for its pack behavior and howling. It plays a crucial role in ecosystem balance.',
      imageUrl:
          'https://images.unsplash.com/photo-1474511320723-9a56873867b5?w=800',
      habitat: 'Forests, tundra, grasslands of North America, Europe, and Asia',
      diet: 'Carnivore',
      lifespan: '6-8 years in the wild',
      category: 'Mammal',
    ),
    const Animal(
      id: '10',
      name: 'Shark',
      description:
          'The shark is a powerful marine predator with a cartilaginous skeleton. Essential for ocean ecosystem health.',
      imageUrl:
          'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
      habitat: 'Oceans worldwide, from shallow coastal waters to deep sea',
      diet: 'Carnivore',
      lifespan: '20-30 years',
      category: 'Marine',
    ),
    const Animal(
      id: '11',
      name: 'Owl',
      description:
          'The owl is a nocturnal bird of prey with exceptional night vision and silent flight. Symbol of wisdom.',
      imageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=800',
      habitat: 'Forests, woodlands, deserts, and urban areas worldwide',
      diet: 'Carnivore',
      lifespan: '10-20 years',
      category: 'Bird',
    ),
    const Animal(
      id: '12',
      name: 'Zebra',
      description:
          'The zebra is known for its distinctive black and white stripes. Each zebra has a unique stripe pattern.',
      imageUrl:
          'https://images.unsplash.com/photo-1551963831-b3b1ca40c98e?w=800',
      habitat: 'Grasslands and savannas of eastern and southern Africa',
      diet: 'Herbivore',
      lifespan: '20-30 years',
      category: 'Mammal',
    ),
    const Animal(
      id: '13',
      name: 'Kangaroo',
      description:
          'The kangaroo is a marsupial native to Australia. Known for its powerful hind legs and pouch for carrying young.',
      imageUrl:
          'https://images.unsplash.com/photo-1546182990-dffeafbe841d?w=800',
      habitat: 'Grasslands, forests, and woodlands of Australia',
      diet: 'Herbivore',
      lifespan: '6-8 years in the wild',
      category: 'Mammal',
    ),
    const Animal(
      id: '14',
      name: 'Whale',
      description:
          'The whale is the largest animal on Earth. These gentle giants are highly intelligent and communicate through complex songs.',
      imageUrl:
          'https://images.unsplash.com/photo-1514894780887-121968d00567?w=800',
      habitat: 'Oceans worldwide, from polar to tropical waters',
      diet: 'Carnivore',
      lifespan: '40-100 years depending on species',
      category: 'Marine',
    ),
    const Animal(
      id: '15',
      name: 'Flamingo',
      description:
          'The flamingo is a wading bird known for its vibrant pink color and distinctive curved beak.',
      imageUrl:
          'https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=800',
      habitat: 'Shallow lakes, lagoons, and mudflats in warm regions',
      diet: 'Omnivore',
      lifespan: '20-30 years',
      category: 'Bird',
    ),
    const Animal(
      id: '16',
      name: 'Panda',
      description:
          'The panda is a beloved bear native to China. Known for its distinctive black and white coloring and bamboo diet.',
      imageUrl:
          'https://images.unsplash.com/photo-1546182990-dffeafbe841d?w=800',
      habitat: 'Mountainous regions of central China',
      diet: 'Herbivore',
      lifespan: '20 years in the wild',
      category: 'Mammal',
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
