import 'package:flutter/material.dart';
import 'package:animal_kingdom/models/animal.dart';
import 'package:animal_kingdom/utils/animal_icons.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Энциклопедия Животных',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.brown.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Стр. $pageNumber из $totalPages',
                  style: TextStyle(
                    fontSize: 12,
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
                Expanded(child: _buildPage(leftPageAnimal, isLeft: true)),
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
                Expanded(child: _buildPage(rightPageAnimal, isLeft: false)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(Animal animal, {required bool isLeft}) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
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
                  color: AnimalIcons.getColorForCategory(animal.category)
                      .withValues(alpha: 0.2),
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
                        fontSize: 26,
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
                        color: AnimalIcons.getColorForCategory(animal.category)
                            .withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        animal.category,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AnimalIcons.getColorForCategory(animal.category),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
              fontSize: 15,
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
                _buildInfoRow('Среда обитания:', animal.habitat),
                const SizedBox(height: 14),
                _buildInfoRow('Питание:', animal.diet),
                const SizedBox(height: 14),
                _buildInfoRow('Продолжительность жизни:', animal.lifespan),
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
