import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final List<String> users;
  final String language;

  const UserList({Key? key, required this.users, required this.language})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          child: ListTile(
            title: Text(user),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {},
          ),
        );
      },
    );
  }
}
