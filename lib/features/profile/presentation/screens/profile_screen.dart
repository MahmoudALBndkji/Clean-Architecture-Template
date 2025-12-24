import 'package:clean_architecture_template/core/languages/app_localizations.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('profile')),
      ),
      body: Center(
        child: Text(context.tr('profile')),
      ),
    );
  }
}
