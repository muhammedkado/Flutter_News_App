import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
Widget buildArticleItem(business,context)=> Padding(
  padding: const EdgeInsets.all(10.0),
  child: Row(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 125,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:  DecorationImage(
            image: NetworkImage(
                '${business['urlToImage'] ??  'https://media.istockphoto.com/vectors/loading-icon-vector-illustration-vector-id1335247217?k=20&m=1335247217&s=612x612&w=0&h=CQFY4NO0j2qc6kf4rTc0wTKYWL-9w5ldu-wF8D4oUBk='}'),
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
            children:  [
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
                style:
                const TextStyle(
                    color: Colors.grey,
                    fontSize: 10
                ),)
            ],
          ),
        ),
      ),
    ],
  ),
);
Widget articleBuilder(list, BuildContext context)=> ConditionalBuilder(
    condition: list.length > 0,
    builder: (context)=>ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder:  (context,index)=> buildArticleItem(list[index],context),
        separatorBuilder:(context,index)=>Container(color: Colors.grey,height: 1,),
        itemCount:list.length ) ,
    fallback: (context)=>const Center(child: CircularProgressIndicator())
);