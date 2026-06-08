import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: S.of(context).profileTitle,
        isNotificationVisible: false,
      ),
      body: const ProfileViewBody(),
    );
  }
}
