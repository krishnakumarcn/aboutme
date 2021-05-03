part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState(
      {this.selectedSection = Section.WorkExperience,
      this.workExperiences,
      this.educationData,
      this.techData});
  final Section? selectedSection;

  AppState copyWith(
      {Section? selectedSection,
      List<WorkExperience>? workExperienceTiles,
      List<EducationData>? educationData,
      List<TechData>? techData}) {
    return AppState(
        selectedSection: selectedSection ?? this.selectedSection,
        workExperiences: workExperienceTiles ?? this.workExperiences,
        educationData: educationData ?? this.educationData,
        techData: techData ?? this.techData);
  }

  final List<WorkExperience>? workExperiences;
  final List<EducationData>? educationData;
  final List<TechData>? techData;

  @override
  List<Object?> get props =>
      [selectedSection, workExperiences, educationData, techData];
}
