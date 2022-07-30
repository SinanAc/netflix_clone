import 'package:flutter/material.dart';

class SearchTextTItle extends StatelessWidget {
  const SearchTextTItle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ));
  }
}
