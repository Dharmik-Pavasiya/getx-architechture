import 'package:flutter_test/flutter_test.dart';
import 'package:getx_architecture_example/screens/home_screen/controller/home_controller.dart';
import 'package:getx_architecture_example/screens/home_screen/data/get_user_list_model.dart';
import 'package:getx_architecture_example/screens/home_screen/data/home_repository.dart';

class _SuccessfulRepository implements HomeRepository {
  @override
  Future<List<User>> getUsers() async => const <User>[
        User(id: 7, name: 'Test User', email: 'test@example.com'),
      ];
}

class _FailingRepository implements HomeRepository {
  @override
  Future<List<User>> getUsers() => Future<List<User>>.error('request failed');
}

void main() {
  test('loads users from the repository', () async {
    final controller = HomeController(_SuccessfulRepository());

    await controller.getUsers();

    expect(controller.isLoading.value, isFalse);
    expect(controller.errorMessage.value, isNull);
    expect(controller.users.single.name, 'Test User');
  });

  test('exposes repository failures to the view', () async {
    final controller = HomeController(_FailingRepository());

    await controller.getUsers();

    expect(controller.isLoading.value, isFalse);
    expect(controller.users, isEmpty);
    expect(controller.errorMessage.value, contains('request failed'));
  });
}
