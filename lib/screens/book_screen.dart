import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:animal_kingdom/data/index.dart';
import 'package:animal_kingdom/widgets/index.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen>
    with SingleTickerProviderStateMixin {
  bool _isBookOpen = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  int _currentPageIndex = 0;
  late List<Map<String, dynamic>> _pagePairs;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _initializePagePairs();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  void _initializePagePairs() {
    final animals = AnimalsRepository.getAllAnimals();
    _pagePairs = [];
    for (int i = 0; i < animals.length; i += 2) {
      if (i + 1 < animals.length) {
        _pagePairs.add({'left': animals[i], 'right': animals[i + 1]});
      } else {
        _pagePairs.add({'left': animals[i], 'right': animals[i]});
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _openBook() {
    HapticFeedback.mediumImpact();
    setState(() {
      _isBookOpen = true;
    });
    _animationController.forward();
  }

  void _closeBook() {
    HapticFeedback.mediumImpact();
    _animationController.reverse().then((_) {
      if (mounted) {
        setState(() {
          _isBookOpen = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookOpeningAnimation(
          animation: _animation,
          closedBook: ClosedBookWidget(onOpen: _isBookOpen ? () {} : _openBook),
          openBook: _buildOpenBook(),
        ),
      ),
    );
  }

  Widget _buildOpenBook() {
    if (_pagePairs.isEmpty) {
      return const Center(child: Text('No data'));
    }

    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            HapticFeedback.selectionClick();
            setState(() {
              _currentPageIndex = index;
            });
          },
          itemCount: _pagePairs.length,
          itemBuilder: (context, index) {
            final pair = _pagePairs[index];
            return BookPagesWidget(
              leftPageAnimal: pair['left'],
              rightPageAnimal: pair['right'],
              pageNumber: index + 1,
              totalPages: _pagePairs.length,
            );
          },
        ),
        Positioned(
          top: 16,
          left: 16,
          child: _currentPageIndex > 0
              ? IconButton(
                  icon: const Icon(Icons.first_page),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    _pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white.withValues(alpha: 0.8),
                    padding: const EdgeInsets.all(12),
                  ),
                  tooltip: 'To first page',
                )
              : const SizedBox.shrink(),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: _closeBook,
            style: IconButton.styleFrom(
              backgroundColor: Colors.white.withValues(alpha: 0.8),
              padding: const EdgeInsets.all(12),
            ),
            tooltip: 'Close book',
          ),
        ),
        Positioned(bottom: 16, left: 0, right: 0, child: _buildPageIndicator()),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pagePairs.length,
        (index) => Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPageIndex == index
                ? Colors.brown.shade700
                : Colors.brown.shade300,
          ),
        ),
      ),
    );
  }
}
