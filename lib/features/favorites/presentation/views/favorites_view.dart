import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fruits_e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:fruits_e_commerce_app/features/favorites/presentation/views/widgets/favorites_view_body.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: S.of(context).favorites,
        isNotificationVisible: false,
      ),
      body: const FavoritesViewBody().animate().fadeIn(duration: 800.ms),
    );
  }
}
