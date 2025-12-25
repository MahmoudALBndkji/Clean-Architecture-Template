import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_template/core/base/base_state.dart';
import 'package:clean_architecture_template/core/errors/failures.dart';
import 'package:clean_architecture_template/features/users/domain/entities/user_entity.dart';
import 'package:clean_architecture_template/features/users/domain/usecases/get_all_users_use_case.dart';
import 'package:clean_architecture_template/features/users/domain/usecases/get_user_details_use_case.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetAllUsersUseCase _getAllUsersUseCase;
  final GetUserDetailsUseCase _getUserDetailsUseCase;

  UserCubit({
    required GetAllUsersUseCase getAllUsersUseCase,
    required GetUserDetailsUseCase getUserDetailsUseCase,
  })  : _getAllUsersUseCase = getAllUsersUseCase,
        _getUserDetailsUseCase = getUserDetailsUseCase,
        super(UserState.initial());

  Future<void> getAllUsers({int pageId = 1}) async {
    try {
      emit(
        state.copyWith(users: state.users.copyWith(status: BaseStatus.loading)),
      );
      final result = await _getAllUsersUseCase(pageId);
      final oldUsers = state.users.data ?? [];
      final mergedUsers = pageId == 1 ? result : [...oldUsers, ...result];
      emit(
        state.copyWith(
          users: state.users
              .copyWith(status: BaseStatus.success, data: mergedUsers),
        ),
      );
    } on ServerFailure catch (failure) {
      emitUserStateError(failure.message);
    } on DioException catch (error) {
      final failure = ServerFailure.fromDioException(error);
      emitUserStateError(failure.message);
    } catch (_) {
      emitUserStateError('general_error');
    }
  }

  void emitUserStateError(String errorMessage) => emit(
        state.copyWith(
          users: state.users
              .copyWith(status: BaseStatus.failure, error: errorMessage),
        ),
      );

  Future<void> getUserDetails(int userId) async {
    try {
      emit(
        state.copyWith(
            userDetails:
                state.userDetails.copyWith(status: BaseStatus.loading)),
      );
      final result = await _getUserDetailsUseCase(userId);
      emit(
        state.copyWith(
          userDetails: state.userDetails
              .copyWith(status: BaseStatus.success, data: result),
        ),
      );
    } on ServerFailure catch (failure) {
      emitUserDetailsStateError(failure.message);
    } on DioException catch (error) {
      final failure = ServerFailure.fromDioException(error);
      emitUserDetailsStateError(failure.message);
    } catch (_) {
      emitUserDetailsStateError('general_error');
    }
  }

  void emitUserDetailsStateError(String errorMessage) => emit(
        state.copyWith(
          userDetails: state.userDetails
              .copyWith(status: BaseStatus.failure, error: errorMessage),
        ),
      );
}
