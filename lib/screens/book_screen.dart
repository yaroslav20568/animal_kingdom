import 'package:flutter/material.dart';
import '../widgets/closed_book_widget.dart';
import '../widgets/book_pages_widget.dart';
import '../data/animals_repository.dart';

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
    super.dispose();
  }

  void _openBook() {
    setState(() {
      _isBookOpen = true;
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            if (!_isBookOpen) {
              return ClosedBookWidget(onOpen: _openBook);
            }

            return Stack(
              children: [
                Opacity(
                  opacity: 1 - _animation.value,
                  child: ClosedBookWidget(onOpen: () {}),
                ),
                Opacity(opacity: _animation.value, child: _buildOpenBook()),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildOpenBook() {
    if (_pagePairs.isEmpty) {
      return const Center(child: Text('Нет данных'));
    }

    return PageView.builder(
      controller: PageController(initialPage: _currentPageIndex),
      onPageChanged: (index) {
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
        );
      },
    );
  }
}
