import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/new_hot/widgets/coming_soon.dart';
import 'package:netflix_clone/presentation/new_hot/widgets/everyones.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenNewHot extends StatelessWidget {
  const ScreenNewHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const AppBarWidget(title: 'New & Hot'),
                  SizedBox(
                    height: 50,
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      bottom: TabBar(
                        tabs: const [
                          Tab(text: '🍿 Coming Soon'),
                          Tab(text: '👀 Everyones watching')
                        ],
                        indicator: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: kRadius30,
                        ),
                        labelColor: kBlackColor,
                        labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        unselectedLabelColor: kWhiteColor,
                        isScrollable: true,
                      ),
                    ),
                  )
                ],
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: TabBarView(children: [
            _buildComingSoon(context),
            _buildEveryones(),
          ]),
        ),
      ),
    );
  }

  Widget _buildComingSoon(context) {
    return ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) => const ComingSoonWidget(),
        separatorBuilder: (context, index) => kHeight15);
  }

  Widget _buildEveryones() {
    return ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) => const EveryonesWidget(),
        separatorBuilder: (context, index) => kHeight15);
  }
}
