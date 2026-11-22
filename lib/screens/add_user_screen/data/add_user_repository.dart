import 'package:getx_architecture_example/network/api_helpers/network_constants.dart';
import 'package:getx_architecture_example/network/api_provider/api_client.dart';
import 'package:getx_architecture_example/screens/add_user_screen/data/add_user_model.dart';

abstract interface class AddUserRepository {
  Future<AddUserModel> addUser({
    required String name,
    required String job,
  });
}

class ApiAddUserRepository implements AddUserRepository {
  ApiAddUserRepository(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<AddUserModel> addUser({
    required String name,
    required String job,
  }) async {
    final response = await _apiClient.post(
      apiUrl: NetworkConstants.usersUrl,
      params: <String, dynamic>{
        NetworkConstants.name: name,
        NetworkConstants.job: job,
      },
    );

    return AddUserModel.fromJson(response as Map<String, dynamic>);
  }
}
