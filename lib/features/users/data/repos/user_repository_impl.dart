import 'package:clean_architecture_template/core/utils/typedef.dart';
import 'package:clean_architecture_template/features/users/data/datasources/user_data_source.dart';
import 'package:clean_architecture_template/features/users/domain/entities/user_entity.dart';
import 'package:clean_architecture_template/features/users/domain/repos/users_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _datasource;
  const UserRepositoryImpl(this._datasource);

  @override
  FutureResult<List<DataEntity>> getAllUsers(int pageId) async {
    final result = await _datasource.getAllUsers(pageId);
    return result;
  }

  @override
  FutureResult<DataEntity> getUserDetails(int userId) async {
    final result = await _datasource.getUserDetails(userId);
    return result;
  }
}
