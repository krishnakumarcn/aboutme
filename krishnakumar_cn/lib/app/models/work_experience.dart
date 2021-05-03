import 'package:equatable/equatable.dart';

class WorkExperience extends Equatable {
  final String duration;
  final String role;
  final String company;
  final String description;

  const WorkExperience(
      {this.duration = "",
      this.company = "",
      this.description = "",
      this.role = ""});

  @override
  List<Object?> get props => [company, duration, role, description];
}
