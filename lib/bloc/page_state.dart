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
  @override
  List<Object> get props => [];
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
