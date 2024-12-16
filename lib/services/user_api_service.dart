import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';
import 'api_service.dart';

class UserApiService extends ApiService<UserModel> {
  @override
  Future<List<UserModel>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception("Failed to load user data");
    }
  }
}
