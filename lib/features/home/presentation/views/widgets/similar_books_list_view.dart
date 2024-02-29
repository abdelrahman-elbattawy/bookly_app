import 'package:bookly_app/core/widgets/custom_circle_indicator.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if (state is SimilarBooksSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 5),
                child: CustomBookImage(
                  borderRadius: BorderRadius.circular(8),
                  imageUrl:
                      state.books[index].volumeInfo!.imageLinks?.thumbnail ??
                          '',
                ),
              ),
            );
          } else if (state is SimilarBooksFaliure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else {
            return const CustomCircleIndicator();
          }
        },
      ),
    );
  }
}
