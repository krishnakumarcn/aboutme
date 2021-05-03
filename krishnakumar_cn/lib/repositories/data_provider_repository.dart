import 'package:krishnakumar_cn/app/models/education_data.dart';
import 'package:krishnakumar_cn/app/models/tech_data.dart';
import 'package:krishnakumar_cn/app/models/work_experience.dart';
import 'package:krishnakumar_cn/helpers/assets.dart';

class DataRepository {
  List<WorkExperience> getWorkExperience() {
    return [
      WorkExperience(
        duration: '2019-Present',
        role: 'Lead Engineer',
        company: 'Flujo',
        description:
            '''Flujo is a communication & collaboration suite for teams. With natively built key business essentials like messaging, audio and video calling, drive, meetings, tasks, calendar, notes, and kanbans, Flujo helps to eliminate the clutter of team collaboration. As the head of Flujo mobile, strategized, designed, and built the Flujo mobile application''',
      ),
      WorkExperience(
        duration: '2018-2019',
        role: 'Software Engineer',
        company: 'Nissan Motor Corporation',
        description:
            '''Nissan Digital is a subsidiary of Nissan Motor Corporation, a global automotive OEM, and the world's largest EV manufacturer that transforms the automobile business using Digital Technologies.''',
      ),
      WorkExperience(
        duration: '2017-2018',
        role: 'Software Engineer',
        company: 'Tismo',
        description:
            '''Tismo is a design engineering firm that offers product realization services from concept to end-product. As a fresh graduate engineer at Tismo, had the opportunity to work on a variety of projects and gained knowledge in different areas of Software Engineering.''',
      ),
    ];
  }

  List<EducationData> getEducationData() {
    return [
      EducationData(
          schoolCollegeName: 'College of Engineering, Trivandrum',
          duration: '2013-2017',
          course: 'B.Tech. Computer Science and Engineering',
          gpaOrMarks: 'CGPA: 7.96'),
      EducationData(
          schoolCollegeName: 'Sreekrishnapuram HSS',
          duration: '2010-2012',
          course: 'Higher Secondary',
          gpaOrMarks: '97.3%'),
      EducationData(
          schoolCollegeName: 'Sreekrishnapuram HSS',
          duration: '2000-2010',
          course: 'High School',
          gpaOrMarks: '95%')
    ];
  }

  List<TechData> getTechData() {
    return [
      TechData(title: 'Flutter', description: '', asset: ''),
      TechData(title: 'Dart', description: '', asset: ''),
      TechData(title: 'Android', description: '', asset: ''),
      TechData(title: 'iOS', description: '', asset: ''),
      TechData(title: 'JavaScript', description: '', asset: ''),
    ];
  }
}
