import 'package:clean_architecture_template/core/languages/app_localizations.dart';
import 'package:clean_architecture_template/features/users/presentation/widgets/users_list_view.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(50, 0, 0, 0),
        title: Text(
          "users".tr(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () => context
        //         .read<LanguageCubit>()
        //         .changeLanguage(currentLangAr() ? "en" : "ar"),
        //     icon: Icon(Icons.translate_outlined),
        //   ),
        //   SizedBox(width: 10),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: UsersListView(),
      ),
    );
  }
}
