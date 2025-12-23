import 'package:clean_architecture_template/core/utils/usecases/usecase.dart';
import 'package:clean_architecture_template/core/utils/typedef.dart';
import 'package:clean_architecture_template/features/users/domain/entities/user_entity.dart';
import 'package:clean_architecture_template/features/users/domain/repos/users_repository.dart';

class GetUserDetailsUseCase implements UsecaseWithParams<void, int> {
  final UserRepository _usersRepo;
  GetUserDetailsUseCase(this._usersRepo);

  @override
  FutureResult<DataEntity> call(int userId) async =>
      await _usersRepo.getUserDetails(userId);
}
