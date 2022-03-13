

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwes_app/shared/cubit/states2.dart';
import 'package:nwes_app/shared/network/local/cachehelper.dart';

class NewsAppCubit2 extends Cubit<NewsAppStates2> {
  NewsAppCubit2(NewsAppStates2 initialState) : super(initialState);

  // ignore: non_constant_identifier_names

  static NewsAppCubit2 get(context) => BlocProvider.of(context);
  bool isDark = false;
  void changeThemDark() {
    isDark = !isDark;
    CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
      emit(ChangeDarkThem());
    });


  }

}
