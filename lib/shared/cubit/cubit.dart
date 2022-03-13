import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwes_app/modules/news_app/business/busines.dart';
import 'package:nwes_app/modules/news_app/science/science.dart';
import 'package:nwes_app/modules/news_app/sport/sport.dart';
import 'package:nwes_app/shared/cubit/states.dart';
import 'package:nwes_app/shared/network/remote/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit(NewsAppStates initialState) : super(initialState);

  // ignore: non_constant_identifier_names

  static NewsAppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screen = [BusinessScreen(), ScienceScreen(), SportScreen()];
  List<BottomNavigationBarItem> list = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "business"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "science"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "sport"),
  ];

  void changeBottomNavigationBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavigationBar());
  }

  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sport = [];
  List<dynamic> search = [];

  void getBusiness() {
    emit(NewsBusinessGetLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '6938a9cfa245488ca4a026d01b9288a5',
    }).then((value) {
      business = value.data['articles'];
      print(business[0]);
      emit(NewsBusinessGetSuccessState());
    }).catchError((error) {
      emit(NewsBusinessGetErrorState(error));
      print(error.toString());
    });
  }
  void getScience() {
    emit(NewsScienceGetLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '6938a9cfa245488ca4a026d01b9288a5',
    }).then((value) {
      science = value.data['articles'];
      emit(NewsScienceGetSuccessState());
    }).catchError((error) {
      emit(NewsScienceGetErrorState(error));
      print(error.toString());
    });
  }
  void getSport() {
    emit(NewsSportGetLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sport',
      'apiKey': '6938a9cfa245488ca4a026d01b9288a5',
    }).then((value) {
      sport = value.data['articles'];
      emit(NewsSportGetSuccessState());
    }).catchError((error) {
      emit(NewsSportGetErrorState(error));
      print(error.toString());
    });
  }
  void getSearch(String value) {
    emit(NewsSearchGetLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {

      'q': '$value',
      'apiKey': '6938a9cfa245488ca4a026d01b9288a5',
    }).then((value) {
      search = value.data['articles'];
      emit(NewsSearchGetSuccessState());
    }).catchError((error) {
      emit(NewsSearchGetErrorState(error));
      print(error.toString());
    });
  }
}
