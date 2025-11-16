import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'portfolio_app.dart';
import 'presentation/controllers/portfolio_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(PortfolioController(), permanent: true);
  runApp(const PortfolioApp());
}
