import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:search_assessment/core/model/get_user_repository_list.dart';
import '../apis/api_provider.dart';
import '../apis/app_apis.dart';
import '../model/user_list_response.dart';

/// User authentication API call goes here
class CoreRepository {
  CoreRepository() {
    _apiProvider = ApiProvider();
  }

  ApiProvider? _apiProvider;
  final List<File> landingPageFiles = [];
  bool ret = false;

  ApiProvider get apiProvider => _apiProvider!;

  Future<dynamic> fetchUsers(String text) async {
    Map<String, String> qParams = {
      'q': text,
    };
    final response = await apiProvider.get(Apis.searchUser,qParams);
    var responseJson = json.decode(response.data!);
    return responseJson;
  }

  Future<GetUserRepositoryList> fetchUsersRepo() async {
    Map<String, String> qParams = {
      'direction': 'asc',
    };
    final response = await apiProvider.get(Apis.repoUser,qParams);
    if (kDebugMode) {
      print('response 1 $response');
    }
    GetUserRepositoryList userRepositoryListResponse = GetUserRepositoryList.fromJson(response);
    if (kDebugMode) {
      print('response 2 $userRepositoryListResponse');
    }
    return userRepositoryListResponse;
  }
}
