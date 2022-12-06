

import '../repository/get_users.dart';
import '../repository/get_users_repository.dart';

class Injector {

  static final Injector _singleton = Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  UsersRepository get studentRepository {
    return GetUserRepository();
  }
}