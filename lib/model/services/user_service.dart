import 'package:dio/dio.dart';

import '../models/user_model.dart';

class UserService {
  late Dio _dio;
  UserService() {
    _dio = Dio();
  }
  int currentPage = 1;
  int perPage = 10;

  Future<List<UserModel>> getUser() async {
    try {
      String url =
          'https://reqres.in/api/users?page=$currentPage&per_page=$perPage';
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List datas = response.data["data"];
        return datas.map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw "get users failed";
      }
    } catch (e) {
      rethrow;
    }
  }
}
