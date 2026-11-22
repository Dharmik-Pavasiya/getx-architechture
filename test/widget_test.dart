import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_example/screens/home_screen/controller/home_controller.dart';
import 'package:getx_architecture_example/screens/home_screen/data/get_user_list_model.dart';
import 'package:getx_architecture_example/screens/home_screen/data/home_repository.dart';
import 'package:getx_architecture_example/screens/home_screen/view/home_screen_view.dart';

class _FakeHomeRepository implements HomeRepository {
  @override
  Future<List<User>> getUsers() async => const <User>[
        User(id: 1, name: 'Sample User', email: 'user@example.com'),
      ];
}

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(Get.reset);

  testWidgets('renders users supplied by the injected repository',
      (tester) async {
    Get.put(HomeController(_FakeHomeRepository()));

    await tester.pumpWidget(
      const GetMaterialApp(home: HomeScreenView()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Sample User'), findsOneWidget);
    expect(find.text('user@example.com'), findsOneWidget);
  });
}
