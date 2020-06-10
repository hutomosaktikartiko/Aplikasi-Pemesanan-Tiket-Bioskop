part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign in page"),),
      body: Center(
        child: RaisedButton(
          child: Text("Sign in"),
          onPressed: (){
            AuthServices.signIn("hutomo@gmail.com", "123456");
          }),
      ),
    );
  }
}