import 'package:flutter/material.dart';
import 'package:netflix_clone/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/url.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/presentation/fast_laugh/widgets/actions.dart';
import 'package:netflix_clone/presentation/fast_laugh/widgets/video_play.dart';
import 'package:share_plus/share_plus.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget childWidget;
  final Downloads movieData;

  const VideoListItemInheritedWidget(
      {Key? key, required this.childWidget, required this.movieData})
      : super(key: key, child: childWidget);
  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

final _videoUrls = [
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
];

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final imgPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final vidUrl = _videoUrls[index % _videoUrls.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl: vidUrl, onStateChanged: (bool) {}),
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
                        onPressed: () {},
                        icon: const Icon(Icons.volume_off, size: 25))),
                //right-side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 33,
                      backgroundImage: NetworkImage('$imageAppendUrl$imgPath'),
                    ),
                    const SizedBox(height: 25),
                    ValueListenableBuilder(
                      valueListenable: likedVideoIDsNotifier,
                      builder: (context, Set<int> newLikedIDs, _) {
                        if (newLikedIDs.contains(index)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideoIDsNotifier.value.remove(index);
                              likedVideoIDsNotifier.notifyListeners();
                            },
                            child: const ActionsWidget(
                                icon: Icons.favorite, title: 'Liked'),
                          );
                        }
                        return GestureDetector(
                            onTap: () {
                              likedVideoIDsNotifier.value.add(index);
                              likedVideoIDsNotifier.notifyListeners();
                            },
                            child: const ActionsWidget(
                                icon: Icons.emoji_emotions, title: 'LOL'));
                      },
                    ),
                    kHeight15,
                    const ActionsWidget(icon: Icons.add, title: 'My List'),
                    kHeight15,
                    GestureDetector(
                      onTap: () {
                        Share.share(vidUrl);
                      },
                      child: const ActionsWidget(
                          icon: Icons.send_outlined,
                          title: 'Share',
                          isShare: true),
                    ),
                    kHeight15,
                    const ActionsWidget(icon: Icons.play_arrow, title: 'Play'),
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
