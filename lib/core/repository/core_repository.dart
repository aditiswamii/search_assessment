import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import '../apis/api_provider.dart';
import '../apis/app_apis.dart';

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
    final response = await apiProvider.get(Apis.searchUser, qParams);
    var responseJson = json.decode(response.data!);
    return responseJson;
  }

  Future<dynamic> fetchUsersRepo(String userName) async {
    Map<String, String> qParams = {
      'direction': 'asc',
    };
    final response =
        await apiProvider.get('${Apis.repoUser}/$userName/repos', qParams);
    if (kDebugMode) {
      print('response 1 $response');
    }
    var responseJson = json.decode(response.data!);
    return responseJson;
  }
}
