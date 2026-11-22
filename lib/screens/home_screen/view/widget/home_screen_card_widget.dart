import 'package:flutter/material.dart';
import 'package:getx_architecture_example/screens/home_screen/data/get_user_list_model.dart';

class HomeScreenCardWidget extends StatelessWidget {
  const HomeScreenCardWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final initial = user.name.trim().isEmpty ? '?' : user.name.trim()[0];

    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(initial.toUpperCase())),
        title: Text(user.name),
        subtitle: Text(user.email),
      ),
    );
  }
}
