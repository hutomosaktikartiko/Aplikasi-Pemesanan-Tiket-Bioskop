part of 'widgets.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  MovieCard(this.movie, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 210,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: (movie.backdropPath == null)
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              movie.title,
              style: whiteTextFont,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            RatingStars(
              voteAverage: movie.voteAverage,
            )
          ],
        ),
      ),
    );
  }
}
