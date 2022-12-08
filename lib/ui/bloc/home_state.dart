part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSearchSuccess extends HomeState {
  const HomeSearchSuccess(this.response);

  final UserListResponse response;

  @override
  List<Object> get props => [response];
}

class HomeRepoSuccess extends HomeState {
  const HomeRepoSuccess(this.response);

  final GetUserRepositoryList response;

  @override
  List<Object> get props => [response];
}
class HomeError extends HomeState {
  const HomeError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
