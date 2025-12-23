import 'package:clean_architecture_template/features/users/data/models/user_model.dart';

abstract class UserDataSource {
  Future<List<DataModel>> getAllUsers(int pageId);
  Future<DataModel> getUserDetails(int userId);
}
