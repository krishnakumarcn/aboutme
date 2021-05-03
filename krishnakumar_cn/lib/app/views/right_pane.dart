import 'package:flutter/material.dart';
import 'package:krishnakumar_cn/app/models/education_data.dart';
import 'package:krishnakumar_cn/app/models/tech_data.dart';
import 'package:krishnakumar_cn/app/models/work_experience.dart';
import 'package:krishnakumar_cn/bloc/app_bloc.dart';
import 'package:krishnakumar_cn/enums/sections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RightPane extends StatefulWidget {
  @override
  _RightPaneState createState() => _RightPaneState();
}

class _RightPaneState extends State<RightPane> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedSection = context.watch<AppBloc>().state.selectedSection;
    var tiles;
    switch (selectedSection) {
      case Section.WorkExperience:
        tiles = context.watch<AppBloc>().state.workExperiences;
        break;
      case Section.Education:
        tiles = context.watch<AppBloc>().state.educationData;
        break;
      case Section.Tech:
        tiles = context.watch<AppBloc>().state.techData;
        break;
      case Section.Personal:
        return Container(
          padding: EdgeInsets.only(
            right: 82,
          ),
          child: PersonalPage(),
        );

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
              child: getTile(selectedSection, tileItem));
        },
        itemCount: tiles?.length ?? 0,
      ),
    );
  }

  getTile(Section? selectedSection, var item) {
    switch (selectedSection) {
      case Section.WorkExperience:
        return WorkExperienceTile(
          workExperience: item,
        );
      case Section.Education:
        return EducationTile(educationData: item);
      case Section.Tech:
        return TechTile(techData: item);
      case Section.Personal:
        break;
      default:
        break;
    }
    return Container();
  }
}

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(bottom: 0, top: 82),
        padding: EdgeInsets.all(18),
        color: Theme.of(context).accentColor,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              getBooksSection(context),
            ]),
      ),
    );
  }

  Widget getBooksSection(context) {
    return Column(children: [
      Text(
        "Books",
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(letterSpacing: 1, fontSize: 18),
      ),
      SizedBox(height: 12),
      Text(
        "A Song of Ice and Fire series by George RR Martin.",
        style: Theme.of(context).textTheme.bodyText2?.copyWith(),
      ),
      Text(
        "The Ocean at the End of the Lane by Neil Gaiman",
        style: Theme.of(context).textTheme.bodyText2?.copyWith(),
      ),
      Text(
        "Undelivered Letters by J. Alchem",
        style: Theme.of(context).textTheme.bodyText2?.copyWith(),
      ),
    ]);
  }
}

class TechTile extends StatelessWidget {
  final TechData? techData;

  const TechTile({Key? key, this.techData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            techData?.title ?? "",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(letterSpacing: 1, fontSize: 18),
          ),
          SizedBox(height: 12),
          Text(
            techData?.description ?? "",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(),
          )
        ]);
  }
}

class WorkExperienceTile extends StatelessWidget {
  final WorkExperience? workExperience;

  const WorkExperienceTile({Key? key, this.workExperience}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            workExperience?.company ?? "",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(letterSpacing: 1, fontSize: 18),
          ),
          SizedBox(height: 4),
          Text(
            (workExperience?.role ?? "") +
                ", " +
                (workExperience?.duration ?? ""),
            style: Theme.of(context).textTheme.caption?.copyWith(
                color: Colors.white.withOpacity(
                  0.7,
                ),
                letterSpacing: 2,
                height: 1),
          ),
          SizedBox(height: 12),
          Text(
            workExperience?.description ?? "",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(),
          )
        ]);
  }
}

class EducationTile extends StatelessWidget {
  final EducationData? educationData;

  const EducationTile({Key? key, this.educationData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            educationData?.schoolCollegeName ?? "",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(letterSpacing: 1, fontSize: 18),
          ),
          SizedBox(height: 4),
          Text(
            (educationData?.course ?? "") +
                ", " +
                (educationData?.duration ?? ""),
            style: Theme.of(context).textTheme.caption?.copyWith(
                color: Colors.white.withOpacity(
                  0.7,
                ),
                letterSpacing: 2,
                height: 1),
          ),
          SizedBox(height: 12),
          Text(
            educationData?.gpaOrMarks ?? "",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(),
          )
        ]);
  }
}
