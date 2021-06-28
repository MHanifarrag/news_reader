import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_reader/layout/cubit/cubit.dart';
import 'package:news_reader/layout/cubit/states.dart';
import 'package:news_reader/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
listener: (context,state){},
      builder: (context,state)
      {
        var list = NewsCubit.get(context).search;

  return Scaffold(
    appBar: AppBar(
    ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: defaultFormField(
              controller: searchController,
              type: TextInputType.text,
              onChange: (value)
              {
NewsCubit.get(context).getSearch(value);
              },
              validate: (String? value)
              {
                if(value!.isEmpty)
                {
                  return 'search must not be empty';
                }return null;
              },
              label: 'Search',
              prefix: FontAwesomeIcons.search),

        ),
        Expanded(child: articleBuilder(list, context ,isSearch: true)) ,
      ],
    ),
  );
      },
    );
  }
}
