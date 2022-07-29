import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);
  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(title: 'Downloads')),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: _widgetList.length,
        itemBuilder: (context, index) =>  _widgetList[index],
        separatorBuilder: (context, index) =>const SizedBox(height: 20),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);
  final List imageList = [
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/13r1DFhfL0qufFjXnrvWuh6qKqH.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ryKwNlAfDXu0do6SX9h4G9Si1kG.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/y4BbshOj69MOIhsm0oELDnymiTY.jpg",
  ];
  @override
  Widget build(BuildContext context) {
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
      kHeight,
      const Text(
        'We will download a personalized selection of movies and shows for you, so there is always something to watch on your device',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: kGreyColor,
        ),
      ),
      SizedBox(
        width: size.width,
        height: size.height * 0.48,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CircleAvatar(
              radius: size.width * 0.38,
              backgroundColor: kGreyColor[800],
            ),
            DownloadsImageWidget(
              img: imageList[2],
              margin: const EdgeInsets.only(right: 160),
              angle: -20,
              size: Size(size.width * 0.4, size.height * 0.28),
            ),
            DownloadsImageWidget(
              img: imageList[1],
              margin: const EdgeInsets.only(left: 160),
              angle: 20,
              size: Size(size.width * 0.4, size.height * 0.28),
            ),
            DownloadsImageWidget(
              img: imageList[0],
              margin: const EdgeInsets.only(top: 15),
              size: Size(size.width * 0.42, size.height * 0.32),
            )
          ],
        ),
      ),
    ]);
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {},
              color: kBlueColor[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Setup',
                  style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: kWhiteColor,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('See what you can download',
                  style: TextStyle(
                      color: kBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ))
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(Icons.settings, color: kWhiteColor),
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.img,
    this.angle = 0,
    required this.margin,
    required this.size,
  }) : super(key: key);

  final String img;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
