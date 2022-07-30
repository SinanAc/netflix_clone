import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/search/widgets/search_results.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 13), 
      height: MediaQuery.of(context).devicePixelRatio*70,
      width: MediaQuery.of(context).devicePixelRatio*50,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image:  const DecorationImage(
          image:  NetworkImage(gridImage),
          fit: BoxFit.cover,
        )
      ),
    );
  }
}