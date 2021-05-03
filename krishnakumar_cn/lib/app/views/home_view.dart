import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krishnakumar_cn/app/models/work_experience.dart';
import 'package:krishnakumar_cn/app/views/right_pane.dart';
import 'package:krishnakumar_cn/bloc/app_bloc.dart';
import 'package:krishnakumar_cn/enums/sections.dart';
import 'package:krishnakumar_cn/helpers/assets.dart';
import 'package:krishnakumar_cn/helpers/assets.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ProfilePill(),
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
              child: LeftPane(),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.10),
            Flexible(
              flex: 3,
              child: RightPane(),
            ),
          ],
        ),
      ),
    );
  }
}

class LeftPane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) => Container(
          padding: EdgeInsets.only(left: 82, top: 82),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hello, I\'m\nKrishnakumar Narayanan.",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 12),
                Text(
                    '''Engineer with a strong passion for computers and application development. My areas of interest include mobile & web-based application development and cloud engineering including the strategy and execution of product development activities. As a keen developer, I always thrive to keep myself updated on the latest trends and adaptations introduced in my fields of interest''',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(height: 1.6)),
                SizedBox(height: 24),
                ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: Section.values.map((e) {
                      return SectionListItem(e);
                    }).toList()),
                SizedBox(height: 24),
                // ProfilePill(),
              ])),
    );
  }
}

class ProfilePill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Container(
        //     height: 48,
        //     width: 48,
        //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(48)),
        //     child: ClipOval(child: Image.asset(Assets.kkImage))),
        // SizedBox(width: 24),
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

class SectionListItem extends StatefulWidget {
  const SectionListItem(this.section);
  final Section section;
  @override
  _SectionListItemState createState() => _SectionListItemState();
}

class _SectionListItemState extends State<SectionListItem> {
  @override
  Widget build(BuildContext context) {
    final bool isSelected =
        context.watch<AppBloc>().state.selectedSection == widget.section;
    final Color color = isSelected ? Colors.white : Color(0xff949495);
    final double fontSize = isSelected ? 14 : 10;
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () =>
          context.read<AppBloc>().add(SelectedSectionChanged(widget.section)),
      child: ListTile(
        leading: Text(
          "${widget.section.index.toString().padLeft(2, '0')}",
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: color, fontSize: fontSize),
        ),
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 0,
        minLeadingWidth: 0,
        title: Row(
          children: [
            SizedBox(width: 12),
            Container(height: 1, width: isSelected ? 82 : 48, color: color),
            SizedBox(width: 12),
            Text(
              widget.section.displayText.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: color, fontSize: fontSize),
            ),
          ],
        ),
      ),
    );
  }
}
