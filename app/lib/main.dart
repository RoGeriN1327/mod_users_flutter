import 'package:flutter/material.dart';
import 'components/menu.dart';
import 'components/user_form.dart';
import 'components/user_list.dart';
import 'services/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isDarkTheme;
  late String language;
  List<String> users = [];

  @override
  void initState() {
    super.initState();
    isDarkTheme = LocalStorageService.getTheme();
    language = LocalStorageService.getLanguage();
    users = LocalStorageService.getUsers();
  }

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
      LocalStorageService.saveTheme(isDarkTheme);
    });
  }

  void toggleLanguage() {
    setState(() {
      language = language == 'pt' ? 'en' : 'pt';
      LocalStorageService.saveLanguage(language);
    });
  }

  void addUser(String user) {
    setState(() {
      users.add(user);
      LocalStorageService.saveUsers(users);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(language == 'pt' ? 'Módulo de Usuários' : 'User Module'),
        ),
        body: Column(
          children: [
            AccessibilityMenu(
              isDarkTheme: isDarkTheme,
              language: language,
              onThemeChange: toggleTheme,
              onLanguageChange: toggleLanguage,
            ),
            UserForm(language: language, onAddUser: addUser),
            Expanded(child: UserList(users: users, language: language)),
          ],
        ),
      ),
    );
  }
}
