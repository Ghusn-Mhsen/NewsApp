import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwes_app/modules/news_app/search/search.dart';
import 'package:nwes_app/shared/components/components.dart';
import 'package:nwes_app/shared/cubit/cubit.dart';
import 'package:nwes_app/shared/cubit/cubit2.dart';
import 'package:nwes_app/shared/cubit/states.dart';
import 'package:nwes_app/shared/network/remote/dio_helper.dart';

class NewsLayoutScreen extends StatelessWidget {
  const NewsLayoutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,state){},
      builder: (context,state){
        NewsAppCubit cubit = NewsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("App News"),
            actions: [
              IconButton(icon: Icon(Icons.search), onPressed:(){
                navigatorTo(context,SearchScreen());
              }),
              IconButton(icon: Icon(Icons.brightness_4), onPressed:(){
                NewsAppCubit2.get(context).changeThemDark();
              }),
            ],
          ),
          body:cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavigationBar(index);
            },
            items:cubit.list,
          ),
        );
      },
    );
  }
}
