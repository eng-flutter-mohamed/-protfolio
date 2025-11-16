import 'package:flutter/material.dart';

import '../../../core/utils/app_enums.dart';
import 'custom_header_btn.dart';

class HorizontalHeaders extends StatelessWidget {
  const HorizontalHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        AppBarHeaders.values.length,
        (index) => CustomHeaderBtn(headerIndex: index),
      ),
    );
  }
}
