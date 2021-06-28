import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/layout/cubit/cubit.dart';
import 'package:news_reader/layout/cubit/states.dart';
import 'package:news_reader/modules/web_view/web_view_screen.dart';



Widget tabTitle({required String title}) => Tab(
      child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
          )),
    );

Widget tabBlocConsumer({required var tab}) => BlocConsumer <NewsCubit,NewsStates>(
  listener: (context , state){},
  builder: (context,state){
    var list = tab;
    return articleBuilder(list, context);
  },
);


Widget buildArticleItem(article, context) => SafeArea(
      child: InkWell(
        onTap: () {
          navigateTo(context, WebViewScreen(article['url']));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
          child: Card(
            elevation: 20,
            shadowColor: Colors.black87,
            clipBehavior: Clip.none,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 400,
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    image:'${article['urlToImage']}',
                    placeholder:'assets/images/placeholder.jpg',
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Center(child: Text('No image available'));
                    },
                  ),
                ),
                Positioned(
                  bottom: 5,
                  child: SizedBox(
                    width: 350,
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),

                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${article['source']['name']}',
                              style: Theme.of(context).textTheme.bodyText1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '${article['title']}',
                              style: Theme.of(context).textTheme.bodyText1,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Opacity(
                                  opacity: .5,
                                  child: Text('${article['publishedAt']}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );


Widget defaultFormField({
  required TextEditingController? controller,
  required TextInputType type,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  VoidCallback? onTap,
  bool isPassword = false,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  void Function()? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndRemove(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.builder(
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticleItem(list[index], context),
          itemCount: list.length),
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );
