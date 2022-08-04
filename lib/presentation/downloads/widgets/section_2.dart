import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/url.dart';
import 'package:netflix_clone/presentation/downloads/widgets/dwld_img.dart';

class Section2 extends StatelessWidget {
  const Section2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context).add(const GetDownloadsImages());
    });
    final Size size = MediaQuery.of(context).size;
    return Column(children: [
      const Text(
        'Introducing Downloads for you',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      kHeight10,
      const Text(
        'We will download a personalized selection of movies and shows for you, so there is always something to watch on your device',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: kGreyColor,
        ),
      ),
      BlocBuilder<DownloadsBloc, DownloadsState>(
        builder: (context, state) {
          return SizedBox(
            width: size.width,
            height: size.height * 0.48,
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.downloads.isEmpty
                    ? const Center(child: Text('Error while getting data'))
                    : Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          CircleAvatar(
                            radius: size.width * 0.34,
                            backgroundColor: kGreyColor[800],
                          ),
                          DownloadsImageWidget(
                            img:
                                '$imageAppendUrl${state.downloads[4].posterPath}',
                            margin: const EdgeInsets.only(right: 160),
                            angle: -20,
                            size: Size(size.width * 0.4, size.height * 0.28),
                          ),
                          DownloadsImageWidget(
                            img:
                                '$imageAppendUrl${state.downloads[6].posterPath}',
                            margin: const EdgeInsets.only(left: 160),
                            angle: 20,
                            size: Size(size.width * 0.4, size.height * 0.28),
                          ),
                          DownloadsImageWidget(
                            img:
                                '$imageAppendUrl${state.downloads[0].posterPath}',
                            margin: const EdgeInsets.only(top: 15),
                            size: Size(size.width * 0.42, size.height * 0.32),
                          )
                        ],
                      ),
          );
        },
      ),
    ]);
  }
}
