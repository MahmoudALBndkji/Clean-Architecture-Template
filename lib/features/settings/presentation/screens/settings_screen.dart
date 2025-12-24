import 'package:clean_architecture_template/core/languages/app_localizations.dart';
import 'package:clean_architecture_template/core/languages/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('settings')),
        actions: [
          IconButton(
            onPressed: () => context
                .read<LanguageCubit>()
                .changeLanguage(currentLangAr() ? "en" : "ar"),
            icon: Icon(Icons.translate_outlined),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: Text(context.tr('settings')),
      ),
    );
  }
}
