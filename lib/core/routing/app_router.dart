import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_template/core/routing/app_paths.dart';
import 'package:clean_architecture_template/core/services/injection_container.dart';
import 'package:clean_architecture_template/features/users/presentation/screens/users_screen.dart';
import 'package:clean_architecture_template/features/splash/presentation/screens/splash_screen.dart';
import 'package:clean_architecture_template/features/users/presentation/cubits/user/user_cubit.dart';
import 'package:clean_architecture_template/features/users/presentation/screens/user_details_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppPaths.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => sl<UserCubit>()..getAllUsers(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: AppPaths.users,
            name: 'users',
            builder: (context, state) => const UsersScreen(),
            routes: [
              GoRoute(
                path: ':id',
                name: 'user-details',
                builder: (context, state) {
                  final userId = int.parse(state.pathParameters['id']!);
                  return UserDetailsScreen(userId: userId);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
