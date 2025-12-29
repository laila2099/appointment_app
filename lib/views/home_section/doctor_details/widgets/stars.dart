import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c

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
<<<<<<< HEAD
          size: 20,
=======
          size: 20.sp,
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c
          color: Colors.amber,
        );
      }),
    );
  }
}
