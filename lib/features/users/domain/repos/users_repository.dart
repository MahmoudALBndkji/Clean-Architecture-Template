import 'package:clean_architecture_template/core/utils/typedef.dart';
import 'package:clean_architecture_template/features/users/domain/entities/user_entity.dart';

abstract class UserRepository {
  FutureResult<List<DataEntity>> getAllUsers(int pageId);
  FutureResult<DataEntity> getUserDetails(int userId);
}
