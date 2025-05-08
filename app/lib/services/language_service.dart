class LanguageService {
  static final Map<String, Map<String, String>> messages = {
    'pt': {
      'userModule': 'Módulo de Usuários',
      'userName': 'Nome do Usuário',
      'registerUser': 'Cadastrar Usuário',
      'userList': 'Lista de Usuários',
      'darkTheme': 'Tema Escuro',
      'lightTheme': 'Tema Claro',
      'portuguese': 'Português',
      'english': 'Inglês',
    },
    'en': {
      'userModule': 'User Module',
      'userName': 'User Name',
      'registerUser': 'Register User',
      'userList': 'User List',
      'darkTheme': 'Dark Theme',
      'lightTheme': 'Light Theme',
      'portuguese': 'Portuguese',
      'english': 'English',
    },
  };

  static String getMessage(String key, String language) {
    return messages[language]?[key] ?? key;
  }
}
