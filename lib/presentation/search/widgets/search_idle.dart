import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const imgUrl = 'https://www.themoviedb.org/t/p/w250_and_h141_face/iczRRWCXjNsDmiHoVejomBqiwuG.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        kHeight,
        const SearchTextTItle(title: 'Top Searches'),
        kHeight, 
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) => const TopSearchItemTile(), 
            separatorBuilder: (ctx, index) => const SizedBox(height: 15), 
            itemCount: 10
            ),
        )  , 
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
       Container(
        height: 85,
        width: screenWidth*0.38,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover
            ),
        ),
       ),
       kWidth,
       const Expanded(child: Text('Movie Name',
       style: TextStyle(
         fontSize: 16,
         fontWeight: FontWeight.bold,
       ),
       )),
        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 23,
          child:  CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 21,
            child:  Icon(Icons.play_arrow,color: kWhiteColor,),
          )
       ) 
      ],
    );
  }
}
