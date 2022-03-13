import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwes_app/shared/components/components.dart';
import 'package:nwes_app/shared/cubit/cubit.dart';
import 'package:nwes_app/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsAppCubit cubit = NewsAppCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.business.length>0,
          builder: (context) => ListView.separated(
            physics:BouncingScrollPhysics() ,
              itemBuilder: (context, index) {
                return buildArticleItem(cubit.business[index],context);
              },
              separatorBuilder: (context, index) {
                return myDriver();
              },
              itemCount: cubit.business.length),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
