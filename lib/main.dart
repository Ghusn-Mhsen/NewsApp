import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwes_app/shared/bloc_observer.dart';
import 'package:nwes_app/shared/cubit/cubit.dart';
import 'package:nwes_app/shared/cubit/cubit2.dart';
import 'package:nwes_app/shared/cubit/states.dart';
import 'package:nwes_app/shared/cubit/states2.dart';
import 'package:nwes_app/shared/network/local/cachehelper.dart';
import 'package:nwes_app/shared/network/remote/dio_helper.dart';
import 'package:nwes_app/shared/thems/them.dart';
import 'layout/news_app/news_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
   await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (context) => NewsAppCubit2(InitialState2()),),
        BlocProvider( create: (BuildContext context)=>NewsAppCubit(InitialState())..getBusiness()..getScience()..getSport(),),

      ],
      child: BlocConsumer<NewsAppCubit2, NewsAppStates2>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightThem,
            darkTheme: darkThem,
             themeMode:CacheHelper.getData(key: 'isDark')?ThemeMode.dark:ThemeMode.light ,//NewsAppCubit2.get(context).isDark
            //     ? ThemeMode.dark
            //     : ThemeMode.light,
            home: NewsLayoutScreen(),
          );
        },
      ),
    );
  }
}
