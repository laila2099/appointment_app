import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final int value;
  const Stars(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (i) {
        final filled = i < value;
        return Icon(
          filled ? Icons.star : Icons.star_border,
          size: 20,
          color: Colors.amber,
        );
      }),
    );
  }
}
