import 'package:flutter/material.dart';

import '../../../core/constant/text_style.dart';

class HeaderTitle extends StatelessWidget {
  final String text;
  const HeaderTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: CustomTextStyles.screenTitle,
    );
  }
}
