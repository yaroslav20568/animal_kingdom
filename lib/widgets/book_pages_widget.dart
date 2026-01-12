import 'package:flutter/material.dart';

import 'package:animal_kingdom/models/index.dart';
import 'package:animal_kingdom/utils/index.dart';

class BookPagesWidget extends StatelessWidget {
  final Animal leftPageAnimal;
  final Animal rightPageAnimal;
  final int pageNumber;
  final int totalPages;

  const BookPagesWidget({
    super.key,
    required this.leftPageAnimal,
    required this.rightPageAnimal,
    required this.pageNumber,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final headerFontSize = isTablet ? 14.0 : 12.0;
    final horizontalPadding = isTablet ? 24.0 : 16.0;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.brown.shade100, Colors.brown.shade200],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Animal Encyclopedia',
                    style: TextStyle(
                      fontSize: headerFontSize,
                      color: Colors.brown.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Page $pageNumber of $totalPages',
                  style: TextStyle(
                    fontSize: headerFontSize,
                    color: Colors.brown.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildPage(context, leftPageAnimal, isLeft: true),
                ),
                Container(
                  width: 3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.brown.shade400,
                        Colors.brown.shade300,
                        Colors.brown.shade400,
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: _buildPage(context, rightPageAnimal, isLeft: false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(
    BuildContext context,
    Animal animal, {
    required bool isLeft,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final pagePadding = isTablet
        ? const EdgeInsets.symmetric(horizontal: 32, vertical: 32)
        : const EdgeInsets.symmetric(horizontal: 20, vertical: 24);
    final titleFontSize = isTablet ? 32.0 : 26.0;
    final descriptionFontSize = isTablet ? 16.0 : 15.0;

    return Container(
      margin: EdgeInsets.all(isTablet ? 12 : 8),
      padding: pagePadding,
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.shade300.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AnimalIcons.getColorForCategory(
                    animal.category,
                  ).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  AnimalIcons.getIconForAnimal(animal.name),
                  size: 32,
                  color: AnimalIcons.getColorForCategory(animal.category),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      animal.name,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown.shade900,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AnimalIcons.getColorForCategory(
                          animal.category,
                        ).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        animal.category,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AnimalIcons.getColorForCategory(
                            animal.category,
                          ),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _FavoriteButton(animalId: animal.id),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 12),
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.brown.shade300,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            animal.description,
            style: TextStyle(
              fontSize: descriptionFontSize,
              color: Colors.brown.shade800,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.brown.shade100.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                _buildInfoRow('Habitat:', animal.habitat),
                const SizedBox(height: 14),
                _buildInfoRow('Diet:', animal.diet),
                const SizedBox(height: 14),
                _buildInfoRow('Lifespan:', animal.lifespan),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.brown.shade700,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 14, color: Colors.brown.shade800),
          ),
        ),
      ],
    );
  }
}

class _FavoriteButton extends StatefulWidget {
  final String animalId;

  const _FavoriteButton({required this.animalId});

  @override
  State<_FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<_FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    final isFavorite = FavoritesManager.isFavorite(widget.animalId);

    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red.shade600 : Colors.brown.shade600,
      ),
      onPressed: () {
        setState(() {
          FavoritesManager.toggleFavorite(widget.animalId);
        });
      },
      tooltip: isFavorite ? 'Remove from favorites' : 'Add to favorites',
    );
  }
}
