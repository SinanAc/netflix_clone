import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

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
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //lef-side
                CircleAvatar(
                  backgroundColor: kBlackColor.withOpacity(0.4),
                  radius: 25,
                  child: IconButton(
                    onPressed: (){}, 
                    icon:const Icon(Icons.volume_mute))
                    ),
                //right-side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const[
                    VideoActionsWidget(icon: Icons.emoji_emotions,title: 'LOL'),
                    VideoActionsWidget(icon: Icons.add,title: 'My List'),
                    VideoActionsWidget(icon: Icons.share_outlined, title: 'Share')
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

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget({Key? key,required this.icon,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,
        color: kWhiteColor,
        size: 30,
        ),
        Text(title),
        kHeight,
      ],
    );
  }
}