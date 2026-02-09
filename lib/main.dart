import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/routing/router_generation_config.dart';

void main() {
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterGenerationConfig.goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
