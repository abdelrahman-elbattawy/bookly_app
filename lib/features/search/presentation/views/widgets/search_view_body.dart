import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/widgets/custom_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_app_bar.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchAppBar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kPaddingView),
                child: CustomTextField(),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
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
