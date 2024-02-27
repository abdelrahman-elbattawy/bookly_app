import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              BookDetailAppBar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kPaddingView),
                child: BookDetailsSection(),
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kPaddingView),
                child: SimilarBooksSection(),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}
