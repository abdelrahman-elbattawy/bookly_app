import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this._homeRepo) : super(NewsetBooksInitial());

  final HomeRepo _homeRepo;

  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());

    var results = await _homeRepo.fetchNewestBooks();

    results.fold(
      (failure) => emit(NewsetBooksFailure(errMessage: failure.errMessage)),
      (books) => emit(NewsetBooksSuccess(books: books)),
    );
  }
}
