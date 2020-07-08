part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  final int bottomNavBarIndex;
  final bool isExpired;

  OnMainPage({this.bottomNavBarIndex = 0, this.isExpired = false});

  @override
  List<Object> get props => [bottomNavBarIndex, isExpired];
}

class OnRegistrationPage extends PageState {
  final RegistrationData registrationData;
  OnRegistrationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class OnPreferencePage extends PageState {
  final RegistrationData registrationData;
  OnPreferencePage(this.registrationData);
  @override
  List<Object> get props => [];
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationData registrationData;
  OnAccountConfirmationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class OnMovieDetailPage extends PageState {
  final Movie movie;
  OnMovieDetailPage(this.movie);
  @override
  List<Object> get props => [movie];
}

class OnSelectSchedulePage extends PageState {
  final MovieDetail movieDetail;

  OnSelectSchedulePage(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class OnSelectSeatPage extends PageState {
  final Ticket ticket;

  OnSelectSeatPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnCheckoutPage extends PageState {
  final Ticket ticket;

  OnCheckoutPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnSuccessPage extends PageState {
  final Ticket ticket;
  final FlutixTransaction transaction;

  OnSuccessPage(this.ticket, this.transaction);

  @override
  List<Object> get props => [ticket, transaction];
}

class OnTicketDetailPage extends PageState {
  final Ticket ticket;

  OnTicketDetailPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnProfilePage extends PageState {
  @override
  List<Object> get props => [];
}

class OnTopUpPage extends PageState {
  final PageEvent pageEvent;

  OnTopUpPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}
