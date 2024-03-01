import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_impl.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this._searchRepoImpl) : super(SearchBooksInitial());

  final SearchRepoImpl _searchRepoImpl;

  Future<void> fetchSearchBooks({required String bookName}) async {
    emit(SearchBooksLoading());
    var results = await _searchRepoImpl.fetchSearchedBooks(bookName: bookName);

    results.fold(
        (failure) => emit(SearchBooksFailure(errMessage: failure.errMessage)),
        (books) => emit(SearchBooksSuccess(books: books)));
  }
}
