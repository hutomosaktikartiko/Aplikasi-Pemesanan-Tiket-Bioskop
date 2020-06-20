part of 'models.dart';

class Credit extends Equatable {
  final String name;
  final String profilePath;

  Credit({this.name, this.profilePath});

  @override
  List<Object> get props => [name, profilePath];
}
