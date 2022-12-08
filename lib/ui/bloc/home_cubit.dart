import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/model/get_user_repository_list.dart';
import '../../core/model/user_list_response.dart';
import '../../core/repository/core_repository.dart';
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
      UserListResponse response = await coreRepository.fetchUsers(text);
      emit(HomeSearchSuccess(response));
    } catch (e) {
      String message = e.toString().replaceAll('api - ', '');
      emit(HomeError(message));
    }
  }

  void userRepo() async {
    emit(HomeLoading());
    try {
      GetUserRepositoryList response = await coreRepository.fetchUsersRepo();
      emit(HomeRepoSuccess(response));
    } catch (e) {
      String message = e.toString().replaceAll('api - ', '');
      emit(HomeError(message));
    }
  }
}
