part of 'ticket_bloc.dart';

abstract class TicketEvent extends Equatable {
  const TicketEvent();
}

class GetTickets extends TicketEvent {
  final String userID;

  GetTickets(this.userID);

  @override
  List<Object> get props => [userID];
}

class BuyTickets extends TicketEvent {
  final Ticket ticket;
  final String userID;

  BuyTickets(this.ticket, this.userID);

  @override
  List<Object> get props => [ticket, userID];
}
