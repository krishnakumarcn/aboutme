import 'package:equatable/equatable.dart';

class TechData extends Equatable {
  final String title;
  final String description;
  final String asset;

  TechData(
      {required this.title, required this.description, required this.asset});

  @override
  List<Object?> get props => [title, description, asset];
}
