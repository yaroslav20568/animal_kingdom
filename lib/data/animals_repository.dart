import 'package:animal_kingdom/models/animal.dart';

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
      category: 'Млекопитающее',
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
      category: 'Млекопитающее',
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
      category: 'Птица',
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
      category: 'Морское',
    ),
    const Animal(
      id: '5',
      name: 'Тигр',
      description:
          'Тигр — крупнейший представитель семейства кошачьих. Известен своей силой, грацией и характерными полосками.',
      imageUrl: '',
      habitat: 'Тропические леса, саванны, мангровые заросли Азии',
      diet: 'Плотоядное',
      lifespan: '10-15 лет в дикой природе',
      category: 'Млекопитающее',
    ),
    const Animal(
      id: '6',
      name: 'Медведь',
      description:
          'Медведь — крупное хищное млекопитающее. Известен своей силой и способностью впадать в зимнюю спячку.',
      imageUrl: '',
      habitat: 'Леса, горы, тундра Северного полушария',
      diet: 'Всеядное',
      lifespan: '20-30 лет',
      category: 'Млекопитающее',
    ),
    const Animal(
      id: '7',
      name: 'Жираф',
      description:
          'Жираф — самое высокое наземное животное. Известен своей длинной шеей и уникальным рисунком на шкуре.',
      imageUrl: '',
      habitat: 'Саванны и открытые леса Африки',
      diet: 'Травоядное',
      lifespan: '20-25 лет',
      category: 'Млекопитающее',
    ),
    const Animal(
      id: '8',
      name: 'Пингвин',
      description:
          'Пингвин — нелетающая морская птица, отлично приспособленная к жизни в воде и на льду.',
      imageUrl: '',
      habitat: 'Антарктида и прибрежные воды Южного полушария',
      diet: 'Плотоядное',
      lifespan: '15-20 лет',
      category: 'Птица',
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
