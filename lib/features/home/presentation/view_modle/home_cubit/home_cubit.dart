// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:news/features/home/data/models/news_model/news_model.dart';
import 'package:news/features/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;

  Future<void> fetchBreakingNews({required String country}) async {
    emit(HomeInitial());
    var result = await homeRepo.fetchBreakingNews(country: country);
    result.fold(
      (l) {
        emit(HomeFailure(l.errorMessage));
      },
      (r) {
        emit(
          HomeSuccess(r),
        );
      },
    );
  }
}
