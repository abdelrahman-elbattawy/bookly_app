import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this._homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo _homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var results = await _homeRepo.fetchFeaturedBooks();

    results.fold(
      (failure) => emit(FeaturedBooksFailure(errMessage: failure.errMessage)),
      (books) => emit(FeaturedBooksSuccess(books: books)),
    );
  }
}
