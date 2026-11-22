import 'package:getx_architecture_example/network/api_helpers/network_constants.dart';
import 'package:getx_architecture_example/network/api_provider/api_client.dart';
import 'package:getx_architecture_example/screens/home_screen/data/get_user_list_model.dart';

/// Contract consumed by the controller. Depending on this interface makes the
/// feature easy to test with an in-memory fake.
abstract interface class HomeRepository {
  Future<List<User>> getUsers();
}

/// API-backed implementation registered by the route binding.
class ApiHomeRepository implements HomeRepository {
  ApiHomeRepository(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<List<User>> getUsers() async {
    final response = await _apiClient.get(
      apiUrl: NetworkConstants.usersUrl,
      headers: const <String, String>{},
    );

    final items = response as List<dynamic>;
    return items
        .map((item) => User.fromJson(item as Map<String, dynamic>))
        .toList(growable: false);
  }
}
