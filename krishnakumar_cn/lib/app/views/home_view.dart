import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krishnakumar_cn/app/models/work_experience.dart';
import 'package:krishnakumar_cn/app/views/details_pane.dart';
import 'package:krishnakumar_cn/bloc/app_bloc.dart';
import 'package:krishnakumar_cn/enums/sections.dart';
import 'package:krishnakumar_cn/helpers/assets.dart';
import 'package:krishnakumar_cn/helpers/assets.dart';
import 'package:krishnakumar_cn/helpers/ui/screen_type_layout.dart';
import 'package:url_launcher/url_launcher.dart';

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
          floating: true,
          snap: false,
          elevation: 10,
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
        SliverSubHeader(
          text: '00. Work Experience',
          backgroundColor: Colors.black,
        ),
        SliverList(
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
        SliverSubHeader(
          text: '01. Education',
          backgroundColor: Colors.black,
        ),
        SliverList(
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
        SliverSubHeader(
          text: '02. Technologies',
          backgroundColor: Colors.black,
        ),
        SliverList(
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
        SliverToBoxAdapter(
          child: Container(
            child: Center(
              child: Text(
                'krishnakumarcn\nmade with Flutter',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ),
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // SizedBox(width: 8),
            Container(
                height: 32,
                width: 32,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(32)),
                child: ClipOval(child: Image.asset(Assets.kkImage))),
            SizedBox(width: 12),
          ],
        ),
        actions: [
          ExternalLinks(),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              OverviewPane(),
              SizedBox(height: MediaQuery.of(context).size.width * 0.10),
              DetailsPane(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        child: Text(
          'krishnakumarcn\nmade with Flutter',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.caption,
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
              child: DetailsPane(),
            ),
          ],
        ),
      ),
    );
  }
}

class ExternalLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getLinkIcon(
            asset: Assets.linkedinIcon,
            url: 'https://www.linkedin.com/in/krishnakumarcn'),
        SizedBox(width: 12),
        getLinkIcon(
            asset: Assets.stackoverflowIcon,
            url:
                "https://stackoverflow.com/users/5546443/krishnakumarcn?tab=profile"),
        SizedBox(width: 12),
        getLinkIcon(
            asset: Assets.githubIcon,
            url: "https://github.com/krishnakumarcn/"),
        SizedBox(width: 12),
        getLinkIcon(
            asset: Assets.facebookIcon,
            url: "https://www.facebook.com/krishnakumarcn/"),
        SizedBox(width: 12),
        getLinkIcon(
            asset: Assets.instagramIcon,
            url: "https://www.instagram.com/krishnakumar_cn/"),
        SizedBox(width: 12),
        getLinkIcon(
            asset: Assets.mediumIcon,
            url: "https://krishnakumarcn.medium.com/"),
        SizedBox(width: 12),
      ],
    );
  }

  getLinkIcon({required String asset, required String url}) {
    return SizedBox(
      width: 24,
      child: IconButton(
        splashColor: Colors.transparent,
        padding: EdgeInsets.all(0),
        icon: SizedBox(
            height: 18,
            width: 18,
            child: Center(
              child: Image.asset(
                asset,
                color: Colors.white.withOpacity(0.5),
              ),
            )),
        onPressed: () async {
          if (await canLaunch(url)) {
            launch(url);
          }
        },
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  // 2
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  // 3
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class SliverSubHeader extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const SliverSubHeader(
      {Key? key, required this.text, required this.backgroundColor})
      : assert(text != null),
        assert(backgroundColor != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 62,
        maxHeight: 62,
        child: Container(
          color: backgroundColor,
          padding: EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 18),
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
