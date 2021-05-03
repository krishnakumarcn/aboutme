import 'package:flutter/material.dart';
import 'package:krishnakumar_cn/app/models/detailed_tile.dart';
import 'package:krishnakumar_cn/bloc/app_bloc.dart';
import 'package:krishnakumar_cn/enums/sections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RightPane extends StatefulWidget {
  @override
  _RightPaneState createState() => _RightPaneState();
}

class _RightPaneState extends State<RightPane> {
  List<DetailedTile> workExperienceTiles = [
    DetailedTile(
      subtitle: 'Lead Engineer, 2019-Present',
      title: 'Flujo',
      description:
          '''Flujo is a communication & collaboration suite for teams. With natively built key business essentials like messaging, audio and video calling, drive, meetings, tasks, calendar, notes, and kanbans, Flujo helps to eliminate the clutter of team collaboration. As the head of Flujo mobile, strategized, designed, and built the Flujo mobile application''',
    ),
    DetailedTile(
      subtitle: 'Software Engineer, 2018-2019',
      title: 'Nissan Motor Corporation',
      description:
          '''Nissan Digital is a subsidiary of Nissan Motor Corporation, a global automotive OEM, and the world's largest EV manufacturer that transforms the automobile business using Digital Technologies.''',
    ),
    DetailedTile(
      subtitle: 'Software Engineer, 2017-2018',
      title: 'Tismo',
      description:
          '''Tismo is a design engineering firm that offers product realization services from concept to end-product. As a fresh graduate engineer at Tismo, had the opportunity to work on a variety of projects and gained knowledge in different areas of Software Engineering.''',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedSection = context.watch<AppBloc>().state.selectedSection;
    var tiles = [];
    switch (selectedSection) {
      case Section.WorkExperience:
        tiles = workExperienceTiles;
        break;
      case Section.Projects:
        break;
      case Section.Tech:
        break;
      case Section.Personal:
        break;
      default:
        break;
    }

    return Container(
      padding: EdgeInsets.only(
        right: 82,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final tileItem = tiles.elementAt(index);
          return Container(
            margin: EdgeInsets.only(bottom: 12, top: index == 0 ? 82 : 0),
            padding: EdgeInsets.all(18),
            color: Theme.of(context).accentColor,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    tileItem.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(letterSpacing: 1, fontSize: 18),
                  ),
                  SizedBox(height: 4),
                  Text(
                    tileItem.subtitle,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        color: Colors.white.withOpacity(
                          0.7,
                        ),
                        letterSpacing: 2,
                        height: 1),
                  ),
                  SizedBox(height: 12),
                  Text(
                    tileItem.description,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(),
                  )
                ]),
          );
        },
        itemCount: tiles.length,
      ),
    );
  }
}
