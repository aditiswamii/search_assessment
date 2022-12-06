import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:search_assessment/core/apis/api_provider.dart';
import 'package:search_assessment/core/model/model.dart';
import '../apis/app_apis.dart';
import 'get_users_repository.dart';

class GetUserRepository implements UsersRepository {

  @override
  Future<UserListResponse> fetchUsers(String parentId) async {
    final response = await ApiProvider().get(Apis.searchUser);
    if (kDebugMode) {
      print('response 1 $response');
    }
    UserListResponse userListResponse = UserListResponse.fromJson(response);
    if (kDebugMode) {
      print('response 2 $userListResponse');
    }
    return userListResponse;
  }
}
