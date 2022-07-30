import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/search/widgets/search_results.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: kGreyColor.withOpacity(0.33),
                prefixIcon:  const Icon(
                CupertinoIcons.search,
                color: kGreyColor,
                ),
                suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,color: kGreyColor,),
                style: const TextStyle(
                  color: kWhiteColor,
                ),
              ),
              const Expanded(child:  SearchResultWidget()),
            ],
          ),
        ),
      ),
    );
  }
}