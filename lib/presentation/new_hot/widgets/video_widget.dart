import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

class VideoWidget extends StatelessWidget {
  final String imageUrlPath;
  const VideoWidget({
    Key? key,
    required this.imageUrlPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: size.height * 0.3,
          child: Image.network(
            imageUrlPath,
            width: double.infinity,
            height: size.height * 0.3,
            fit: BoxFit.fill,
            loadingBuilder: (ctx, child, progress) {
              if (progress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            errorBuilder: (ctx, _, error) {
              return const Center(
                child: Icon(Icons.wifi_off_outlined),
              );
            },
          ),
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
