import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String imgeUrl;
  const MainCard({
    Key? key,
    required this.imgeUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 13),
      height: MediaQuery.of(context).devicePixelRatio * 70,
      width: MediaQuery.of(context).devicePixelRatio * 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
            image: NetworkImage(imgeUrl),
            fit: BoxFit.cover,
          )),
    );
  }
}
