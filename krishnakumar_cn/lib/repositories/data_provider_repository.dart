import 'package:krishnakumar_cn/app/models/education_data.dart';
import 'package:krishnakumar_cn/app/models/tech_data.dart';
import 'package:krishnakumar_cn/app/models/work_experience.dart';

class DataRepository {
  List<WorkExperience> getWorkExperience() {
    return [
      WorkExperience(
        duration: '2021-Present',
        role: 'Berlin, Germany\nSenior Engineer',
        company: 'Delivery Hero',
        description:
            '''Delivery Hero is a European multinational online food-delivery service based in Berlin, Germany. The company operates in 40+ countries internationally in Europe, Asia, Latin America and the Middle East and partners with 500,000+ restaurant''',
        fullDescription:
            '''Currently working as a Flutter Engineer in Delivery Hero's D-Merchant team. D-Merchant is the mobile application that allows restaurants to talk to their existing suppliers, place and track orders with these suppliers and discover new suppliers.''',
      ),
      WorkExperience(
        duration: '2019-2021',
        role: 'Hyderabad, India\nLead Engineer',
        company: 'Flujo',
        description:
            '''Flujo is a communication & collaboration suite for teams. With natively built key business essentials like messaging, audio and video calling, drive, meetings, tasks, calendar, notes, and kanbans, Flujo helps to eliminate the clutter of team collaboration. As the head of Flujo mobile, strategized, designed, and built the Flujo mobile application''',
        fullDescription:
            '''• Built Flujo's Android and iOS applications with a single codebase using Flutter from scratch including design, development, testing, and CI/CD.
• Established design principles and coding standards across the team.
• Worked closely with the product team and user experience team to make the end-user experience world-class.
• Contributed to several open source communities in the due process''',
      ),
      WorkExperience(
          duration: '2018-2019',
          role: 'Trivandrum, India\nSoftware Engineer',
          company: 'Nissan Motor Corporation',
          description:
              '''Nissan Digital is a subsidiary of Nissan Motor Corporation, a global automotive OEM, and the world's largest EV manufacturer that transforms the automobile business using Digital Technologies.''',
          fullDescription:
              '''• As one of the early members of the digital transformation of Nissan Motors, initially worked on accelerating the digital transformation activities by creating a repository for reusable software components.
• Later, as part of the supply chain management team, I've built and contributed to the platform for vehicle quality management which is currently used in different Nissan manufacturing plants across the globe.
• Used my experience as a native Android and iOS developer to act as a developer advocate for several initiatives at Nissan.'''),
      WorkExperience(
          duration: '2017-2018',
          role: 'Bengaluru, India\nSoftware Engineer',
          company: 'Tismo',
          description:
              '''Tismo is a design engineering firm that offers product realization services from concept to end-product. As a fresh graduate engineer at Tismo, had the opportunity to work on a variety of projects and gained knowledge in different areas of Software Engineering.''',
          fullDescription:
              '''• Involved in the process of Software Engineering from requirement analysis to the design, development, and delivery of the product.
• Explored different areas like mobile, web, and desktop application development.
• Built multiple industrial mobile applications each for Android and iOS in the domain of embedded systems.'''),
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
      TechData(title: 'Flutter', description: '', asset: '', rating: 9.0),
      TechData(title: 'Dart', description: '', asset: '', rating: 9.0),
      TechData(title: 'Android', description: '', asset: '', rating: 8.0),
      TechData(title: 'iOS', description: '', asset: '', rating: 7.0),
      TechData(title: 'JavaScript', description: '', asset: '', rating: 8.0),
    ];
  }
}
