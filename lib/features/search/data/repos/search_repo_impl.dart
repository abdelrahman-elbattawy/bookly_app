import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/search/data/repos/serach_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService _apiService;

  SearchRepoImpl({required ApiService apiService}) : _apiService = apiService;

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String bookName}) async {
    try {
      var data = await _apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=$bookName');

      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
