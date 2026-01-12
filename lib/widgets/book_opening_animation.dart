import 'package:flutter/material.dart';

class BookOpeningAnimation extends StatelessWidget {
  final Animation<double> animation;
  final Widget closedBook;
  final Widget openBook;

  const BookOpeningAnimation({
    super.key,
    required this.animation,
    required this.closedBook,
    required this.openBook,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final progress = animation.value;

        if (progress == 0.0) {
          return closedBook;
        }

        if (progress == 1.0) {
          return openBook;
        }

        return Stack(
          children: [
            Transform(
              alignment: Alignment.centerLeft,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(-progress * 1.5),
              child: Opacity(opacity: 1 - progress, child: closedBook),
            ),
            Transform(
              alignment: Alignment.centerRight,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY((1 - progress) * 1.5),
              child: Opacity(opacity: progress, child: openBook),
            ),
          ],
        );
      },
    );
  }
}
