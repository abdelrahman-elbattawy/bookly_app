import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const BookDetailAppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPaddingView),
                child: BookDetailsSection(
                  bookModel: bookModel,
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kPaddingView),
                child: SimilarBooksSection(),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}
