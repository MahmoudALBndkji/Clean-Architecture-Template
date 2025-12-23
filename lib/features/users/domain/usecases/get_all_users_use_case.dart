import 'package:clean_architecture_template/core/utils/usecases/usecase.dart';
import 'package:clean_architecture_template/core/utils/typedef.dart';
import 'package:clean_architecture_template/features/users/domain/entities/user_entity.dart';
import 'package:clean_architecture_template/features/users/domain/repos/users_repository.dart';

class GetAllUsersUseCase implements UsecaseWithParams<void, int> {
  final UserRepository _usersRepo;
  GetAllUsersUseCase(this._usersRepo);

  @override
  FutureResult<List<DataEntity>> call(int pageId) async =>
      await _usersRepo.getAllUsers(pageId);
}
