part of 'ticket_bloc.dart';

class TicketState extends Equatable {
  final List<Ticket> tickets;

  const TicketState(this.tickets);

  @override
  List<Object> get props => [tickets];
}
