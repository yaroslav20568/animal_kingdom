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
    final isWideScreen = screenWidth > 480;
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
            padding: EdgeInsets.only(
              left: horizontalPadding + 52,
              right: horizontalPadding + 52,
              top: 8,
              bottom: 8,
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
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: isWideScreen
                  ? Row(
                      children: [
                        Expanded(
                          child: _buildPage(
                            context,
                            leftPageAnimal,
                            isLeft: true,
                          ),
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
                          child: _buildPage(
                            context,
                            rightPageAnimal,
                            isLeft: false,
                          ),
                        ),
                      ],
                    )
                  : _buildPage(context, leftPageAnimal, isLeft: true),
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
      child: SingleChildScrollView(
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
              ],
            ),
            const SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: animal.imageUrl.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          animal.imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: double.infinity,
                              color: Colors.brown.shade200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    AnimalIcons.getIconForAnimal(animal.name),
                                    size: 64,
                                    color: Colors.brown.shade400,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Failed to load image',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.brown.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              width: double.infinity,
                              color: Colors.brown.shade200,
                              child: Center(
                                child: CircularProgressIndicator(
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                      : null,
                                  color: Colors.brown.shade700,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        color: Colors.brown.shade200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              AnimalIcons.getIconForAnimal(animal.name),
                              size: 64,
                              color: Colors.brown.shade400,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'No image available',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.brown.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
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
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
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
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
