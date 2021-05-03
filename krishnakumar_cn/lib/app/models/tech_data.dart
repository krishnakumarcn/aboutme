import 'package:equatable/equatable.dart';

class TechData extends Equatable {
  final String title;
  final String description;
  final String asset;
  final double rating;

  TechData(
      {required this.title,
      required this.description,
      required this.asset,
      required this.rating});

  @override
  List<Object?> get props => [title, description, asset, rating];
}
