import 'package:flutter/material.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import 'detailed_service_item.dart';

class DetailedServicesGrid extends StatelessWidget {
  const DetailedServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(width),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: _getChildAspectRatio(width),
      ),
      itemBuilder: (context, index) {
        return DetailedServiceItem(
          service: AppConstants.services[index],
        );
      },
      itemCount: AppConstants.services.length,
    );
  }

  int _getCrossAxisCount(double deviceWidth) {
    int numOfServices = AppConstants.services.length;
    if (deviceWidth < DeviceType.mobile.getMaxWidth()) {
      return 1;
    } else if (deviceWidth < DeviceType.ipad.getMaxWidth()) {
      return 2;
    } else if (deviceWidth < DeviceType.smallScreenLaptop.getMaxWidth()) {
      return 3;
    } else {
      return numOfServices > 3 ? 3 : numOfServices;
    }
  }

  double _getChildAspectRatio(double width) {
    if (width < DeviceType.mobile.getMaxWidth()) {
      return 1.05;
    } else if (width < DeviceType.ipad.getMaxWidth()) {
      return .95;
    } else if (width < DeviceType.smallScreenLaptop.getMaxWidth()) {
      return .8;
    } else {
      return .9;
    }
  }
}
