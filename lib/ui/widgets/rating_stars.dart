part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double voteAverage;
  final double starsSize;
  final Color color;
  final double fontSize;
  final MainAxisAlignment alignment;

  RatingStars(
      {this.voteAverage = 0,
      this.starsSize = 20,
      this.color,
      this.fontSize = 12,
      this.alignment = MainAxisAlignment.start});
  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();

    List<Widget> widgets = List.generate(
        5,
        (index) => Icon(
              index < n ? MdiIcons.star : MdiIcons.starOutline,
              color: accentColor2,
              size: starsSize,
            ));

    widgets.add(SizedBox(
      width: 3,
    ));
    widgets.add(Text(
      "$voteAverage/10",
      style: whiteNumberFont.copyWith(
          color: color ?? Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: fontSize),
    ));
    return Row(
      mainAxisAlignment: alignment,
      children: widgets,
    );
  }
}
