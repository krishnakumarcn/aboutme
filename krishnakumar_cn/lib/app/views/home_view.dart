import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/svg.dart';
import 'package:krishnakumar_cn/app/views/details_desktop_view.dart';
import 'package:krishnakumar_cn/bloc/app_bloc.dart';
import 'package:krishnakumar_cn/helpers/assets.dart';
import 'package:krishnakumar_cn/helpers/ui/screen_type_layout.dart';
import 'package:url_launcher/url_launcher.dart';

import 'external_links.dart';
import 'overview_pane.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomeMobile(),
      desktop: HomeDesktop(),
    );
  }
}

class HomeMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final workExperienceTilesData =
        context.watch<AppBloc>().state.workExperiences;
    final educationTilesData = context.watch<AppBloc>().state.educationData;
    final techTilesData = context.watch<AppBloc>().state.techData;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 32,
                  width: 32,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(32)),
                  child: ClipOval(child: Image.asset(Assets.kkImage))),
              SizedBox(width: 12),
              ExternalLinks(),
            ],
          ),
          backgroundColor: Theme.of(context).accentColor,
          centerTitle: false,
          primary: true,
          expandedHeight: 420.0,
          pinned: true,
          floating: false,
          snap: false,
          elevation: 20,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                SizedBox(height: 64),
                OverviewPane(),
              ],
            ),
            titlePadding: EdgeInsets.all(16),
          ),
        ),
        SliverStickyHeader(
          header: new Container(
            height: 60.0,
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: new Text(
              '00. Work Experience',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 18, right: 18, bottom: 12, top: 12),
                child: WorkExperienceTile(
                  workExperience: workExperienceTilesData?.elementAt(index),
                ),
              );
            }, childCount: workExperienceTilesData?.length ?? 0),
          ),
        ),
        SliverStickyHeader(
          header: new Container(
            height: 60.0,
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: new Text(
              '01. Education',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 18, right: 18, bottom: 12, top: 12),
                child: EducationTile(
                  educationData: educationTilesData?.elementAt(index),
                ),
              );
            }, childCount: educationTilesData?.length ?? 0),
          ),
        ),
        SliverStickyHeader(
          header: new Container(
            height: 60.0,
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: new Text(
              '02. Technologies',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 18, right: 18, top: 12, bottom: 48),
                child: TechTile(
                  techData: techTilesData?.elementAt(index),
                ),
              );
            }, childCount: techTilesData?.length ?? 0),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(bottom: 12),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async {
                      if (await canLaunch('https://www.flutter.dev')) {
                        launch('https://www.flutter.dev');
                      }
                    },
                    child: SvgPicture.asset(
                      Assets.flutterIcon,
                      color: Color(0xff4d4d4d),
                      height: 52,
                    ),
                  ),
                  Text(
                    'krishnakumarcn\nmade with Flutter',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: () async {
            if (await canLaunch('https://www.flutter.dev')) {
              launch('https://www.flutter.dev');
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'krishnakumarcn',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.caption,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 2),
                child: SvgPicture.asset(
                  Assets.flutterIcon,
                  color: Color(0xff4d4d4d),
                  height: 24,
                ),
              ),
              Text(
                'made with Flutter',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(width: 80),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 48),
            Container(
                height: 32,
                width: 32,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(32)),
                child: ClipOval(child: Image.asset(Assets.kkImage))),
            SizedBox(width: 12),
            Expanded(
                child: Text(
              "Krishnakumar CN",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Colors.white),
            ))
          ],
        ),
        actions: [
          ExternalLinks(),
          SizedBox(width: 48),
        ],
      ),
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 2,
              child: SingleChildScrollView(child: OverviewPane()),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.10),
            Flexible(
              flex: 3,
              child: DetailsDesktopView(),
            ),
          ],
        ),
      ),
    );
  }
}
