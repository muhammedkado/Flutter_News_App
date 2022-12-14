import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:newsapp/layout/cuibt/cuibt.dart';
import 'package:newsapp/modules/webviwe/web_screen.dart';

NewCubit cubit = NewCubit();
Widget buildArticleItem(business, context) => InkWell(
      onTap: () {
        navigatorTo(
          context: context,
          Widget: WebView_Screen(
            url: business['url'],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 125,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                      '${business['urlToImage'] ?? 'https://upmaa-pennmuseum.netdna-ssl.com/collections/images/image_not_available_300.jpg'}'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${business['title']}',
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${business['publishedAt']}',
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
Widget articleBuilder(list, BuildContext context,{isSerach=false}) => ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => Container(
              color: Colors.grey,
              height: 1,
            ),
        itemCount: list.length),
    fallback: (context) => isSerach?const Center(
      child:Text('There is no result',style: TextStyle(color: Colors.grey),),
    ): const Center(child: CircularProgressIndicator()));

void navigatorTo({context, Widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
