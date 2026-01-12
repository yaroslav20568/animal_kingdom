import 'package:flutter/material.dart';

import 'package:animal_kingdom/models/index.dart';

class SearchFilterBar extends StatefulWidget {
  final List<Animal> allAnimals;
  final Function(List<Animal>) onFiltered;

  const SearchFilterBar({
    super.key,
    required this.allAnimals,
    required this.onFiltered,
  });

  @override
  State<SearchFilterBar> createState() => _SearchFilterBarState();
}

class _SearchFilterBarState extends State<SearchFilterBar> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  final List<String> _categories = ['All', 'Mammal', 'Bird', 'Marine'];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterAnimals);
    _filterAnimals();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterAnimals() {
    final query = _searchController.text.toLowerCase();
    final filtered = widget.allAnimals.where((animal) {
      final matchesSearch =
          animal.name.toLowerCase().contains(query) ||
          animal.description.toLowerCase().contains(query) ||
          animal.habitat.toLowerCase().contains(query);
      final matchesCategory =
          _selectedCategory == 'All' || animal.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();

    widget.onFiltered(filtered);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search animals...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.brown.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.brown.shade600, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _categories.map((category) {
                final isSelected = _selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                        _filterAnimals();
                      });
                    },
                    selectedColor: Colors.brown.shade300,
                    checkmarkColor: Colors.brown.shade900,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
