import '../models/animal.dart';

class AnimalsRepository {
  static final List<Animal> _animals = [
    const Animal(
      id: '1',
      name: 'Лев',
      description:
          'Лев — крупное хищное млекопитающее из семейства кошачьих. Является одним из самых узнаваемых животных в мире.',
      imageUrl: '',
      habitat: 'Саванны и луга Африки',
      diet: 'Плотоядное',
      lifespan: '10-14 лет в дикой природе',
    ),
    const Animal(
      id: '2',
      name: 'Слон',
      description:
          'Слон — самое крупное наземное млекопитающее. Известен своим интеллектом и социальным поведением.',
      imageUrl: '',
      habitat: 'Саванны, леса и пустыни Африки и Азии',
      diet: 'Травоядное',
      lifespan: '60-70 лет',
    ),
    const Animal(
      id: '3',
      name: 'Орёл',
      description:
          'Орёл — крупная хищная птица с мощными когтями и острым зрением. Символ силы и свободы.',
      imageUrl: '',
      habitat: 'Горы, леса, открытые пространства',
      diet: 'Плотоядное',
      lifespan: '20-30 лет',
    ),
    const Animal(
      id: '4',
      name: 'Дельфин',
      description:
          'Дельфин — умное морское млекопитающее, известное своим дружелюбием и интеллектом.',
      imageUrl: '',
      habitat: 'Океаны и моря по всему миру',
      diet: 'Плотоядное',
      lifespan: '20-50 лет',
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
