part of 'pages.dart';

class SelectSeatPage extends StatefulWidget {
  final Ticket ticket;

  SelectSeatPage(this.ticket);
  @override
  _SelectSeatPageState createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  List<String> selectedSeats = [];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context
              .bloc<PageBloc>()
              .add(GoToSelectSchedulePage(widget.ticket.movieDetail));

          return;
        },
        child: Scaffold(
            body: Stack(
          children: <Widget>[
            Container(color: accentColor1),
            SafeArea(
                child: Container(
              color: Colors.white,
            )),
            ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    // Header
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 20, left: defaultMargin),
                          padding: EdgeInsets.all(1),
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(
                                  GoToSelectSchedulePage(
                                      widget.ticket.movieDetail));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, right: defaultMargin),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 16),
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  widget.ticket.movieDetail.title,
                                  style: blackTextFont.copyWith(fontSize: 20),
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: NetworkImage(imageBaseURL +
                                            'w154' +
                                            widget
                                                .ticket.movieDetail.posterPath),
                                        fit: BoxFit.cover)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    // Cinema Screen
                    Container(
                      width: 277,
                      height: 84,
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/screen.png"))),
                    ),
                    // Seats
                    generateSeats(),
                    SizedBox(
                      height: 30,
                    ),
                    // next button
                    Align(
                        alignment: Alignment.topCenter,
                        child: FloatingActionButton(
                            elevation: 0,
                            backgroundColor: selectedSeats.length > 0
                                ? mainColor
                                : Color(0xFFE4E4E4),
                            child: Icon(
                              Icons.arrow_forward,
                              color: selectedSeats.length > 0
                                  ? Colors.white
                                  : Color(0xFFBEBEBE),
                            ),
                            onPressed: selectedSeats.length > 0
                                ? () {
                                    context.bloc<PageBloc>().add(
                                        GoToCheckoutPage(widget.ticket
                                            .copyWith(seats: selectedSeats)));
                                  }
                                : null)),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ],
            )
          ],
        )));
  }

  Column generateSeats() {
    List<int> numberOfSeats = [3, 5, 5, 5, 5];
    List<Widget> widgets = [];

    for (int i = 0; i < numberOfSeats.length; i++) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          numberOfSeats[i],
          (index) => Padding(
            padding: EdgeInsets.only(
                right: index < numberOfSeats[1] - 1 ? 16 : 0, bottom: 16),
            child: SelectableBox(
              "${String.fromCharCode(i + 65)}${index + 1}",
              width: 40,
              height: 40,
              textStyle: whiteNumberFont.copyWith(
                color: Colors.black,
              ),
              isSelected: selectedSeats
                  .contains("${String.fromCharCode(i + 65)}${index + 1}"),
              onTap: () {
                String seatNumber =
                    "${String.fromCharCode(i + 65)}${index + 1}";
                setState(() {
                  if (selectedSeats.contains(seatNumber)) {
                    selectedSeats.remove(seatNumber);
                  } else {
                    selectedSeats.add(seatNumber);
                  }
                });
              },
              isEnabled: index != 0,
            ),
          ),
        ),
      ));
    }

    return Column(children: widgets);
  }
}
