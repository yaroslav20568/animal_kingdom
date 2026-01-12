import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:animal_kingdom/data/index.dart';
import 'package:animal_kingdom/widgets/book_screen/index.dart';
import 'package:animal_kingdom/constants/colors.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  int _currentPageIndex = 0;
  List<Map<String, dynamic>> _pagePairs = [];
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
    _initializePagePairs();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final savedPageIndex = _currentPageIndex;
    _initializePagePairs();
    if (savedPageIndex < _pagePairs.length && _pageController.hasClients) {
      _currentPageIndex = savedPageIndex;
      _pageController.jumpToPage(savedPageIndex);
    }
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
    _pageController.dispose();
    super.dispose();
  }

  void _closeBook() {
    HapticFeedback.mediumImpact();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    if (_pagePairs.isEmpty) {
      return const Scaffold(body: Center(child: Text('No data')));
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
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
              top: 24,
              left: 16,
              child: _currentPageIndex > 0
                  ? IconButton(
                      icon: const Icon(Icons.first_page, size: 20),
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        _pageController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.whiteOverlay,
                        padding: const EdgeInsets.all(8),
                        minimumSize: const Size(36, 36),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      tooltip: 'To first page',
                    )
                  : const SizedBox.shrink(),
            ),
            Positioned(
              top: 24,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close, size: 20),
                onPressed: _closeBook,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.whiteOverlay,
                  padding: const EdgeInsets.all(8),
                  minimumSize: const Size(36, 36),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                tooltip: 'Close book',
              ),
            ),
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final screenWidth = MediaQuery.of(context).size.width;
                  final isTablet = screenWidth > 600;
                  final horizontalMargin = isTablet ? 12.0 : 8.0;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
                    child: _buildPageIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.brown50.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _pagePairs.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: _currentPageIndex == index ? 24 : 6,
            height: 6,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: _currentPageIndex == index
                  ? AppColors.brown700
                  : AppColors.brown400.withValues(alpha: 0.4),
            ),
          ),
        ),
      ),
    );
  }
}
