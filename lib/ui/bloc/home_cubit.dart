import 'dart:collection';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/core.dart';
import 'package:equatable/equatable.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.coreRepository) : super(HomeInitial());
  final CoreRepository coreRepository;

  void searchUser({
    required String text,
  }) async {
    emit(HomeLoading());
    try {
      dynamic response = await coreRepository.fetchUsers(text);
      final LinkedHashMap<String, dynamic> searchItems =
          LinkedHashMap.from(response);
      emit(HomeSearchSuccess(UserListResponse.fromJson(searchItems)));
    } catch (e) {
      String message = e.toString().replaceAll('api - ', '');
      emit(HomeError(message));
    }
  }

  void userRepo(String userName) async {
    emit(HomeLoading());
    try {
      dynamic response = await coreRepository.fetchUsersRepo(userName);
      final List contactItems = response;
      contactItems
          .map((contactRaw) => GetUserRepositoryList.fromJson(contactRaw))
          .toList();

      emit(HomeRepoSuccess(contactItems
          .map((contactRaw) => GetUserRepositoryList.fromJson(contactRaw))
          .toList()));
    } catch (e) {
      String message = e.toString().replaceAll('api - ', '');
      emit(HomeError(message));
    }
  }
}
