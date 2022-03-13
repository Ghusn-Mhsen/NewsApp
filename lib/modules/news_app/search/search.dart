import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwes_app/shared/components/components.dart';
import 'package:nwes_app/shared/cubit/cubit.dart';
import 'package:nwes_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsAppCubit cubit = NewsAppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("Search"),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultTextFormField(
                    type: TextInputType.text,
                    label: "Search",
                    valid: (String value) {
                      if (value.isEmpty) {
                        return 'search must not be  empty';
                      }
                      return null;
                    },
                    prefix: Icon(Icons.search),
                    controller: search,
                    focus: true,
                    correct: true,
                    onChanged: (String value) {
                      cubit.getSearch(value);
                    },
                  ),
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: cubit.search.length > 0,
                    builder: (context) => ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return buildArticleItem(cubit.search[index], context);
                        },
                        separatorBuilder: (context, index) {
                          return myDriver();
                        },
                        itemCount: cubit.search.length),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
