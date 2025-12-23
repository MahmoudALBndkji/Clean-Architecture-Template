import 'package:clean_architecture_template/core/constants/app_colors.dart';
import 'package:clean_architecture_template/core/languages/app_localizations.dart';
import 'package:flutter/material.dart';

class LoadingColumn extends StatelessWidget {
  const LoadingColumn({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(color: AppColors.blackColor),
          Text(
            message.tr(),
            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.blackColor),
          ),
        ],
      ),
    );
  }
}
