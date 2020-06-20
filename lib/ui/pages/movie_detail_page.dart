part of 'pages.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  MovieDetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    MovieDetail movieDetail;
    List<Credit> credits;

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());

        return;
      },
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(
            color: accentColor1,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          ListView(
            children: <Widget>[
              FutureBuilder(
                  future: MovieServices.getDetails(movie),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      movieDetail = snapshot.data;
                    }

                    return Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            // note: BACKDROP
                            Stack(
                              children: <Widget>[
                                Container(
                                  height: 270,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(imageBaseURL +
                                                  "w1280" +
                                                  movie.backdropPath ??
                                              movie.posterPath),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  height: 271,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment(0, 1),
                                          end: Alignment(0, 0.06),
                                          colors: [
                                        Colors.white,
                                        Colors.white.withOpacity(0)
                                      ])),
                                )
                              ],
                            ),
                            // note: BACK ICON
                            Container(
                              margin:
                                  EdgeInsets.only(top: 20, left: defaultMargin),
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black.withOpacity(0.04)),
                              child: GestureDetector(
                                onTap: () {
                                  context.bloc<PageBloc>().add(GoToMainPage());
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        // note: JUDUL
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 16, defaultMargin, 6),
                          child: Text(
                            movie.title,
                            textAlign: TextAlign.center,
                            style: blackTextFont.copyWith(fontSize: 24),
                          ),
                        ),
                        // note: GENRE
                        (snapshot.hasData)
                            ? Text(
                                movieDetail.genresAndLanguage,
                                style: greyTextFont.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              )
                            : SizedBox(
                                height: 50,
                                width: 50,
                                child: SpinKitFadingCircle(
                                  color: accentColor3,
                                ),
                              ),
                        SizedBox(
                          height: 6,
                        ),
                        // note: RATING
                        RatingStars(
                          voteAverage: movie.voteAverage,
                          color: accentColor3,
                          alignment: MainAxisAlignment.center,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        // note: CREDITS
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: defaultMargin, bottom: 12),
                              child: Text(
                                "Cast & Crew",
                                style: blackTextFont.copyWith(fontSize: 14),
                              )),
                        ),
                        FutureBuilder(
                            future: MovieServices.getCredits(movie.id),
                            builder: (_, snapshot) {
                              if (snapshot.hasData) {
                                credits = snapshot.data;
                                return SizedBox(
                                  height: 115,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: credits.length,
                                      itemBuilder: (_, index) => Container(
                                          margin: EdgeInsets.only(
                                              left: (index == 0)
                                                  ? defaultMargin
                                                  : 0,
                                              right:
                                                  (index == credits.length - 1)
                                                      ? defaultMargin
                                                      : 16),
                                          child: CreditCard(credits[index]))),
                                );
                              } else {
                                return SizedBox(
                                    height: 50,
                                    child: SpinKitFadingCircle(
                                      color: accentColor1,
                                    ));
                              }
                            }),
                        // note: STORYLINE
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 24, defaultMargin, 8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Storyline",
                              style: blackTextFont,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 0, defaultMargin, 30),
                          child: Text(
                            movie.overview,
                            style: greyTextFont.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        // note: BUTTON
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: mainColor,
                            child: Text(
                              "Continue to Book",
                              style: whiteTextFont.copyWith(fontSize: 16),
                            ),
                            onPressed: () {
                              context
                                  .bloc<PageBloc>()
                                  .add(GoToSelectSchedulePage(movieDetail));
                            }),
                        SizedBox(height: defaultMargin)
                      ],
                    );
                  }),
            ],
          ),
        ],
      )),
    );
  }
}
