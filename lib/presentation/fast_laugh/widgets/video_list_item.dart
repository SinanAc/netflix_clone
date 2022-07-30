import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/fast_laugh/widgets/actions.dart';
import 'package:netflix_clone/presentation/search/widgets/search_idle.dart';

class VideoListItem extends StatelessWidget {
  final int index; 
  const VideoListItem({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //lef-side
                CircleAvatar(
                  backgroundColor: kBlackColor.withOpacity(0.4),
                  radius: 23,
                  child: IconButton(
                    onPressed: (){}, 
                    icon:const Icon(Icons.volume_off,size: 25))
                    ),
                //right-side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const[
                    CircleAvatar(
                      radius: 33,
                      backgroundImage: NetworkImage(imgUrl),
                    ),
                    SizedBox(height: 25),
                    ActionsWidget(icon: Icons.emoji_emotions,title: 'LOL'),
                    kHeight15,
                    ActionsWidget(icon: Icons.add,title: 'My List'),
                    kHeight15,
                    ActionsWidget(icon: Icons.send_outlined, title: 'Share',isShare: true),
                    kHeight15,
                    ActionsWidget(icon: Icons.play_arrow, title: 'Play'),
                    kHeight15
                  ],
                )    
              ],
            ),
          ),
        )
      ],
    );
  }
}