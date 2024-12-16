import '../models/user_model.dart';
import '../services/user_api_service.dart';

class UserViewModel {
  final UserApiService _service = UserApiService();

  Future<List<UserModel>> getUsers() async {
    return await _service.fetchData();
  }
}
