part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ChangeTheme extends ThemeEvent {
  final ThemeData themeData;

  const ChangeTheme(this.themeData);

  @override
  List<Object> get props => [themeData];
}
