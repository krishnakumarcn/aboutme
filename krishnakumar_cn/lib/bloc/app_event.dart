part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class SelectedSectionChanged extends AppEvent {
  final Section section;

  const SelectedSectionChanged(this.section);

  @override
  List<Object?> get props => [section];
}
