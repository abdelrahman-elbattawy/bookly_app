import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/widgets/custom_text_field.dart';
import 'package:bookly_app/features/search/presentation/manger/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_app_bar.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchAppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPaddingView),
                child: CustomTextField(
                  hintText: 'Search',
                  iconData: FontAwesomeIcons.magnifyingGlass,
                  onChanged: (value) async {
                    if (value.isNotEmpty) {
                      await BlocProvider.of<SearchBooksCubit>(context)
                          .fetchSearchBooks(bookName: value);
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kPaddingView),
                child: SearchListView(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
