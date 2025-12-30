import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const HeaderButton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black.withOpacity(0.06)),
        ),
        child: child,
      ),
    );
  }
}
