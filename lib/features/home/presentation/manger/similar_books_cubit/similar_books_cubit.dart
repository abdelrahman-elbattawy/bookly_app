import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this._homeRepo) : super(SimilarBooksInitial());

  final HomeRepo _homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());

    var results = await _homeRepo.fetchSimilarBooks(category: category);

    results.fold(
      (failure) => emit(SimilarBooksFaliure(errMessage: failure.errMessage)),
      (books) => emit(SimilarBooksSuccess(books: books)),
    );
  }
}
