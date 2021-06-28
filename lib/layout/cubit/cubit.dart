import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/layout/cubit/states.dart';
import 'package:news_reader/shared/network/local/cache_helper.dart';
import 'package:news_reader/shared/network/remote/dio_helper.dart';


class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);


  List<dynamic> business = [];

  void getHome()
  {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'us',
          'category': 'business',
          'apiKey': 'c699f537baf44e74a791c8664159541d',
        },
        ).then((value)
    {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error)
{
  print(error.toString());
  emit(NewsGetBusinessErrorState(error.toString()));
});
  }


  List<dynamic> entertainment = [];

  void getEntertainment()
  {
    emit(NewsGetEntertainmentLoadingState());

    if (entertainment.length == 0){

      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'us',
          'category': 'entertainment',
          'apiKey': 'c699f537baf44e74a791c8664159541d',
        },
      ).then((value)
      {
        entertainment = value.data['articles'];
        emit(NewsGetEntertainmentSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(NewsGetEntertainmentErrorState(error.toString()));
      });

    }else{
      emit(NewsGetEntertainmentSuccessState());
    }
  }

  List<dynamic> general = [];

  void getGeneral()
  {
    emit(NewsGetGeneralLoadingState());

    if (general.length == 0){

      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'us',
          'category': 'general',
          'apiKey': 'c699f537baf44e74a791c8664159541d',
        },
      ).then((value)
      {
        general = value.data['articles'];
        emit(NewsGetGeneralSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(NewsGetGeneralErrorState(error.toString()));
      });

    }else{
      emit(NewsGetGeneralSuccessState());
    }
  }


  List<dynamic> health = [];

  void getHealth()
  {
    emit(NewsGetHealthLoadingState());

    if (health.length == 0){

      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'us',
          'category': 'health',
          'apiKey': 'c699f537baf44e74a791c8664159541d',
        },
      ).then((value)
      {
        health = value.data['articles'];
        emit(NewsGetHealthSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(NewsGetHealthErrorState(error.toString()));
      });

    }else{
      emit(NewsGetHealthSuccessState());
    }
  }


  List<dynamic> science = [];

  void getScience()
  {
    emit(NewsGetScienceLoadingState());

    if (science.length == 0){

      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'us',
          'category': 'science',
          'apiKey': 'c699f537baf44e74a791c8664159541d',
        },
      ).then((value)
      {
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });

    }else{
      emit(NewsGetScienceSuccessState());
    }
  }


  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsGetSportsLoadingState());

    if (sports.length == 0){

      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'us',
          'category': 'sports',
          'apiKey': 'c699f537baf44e74a791c8664159541d',
        },
      ).then((value)
      {
        sports = value.data['articles'];
        emit(NewsGetSportsSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });

    }else{
      emit(NewsGetSportsSuccessState());
    }
  }




  List<dynamic> technology = [];

  void getTechnology()
  {
    emit(NewsGetTechnologyLoadingState());

    if (technology.length == 0){

      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'us',
          'category': 'technology',
          'apiKey': 'c699f537baf44e74a791c8664159541d',
        },
      ).then((value)
      {
        technology = value.data['articles'];
        emit(NewsGetTechnologySuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(NewsGetTechnologyErrorState(error.toString()));
      });

    }else{
      emit(NewsGetTechnologySuccessState());
    }
  }


  List<dynamic> search = [];
  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    search = [];

    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q': '$value',
        'apiKey': 'c699f537baf44e74a791c8664159541d',
      },
    ).then((value)
    {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }





}




class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool? fromShared})
  {
    if (fromShared != null)
    {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else
    {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });

    }
  }

}


