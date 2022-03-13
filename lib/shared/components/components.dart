import 'package:flutter/material.dart';
Widget buildArticleItem(business, context ){
  return  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${business['urlToImage']}'),
                fit: BoxFit.cover,
              )
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text("${business['title']}",style:Theme.of(context).textTheme.bodyText1 ,maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Expanded(
                  child: Text("${business['publishedAt']}",style: TextStyle(
                      color: Colors.grey
                  ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )

              ],
            ),
          ),
        ),
      ],
    ),
  );
}
Widget myDriver()=> Padding(
  padding: const EdgeInsetsDirectional.only(start:20),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey,
  ),
);
void navigatorTo(context,Widget screen){
  Navigator.push(context,MaterialPageRoute(builder: (context)=>screen));
}
Widget defaultTextFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  @required String label,
  @required Icon prefix,
  @required Function valid,
  bool correct = true,
  bool focus = true,
  bool isPassword = false,
  Icon suffix,
  Function onChanged,
  Function onSubmitted,
  Function suffixPressed,
  Function onTap,
}) =>
    TextFormField(
      validator: valid,
      onTap: onTap,
      controller: controller,
      keyboardType: type,
      autocorrect: true,
      autofocus: true,
      textAlign: TextAlign.start,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(
          icon: suffix,
          onPressed: suffixPressed,
        )
            : null,
      ),
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );