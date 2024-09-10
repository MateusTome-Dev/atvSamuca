import 'package:first_app/models/user_model.dart';
import 'package:first_app/widgets/UserCard.dart';

import 'package:flutter/material.dart';

class ShowUserScreen extends StatelessWidget {
  const ShowUserScreen({
    super.key,
    required this.users,
  });

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: UserCard(users: users),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
