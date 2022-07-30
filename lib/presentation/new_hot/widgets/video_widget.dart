import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.network(
          'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/1uhf2qYd7wBcOsTJ7Li1FcH672D.jpg',
          width: double.infinity,
          height: size.height * 0.25,
          fit: BoxFit.cover,
        ),
        Positioned(
            bottom: 10,
            right: 10,
            child: CircleAvatar(
                radius: 22,
                backgroundColor: kBlackColor.withOpacity(0.3),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off,
                    color: kWhiteColor,
                    size: 20,
                  ),
                )))
      ],
    );
  }
}
