import 'package:flutter/material.dart';

import '../../../core/utils/app_enums.dart';
import '../../../core/utils/app_extensions.dart';
import 'custom_header_btn.dart';

class VerticalHeaders extends StatelessWidget {
  const VerticalHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.width > DeviceType.ipad.getMaxWidth()) {
      return const SizedBox();
    }
    return SizedBox(
      width: context.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          AppBarHeaders.values.length,
          (index) => SizedBox(
            width: context.width,
            child: CustomHeaderBtn(headerIndex: index),
          ),
        ),
      ),
    );
  }
}
