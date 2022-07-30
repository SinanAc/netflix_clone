import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/button_widget.dart';


class BackgroundHome extends StatelessWidget {
  const BackgroundHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).devicePixelRatio * 150,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(kMainImage),
                  fit: BoxFit.cover,
                )),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                       const ButtonWidget(icon: Icons.add,buttonText: 'My List'),
                      _playButton(),
                       const ButtonWidget(icon: Icons.info_outline,buttonText: 'Info'),
                      ],
                  ),
                ),
              )
            ],
          );
  }
    TextButton _playButton() {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kWhiteColor),
        ),
        icon: const Icon(Icons.play_arrow, size: 30, color: kBlackColor),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Play',
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: kBlackColor),
          ),
        ));
  }
}