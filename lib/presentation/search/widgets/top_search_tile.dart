import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/search_idle.dart';

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 85,
          width: screenWidth * 0.38,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            image:
                DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
          ),
        ),
        kWidth,
        const Expanded(
            child: Text(
          'Movie Name',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )),
        const Icon(CupertinoIcons.play_circle, color: kWhiteColor, size: 40),
      ],
    );
  }
}
