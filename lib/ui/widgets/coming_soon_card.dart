part of 'widgets.dart';

class ComingSoonCard extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  ComingSoonCard(this.movie, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: (movie.posterPath == null)
                  ? AssetImage("assets/placeholder.jpg")
                  : NetworkImage(imageBaseURL + "w780" + movie.backdropPath),
              fit: BoxFit.cover)),
      child: Container(
        height: 140,
        width: 210,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.16),
                  Colors.black.withOpacity(0)
                ])),
      ),
    );
  }
}
