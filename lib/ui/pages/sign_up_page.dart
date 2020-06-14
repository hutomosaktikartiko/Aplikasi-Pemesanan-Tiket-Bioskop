part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData registrationData;

  SignUpPage(this.registrationData);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePassswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor1)));
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSplashPage());

        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 22),
                    height: 56,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(GoToSplashPage());
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Create New\nAccount",
                            style: blackTextFont.copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 104,
                    width: 90,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      (widget.registrationData.profileImage ==
                                              null)
                                          ? AssetImage("assets/user_pic.png")
                                          : FileImage(widget
                                              .registrationData.profileImage))),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () async {
                              //ambil image dari hp
                              if (widget.registrationData.profileImage ==
                                  null) {
                                widget.registrationData.profileImage =
                                    await getImage();
                              } else {
                                widget.registrationData.profileImage = null;
                              }
                              setState(() {});
                            },
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage((widget.registrationData
                                                  .profileImage ==
                                              null)
                                          ? "assets/btn_add_photo.png"
                                          : "assets/btn_del_photo.png"))),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Full Name",
                        hintText: "Full Name"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Email",
                        hintText: "Email"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Password",
                        hintText: "Password"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: retypePassswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Confirm Password",
                        hintText: "Confirm Password"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.arrow_forward),
                    backgroundColor: mainColor,
                    elevation: 0,
                    onPressed: () {
                      if (!(nameController.text.trim() != "" &&
                          emailController.text.trim() != "" &&
                          passwordController.text.trim() != "" &&
                          retypePassswordController.text.trim() != "")) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Please fill all the fields",
                        )..show(context);
                      } else if (passwordController.text !=
                          retypePassswordController.text) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Mismatch password and confirmed password",
                        )..show(context);
                      } else if (passwordController.text.length < 6) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Password's length min 6 characters",
                        )..show(context);
                      } else if (!EmailValidator.validate(
                          emailController.text)) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Wrong formatted email address",
                        )..show(context);
                      } else {
                        widget.registrationData.name = nameController.text;
                        widget.registrationData.email = emailController.text;
                        widget.registrationData.password =
                            passwordController.text;

                        //pindah ke preference page
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
