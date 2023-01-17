import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qakhrinkhbar/component/colors.dart';
import 'package:qakhrinkhbar/veiw/Register_screen.dart';
import 'package:qakhrinkhbar/veiw/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;
  var textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // farsi, no country code
      ],
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: MyColors.themcolor,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("ورود به پروفایل"),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                ])),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //poster
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 60),
              child: SizedBox(
                  height: 170,
                  child: Image.asset(
                    "assets/images/icon3.png",
                  )),
            ),

            Column(children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: 350,
                    child: TextField(
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        suffixIcon:
                            Icon(Icons.person_outline_rounded, size: 25),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        labelText: "نام کاربری",
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: 350,
                    child: TextField(
                      obscureText: passwordVisible,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: passwordVisible
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        labelText: "رمز عبور",
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: const Color.fromARGB(158, 215, 212, 212),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegisterScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: MyColors.themcolor,
                    ),
                    child: const Text("ثبت نام",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              InkWell(
                splashColor: const Color.fromARGB(158, 215, 212, 212),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                        border:
                            Border.all(width: 2, color: MyColors.themcolor)),
                    child: const Text("ورود",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22)),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text("رمز عبور خود را فراموش کرده اید؟",
                        style: TextStyle(
                          fontSize: 17,
                          color: MyColors.themcolor,
                        ))),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
