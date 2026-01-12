import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:animal_kingdom/widgets/start_screen/index.dart';
import 'package:animal_kingdom/screens/book_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  void _openBook(BuildContext context) {
    HapticFeedback.mediumImpact();
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const BookScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ClosedBookWidget(onOpen: () => _openBook(context))),
    );
  }
}
