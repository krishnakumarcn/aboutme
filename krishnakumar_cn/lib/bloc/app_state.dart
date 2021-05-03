part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({this.selectedSection = Section.WorkExperience});
  final Section? selectedSection;

  AppState copyWith({Section? selectedSection}) {
    return AppState(selectedSection: selectedSection ?? this.selectedSection);
  }

  @override
  List<Object?> get props => [selectedSection];
}
