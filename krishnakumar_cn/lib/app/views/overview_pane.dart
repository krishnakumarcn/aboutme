import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krishnakumar_cn/bloc/app_bloc.dart';
import 'package:krishnakumar_cn/enums/sections.dart';
import 'package:krishnakumar_cn/helpers/ui/screen_type_layout.dart';

class OverviewPane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OverviewMobile(),
      desktop: OverviewDesktop(),
    );
  }
}

class OverviewMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) => Container(
          padding: EdgeInsets.only(left: 18, top: 18, right: 18),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hello, I\'m\nKrishnakumar\nNarayanan.",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
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
                // ListView(
                //     shrinkWrap: true,
                //     padding: EdgeInsets.zero,
                //     children: Section.values.map((e) {
                //       return SectionListItem(e);
                //     }).toList()),
                // SizedBox(height: 24),
                // ProfilePill(),
              ])),
    );
  }
}

class OverviewDesktop extends StatelessWidget {
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

class SectionListItem extends StatefulWidget {
  const SectionListItem(this.section, {this.defaultSelected = false});
  final Section section;
  final bool defaultSelected;
  @override
  _SectionListItemState createState() => _SectionListItemState();
}

class _SectionListItemState extends State<SectionListItem> {
  @override
  Widget build(BuildContext context) {
    final bool isSelected = widget.defaultSelected ||
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
