import 'dart:async';

import 'package:search_assessment/core/model/model.dart';


abstract class UsersRepository {
  Future<UserListResponse> fetchUsers(String text);
}