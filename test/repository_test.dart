import 'package:flutter_test/flutter_test.dart';
import 'package:getx_architecture_example/network/api_provider/api_client.dart';
import 'package:getx_architecture_example/screens/add_user_screen/data/add_user_repository.dart';
import 'package:getx_architecture_example/screens/home_screen/data/home_repository.dart';

class _RecordingApiClient extends ApiClient {
  String? requestedMethod;
  String? requestedPath;
  Map<String, dynamic>? requestedBody;

  @override
  Future<dynamic> get({
    required String apiUrl,
    required Map<String, String> headers,
    Map<String, String>? query,
  }) async {
    requestedMethod = 'GET';
    requestedPath = apiUrl;
    return <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 1,
        'name': 'API User',
        'email': 'api@example.com',
      },
    ];
  }

  @override
  Future<dynamic> post({
    required String apiUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    Map<String, String>? query,
  }) async {
    requestedMethod = 'POST';
    requestedPath = apiUrl;
    requestedBody = params;
    return <String, dynamic>{...?params, 'id': 101};
  }
}

void main() {
  test('GET repository maps API JSON into domain-friendly users', () async {
    final client = _RecordingApiClient();
    final repository = ApiHomeRepository(client);

    final users = await repository.getUsers();

    expect(client.requestedMethod, 'GET');
    expect(client.requestedPath, '/users');
    expect(users.single.name, 'API User');
  });

  test('POST repository sends form values and maps the response', () async {
    final client = _RecordingApiClient();
    final repository = ApiAddUserRepository(client);

    final user = await repository.addUser(
      name: 'Created User',
      job: 'Developer',
    );

    expect(client.requestedMethod, 'POST');
    expect(client.requestedPath, '/users');
    expect(client.requestedBody, <String, dynamic>{
      'name': 'Created User',
      'job': 'Developer',
    });
    expect(user.id, '101');
  });
}
