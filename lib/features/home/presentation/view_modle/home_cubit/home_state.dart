part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<NewsModel> news;

  HomeSuccess(this.news);
}

class HomeFailure extends HomeState {
  final String errMessage;

  HomeFailure(this.errMessage);
}
