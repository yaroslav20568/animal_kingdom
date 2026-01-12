import 'package:animal_kingdom/models/index.dart';

class AnimalsRepository {
  static final List<Animal> _animals = [
    const Animal(
      id: '1',
      name: 'Lion',
      description:
          'The lion is a large predatory mammal from the cat family. It is one of the most recognizable animals in the world.',
      imageUrl:
          'https://i.pinimg.com/originals/52/d4/33/52d43363016d42515a27b3d3e6e44e68.jpg?nii=t',
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
          'https://assets.telegraphindia.com/abp/2022/Feb/1643814746_elephant.jpg',
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
          'https://i.ytimg.com/vi/LC9M5LgLhu8/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGEwgWihlMA8=&rs=AOn4CLAAeIo2IuikN43dAs4JXGmgwtPxBw',
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
          'https://avatars.dzeninfra.ru/get-zen_doc/271828/pub_663283e4aef1ff543f2a2aec_663283ed31eace3a599f58d1/scale_1200',
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
          'https://avatars.mds.yandex.net/i?id=9a8ece89d2e011e05d608e67b21d2c6538500337-5537533-images-thumbs&n=13',
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
          'https://i.bigenc.ru/resizer/resize?sign=BV9XMTXFvy9EEI4a6xTGlA&filename=vault/bf23c44bde6673507bfa9374ab9ba62d.webp&width=1280',
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
          'https://img.goodfon.ru/wallpaper/nbig/9/80/nature-animal-wildlife-canis-lupus-face-wolf-portrait-pr-107.webp',
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
      imageUrl: 'https://scx2.b-cdn.net/gfx/news/hires/2016/tigershark.jpg',
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
          'https://i.pinimg.com/736x/a2/76/f8/a276f82f1c4788fa18693d31d78cf194.jpg',
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
          'https://avatars.mds.yandex.net/i?id=e7fed3aecff601b1385b15187710f0fb_l-5381926-images-thumbs&n=13',
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
          'https://t3.ftcdn.net/jpg/06/37/94/58/360_F_637945854_kTCbBARcUmQBegl9qWEjpfFV8uwso2yS.jpg',
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
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Humpback_Whale_underwater_shot.jpg/960px-Humpback_Whale_underwater_shot.jpg',
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
          'https://img.freepik.com/premium-photo/view-bird_1048944-15224848.jpg?semt=ais_hybrid&w=740',
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
          'https://nationalzoo.si.edu/sites/default/files/styles/max_2600x2600/public/2025-01/20241030-817A8764-14RP.jpg?itok=qQNqNwKP',
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
