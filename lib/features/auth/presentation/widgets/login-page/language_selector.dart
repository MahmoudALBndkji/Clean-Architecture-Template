import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:clean_architecture_template/core/languages/bloc/language_bloc.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        final selectedLanguage =
            BlocProvider.of<LanguageBloc>(context).selectedLanguage;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                BlocProvider.of<LanguageBloc>(context)
                    .add(ChangeLanguage(languageCode: 'en'));
              },
              style: TextButton.styleFrom(
                foregroundColor:
                    selectedLanguage == 'en' ? Colors.white : primaryColor,
                backgroundColor: selectedLanguage == 'en'
                    ? primaryColor
                    : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: primaryColor),
                ),
              ),
              child: const Text('English'),
            ),
            const SizedBox(width: 16),
            TextButton(
              onPressed: () {
                BlocProvider.of<LanguageBloc>(context)
                    .add(ChangeLanguage(languageCode: 'ar'));
              },
              style: TextButton.styleFrom(
                foregroundColor:
                    selectedLanguage == 'ar' ? Colors.white : primaryColor,
                backgroundColor: selectedLanguage == 'ar'
                    ? primaryColor
                    : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: primaryColor),
                ),
              ),
              child: const Text('عربي'),
            ),
          ],
        );
      },
    );
  }
}
