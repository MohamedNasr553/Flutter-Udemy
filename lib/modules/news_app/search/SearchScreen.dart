import 'package:flutter/material.dart';
import 'package:flutter_app/layout/news_app/cubit/cubit.dart';
import 'package:flutter_app/layout/news_app/cubit/states.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var list = NewsCubit.get(context).search;

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (state, context) {},
      builder: (state, context) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Search must not be empty!';
                    }
                  },
                  labelText: 'Search',
                  prefix: Icons.search,
                ),
              ),
              buildNewsAppPage(list, context, isSearch: true),
            ],
          ),
        );
      },
    );
  }
}
