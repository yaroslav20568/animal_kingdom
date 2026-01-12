import 'package:flutter/material.dart';

import 'package:animal_kingdom/data/index.dart';
import 'package:animal_kingdom/models/index.dart';
import 'package:animal_kingdom/utils/index.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteIds = FavoritesManager.getFavoriteIds();
    final favoriteAnimals = favoriteIds
        .map((id) => AnimalsRepository.getAnimalById(id))
        .whereType<Animal>()
        .toList();

    if (favoriteAnimals.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          backgroundColor: Colors.brown.shade700,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_border,
                size: 64,
                color: Colors.brown.shade300,
              ),
              const SizedBox(height: 16),
              Text(
                'No favorites yet',
                style: TextStyle(fontSize: 18, color: Colors.brown.shade700),
              ),
              const SizedBox(height: 8),
              Text(
                'Add animals to favorites by tapping\nthe heart icon on animal pages',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.brown.shade600),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.brown.shade700,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favoriteAnimals.length,
        itemBuilder: (context, index) {
          final animal = favoriteAnimals[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AnimalIcons.getColorForCategory(
                    animal.category,
                  ).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  AnimalIcons.getIconForAnimal(animal.name),
                  color: AnimalIcons.getColorForCategory(animal.category),
                ),
              ),
              title: Text(
                animal.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(animal.category),
                  const SizedBox(height: 4),
                  Text(
                    animal.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  FavoritesManager.toggleFavorite(animal.id);
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FavoritesScreen(),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
