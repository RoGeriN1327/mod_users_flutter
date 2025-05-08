import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final String language;
  final Function(String) onAddUser;

  UserForm({required this.language, required this.onAddUser});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: language == 'pt' ? 'Nome do Usuário' : 'User Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                onAddUser(value);
                _controller.clear();
              }
            },
          ),
          const SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                String value = _controller.text;
                if (value.isNotEmpty) {
                  onAddUser(value);
                  _controller.clear();
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                language == 'pt' ? 'Cadastrar' : 'Register',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
