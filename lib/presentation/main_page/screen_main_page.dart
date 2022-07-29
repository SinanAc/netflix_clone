import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/downloads/screen_dwld.dart';
import 'package:netflix_clone/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_clone/presentation/home/screen_home.dart';
import 'package:netflix_clone/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone/presentation/new_hot/screen_new_hot.dart';
import 'package:netflix_clone/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({Key? key}) : super(key: key);

  final _pages = [
    const ScreenHome(),
    const ScreenNewHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
      SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
           builder: (context,int index, _) {
             return _pages[index];
         }),
      ),
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}