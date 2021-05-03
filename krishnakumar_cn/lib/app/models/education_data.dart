import 'package:equatable/equatable.dart';

class EducationData extends Equatable {
  final String schoolCollegeName;
  final String course;
  final String duration;
  final String gpaOrMarks;

  const EducationData(
      {required this.schoolCollegeName,
      required this.duration,
      required this.course,
      required this.gpaOrMarks});
  @override
  List<Object?> get props => [schoolCollegeName, duration, gpaOrMarks, course];
}
