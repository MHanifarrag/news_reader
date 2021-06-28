import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/layout/cubit/cubit.dart';
import 'package:news_reader/layout/cubit/states.dart';
import 'package:news_reader/modules/discover/discover_screen.dart';
import 'package:news_reader/shared/bloc_observer.dart';
import 'package:news_reader/shared/network/local/cache_helper.dart';
import 'package:news_reader/shared/network/remote/dio_helper.dart';
import 'package:news_reader/shared/styles/themes.dart';

Future<void> main () async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}
class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getHome()..getEntertainment()..getGeneral()..getHealth()..getScience()..getSports()..getTechnology(),),
        BlocProvider(create: (context) => AppCubit()..changeAppMode(fromShared: isDark)),
      ],
      child: BlocConsumer<AppCubit ,AppStates>(
listener: (context, state){},
builder: (context, state){
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News app',
      theme : lightTheme,
      darkTheme: darkTheme,
      themeMode: AppCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
      home: DiscoverScreen(),
  );
},
      ),
    );
  }
}
