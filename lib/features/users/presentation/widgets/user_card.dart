import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:clean_architecture_template/core/routing/app_paths.dart';
import 'package:clean_architecture_template/features/users/domain/entities/user_entity.dart';
import 'package:clean_architecture_template/features/users/presentation/cubits/user/user_cubit.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user, required this.userCubit});
  final DataEntity user;
  final UserCubit userCubit;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () => context.push('${AppPaths.users}/${user.id}'),
        title: Text(user.email ?? ''),
        minVerticalPadding: 20,
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                user.username ?? '',
              ),
              Text(user.phone ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
