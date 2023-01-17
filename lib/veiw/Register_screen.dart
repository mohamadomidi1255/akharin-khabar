import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:qakhrinkhbar/component/colors.dart';
import 'package:qakhrinkhbar/veiw/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            title: Row(children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(245, 0, 5, 0),
                child: Text("ثبت نام"),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop(MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ])),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 100),
                child: SizedBox(
                    height: 170,
                    child: Image.asset(
                      "assets/images/icon3.png",
                    )),
              ),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: 350,
                    child: TextField(
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey)),
                        filled: true,
                        fillColor: Color.fromARGB(148, 239, 238, 238),
                        labelText: " شماره خود را وارد کنید",
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: const Color.fromARGB(158, 215, 212, 212),
                onTap: () {
                  bottomSheetname(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: MyColors.themcolor,
                    ),
                    child: const Text(" مرحله بعد ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bottomSheetpassword(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "رمز عبور خود را وارد کنید",
                      style: TextStyle(
                          color: Color.fromARGB(255, 209, 19, 5), fontSize: 25),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 350,
                        child: TextField(
                          obscureText: true,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.grey)),
                            filled: true,
                            labelText: "********",
                            labelStyle: TextStyle(fontSize: 20),
                            fillColor: Color.fromARGB(148, 239, 238, 238),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 350,
                        child: TextField(
                          obscureText: true,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.grey)),
                            filled: true,
                            labelText: "********",
                            labelStyle: TextStyle(fontSize: 20),
                            fillColor: Color.fromARGB(148, 239, 238, 238),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: const Color.fromARGB(158, 215, 212, 212),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: MyColors.themcolor,
                          ),
                          child: const Text(" مرحله بعد ",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 22)),
                        ),
                      ),
                    ),
                  ],
                )));
      });
}

bottomSheetname(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "لطفا نام کاربری خود را وارد کنید",
                        style: TextStyle(
                            color: Color.fromARGB(208, 0, 0, 0), fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      width: 350,
                      child: TextField(
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          suffixIcon:
                              Icon(Icons.person_outline_rounded, size: 25),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.grey)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.grey)),
                          filled: true,
                          labelText: "نام کاربری",
                          fillColor: Color.fromARGB(148, 239, 238, 238),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: const Color.fromARGB(158, 215, 212, 212),
                      onTap: () {
                        Navigator.pop(context);
                        bottomSheetpassword(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: MyColors.themcolor,
                          ),
                          child: const Text(" مرحله بعد ",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 22)),
                        ),
                      ),
                    ),
                  ],
                )));
      });
}
