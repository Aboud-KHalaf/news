part of 'descover_cubit.dart';

@immutable
abstract class DescoverState {}

class DescoverInitial extends DescoverState {}

class DescoverLoading extends DescoverState {}

class DescoverSuccess extends DescoverState {
  final List<NewsModel> newsByCatergory;

  DescoverSuccess({required this.newsByCatergory});
}

class DescoverFailure extends DescoverState {
  final String errMessage;

  DescoverFailure({required this.errMessage});
}
