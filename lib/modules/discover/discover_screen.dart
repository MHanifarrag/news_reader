import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_reader/layout/cubit/cubit.dart';
import 'package:news_reader/layout/cubit/states.dart';
import 'package:news_reader/modules/search/search_screen.dart';
import 'package:news_reader/shared/components/components.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiscoverScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var getNewsCubit = NewsCubit.get(context);
var localization =AppLocalizations.of(context)!;

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state){
        return DefaultTabController(
        length: 7,
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            title: Text(localization.news,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0)),
            elevation: 0,
            actions: [
              IconButton(
                icon: FaIcon(FontAwesomeIcons.search),
                onPressed: (){
                  navigateTo(context,SearchScreen());
                },
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.adjust),
                onPressed: ()
                {
                  AppCubit.get(context).changeAppMode();
                },
              ),
            ],
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                tabTitle(title: localization.business),
                tabTitle(title: localization.technology),
                tabTitle(title: localization.general),
                tabTitle(title: localization.science),
                tabTitle(title: localization.health),
                tabTitle(title: localization.entertainment),
                tabTitle(title: localization.sports),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              tabBlocConsumer(tab: getNewsCubit.business),
              tabBlocConsumer(tab: getNewsCubit.technology),
              tabBlocConsumer(tab: getNewsCubit.general),
              tabBlocConsumer(tab: getNewsCubit.science),
              tabBlocConsumer(tab: getNewsCubit.health),
              tabBlocConsumer(tab: getNewsCubit.entertainment),
              tabBlocConsumer(tab: getNewsCubit.sports),
            ],
          ),
        ),
      );
      },
    );
  }
}


