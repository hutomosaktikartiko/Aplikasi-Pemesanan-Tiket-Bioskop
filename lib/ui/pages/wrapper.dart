part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //mendapatkan status user, jika terdapat perubahan status maka method build akan dipanggil kembali
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        //sebelum ke main page, kita perintahkan untuk meload user
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
        prevPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : (pageState is OnRegistrationPage)
                    ? SignUpPage(pageState.registrationData)
                    : MainPage());
  }
}
