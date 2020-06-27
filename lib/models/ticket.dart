part of 'models.dart';

class Ticket extends Equatable {
  final MovieDetail movieDetail;
  final Theater theater;
  final DateTime time;
  final String bookingCode;
  final List<String> seats;
  final String name;
  final int totalPrice;

  Ticket(this.movieDetail, this.theater, this.time, this.bookingCode,
      this.seats, this.name, this.totalPrice);

  Ticket copyWith(
          {MovieDetail movieDetail,
          Theater theater,
          DateTime time,
          String bookingCode,
          List<String> seats,
          String name,
          int totalPrice}) =>
      Ticket(
          movieDetail ?? this.movieDetail,
          theater ?? this.theater,
          time ?? this.time,
          bookingCode ?? this.bookingCode,
          seats ?? this.seats,
          name ?? this.name,
          totalPrice ?? this.totalPrice);

  String get seatsInString {
    String s = '';

    for (var seat in seats) {
      s += seat + ((seat != seats.length) ? ', ' : '');
    }

    return s;
  }

  @override
  List<Object> get props =>
      [movieDetail, theater, time, bookingCode, seats, name, totalPrice];
}
