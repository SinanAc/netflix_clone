import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/presentation/downloads/widgets/section_2.dart';
import 'package:netflix_clone/presentation/downloads/widgets/section_3.dart';
import 'package:netflix_clone/presentation/downloads/widgets/smart_download.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);
  final _widgetList = [
    const SmartDownloads(),
    const Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context).add(const GetDownloadsImages());
    });
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(title: 'Downloads')),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: _widgetList.length,
        itemBuilder: (context, index) => _widgetList[index],
        separatorBuilder: (context, index) => const SizedBox(height: 20),
      ),
    );
  }
}
