import 'package:flutter/material.dart';
import '../models/animal.dart';

class BookPagesWidget extends StatelessWidget {
  final Animal leftPageAnimal;
  final Animal rightPageAnimal;

  const BookPagesWidget({
    super.key,
    required this.leftPageAnimal,
    required this.rightPageAnimal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.brown.shade50, Colors.brown.shade100],
        ),
      ),
      child: Row(
        children: [
          Expanded(child: _buildPage(leftPageAnimal, isLeft: true)),
          Container(width: 2, color: Colors.brown.shade300),
          Expanded(child: _buildPage(rightPageAnimal, isLeft: false)),
        ],
      ),
    );
  }

  Widget _buildPage(Animal animal, {required bool isLeft}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.brown.shade50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            animal.name,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.brown.shade900,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            animal.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.brown.shade800,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          _buildInfoRow('Среда обитания:', animal.habitat),
          const SizedBox(height: 12),
          _buildInfoRow('Питание:', animal.diet),
          const SizedBox(height: 12),
          _buildInfoRow('Продолжительность жизни:', animal.lifespan),
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
