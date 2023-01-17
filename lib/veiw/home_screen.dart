import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qakhrinkhbar/component/colors.dart';
import 'package:qakhrinkhbar/veiw/Setting_screen.dart';
import 'package:qakhrinkhbar/veiw/login_screen.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:rating_dialog/rating_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _HomeScreenState extends State<HomeScreen> {
  var isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    void _showRatingdialog() {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return RatingDialog(
              initialRating: 1.0,
              title: const Text(
                'به برنامه اخرین خبر امتیاز دهید',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              message: const Text(
                'میزان رضایت خود را از برنامه اخرین خبر با ستاره مشخص کنید',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              image: Image.asset(
                "assets/images/logo.jpg",
                width: 170,
                height: 170,
              ),
              submitButtonText: 'بعدا',
              enableComment: false,
              onSubmitted: (response) {});
        },
      );
    }

    var size = MediaQuery.of(context).size;

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
        key: _key,
        drawer: Drawer(
          backgroundColor: Colors.white,
          width: 300,
          child: ListView(children: [
            DrawerHeader(
                child: Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  });
                },
                child: Container(
                  height: 50,
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(22)),
                      border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 227, 226, 226))),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "ورود / ثبت نام",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            )),
            ListTile(
              onTap: () {},
              title: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.bookmark,
                      size: 25,
                    ),
                  ),
                  Text(
                    "خبر های ذخیره شده",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 2,
              color: Colors.black,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const SettingScreen())));
              },
              title: Row(
                children: const [
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.settings,
                        size: 25,
                      )),
                  Text("تنظیمات", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            ListTile(
              onTap: () async {
                // await Share.share(
                //     "برای با خبر شدن ار اخرین خبر ها برنامه اخرین خبر را دانلود کنید");
              },
              title: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.person_add_alt_rounded,
                      size: 25,
                    ),
                  ),
                  Text("دعوت از دوستان ",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                bottomSheet(context);
              },
              title: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.question_mark_rounded,
                      size: 25,
                    ),
                  ),
                  Text("درباره ما", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            ListTile(
              onTap: () {},
              title: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.call,
                      size: 25,
                    ),
                  ),
                  Text("ارتباط با ما",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                showToastWidget(
                    animDuration: const Duration(milliseconds: 800),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      margin: const EdgeInsets.symmetric(horizontal: 50.0),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color: MyColors.themcolor,
                      ),
                      child: Row(
                        children: const [
                          Text(
                            'نسخه شما به روز میباشد',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                    context: context,
                    animation: StyledToastAnimation.slideFromRight,
                    duration: const Duration(seconds: 6));
              },
              title: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.access_time_rounded,
                      size: 25,
                    ),
                  ),
                  Text("اخرین بروزرسانی",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ],
              ),
            ),
            ListTile(
              onTap: () => _showRatingdialog(),
              title: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.call,
                      size: 25,
                    ),
                  ),
                  Text("نظر دادن درباره برنامه",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ],
              ),
            ),
          ]),
        ),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: MyColors.themcolor,
            title: Row(children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                  height: 35,
                  width: 50,
                  child: Image.asset("assets/images/icon2.jpg")),
              SizedBox(
                  width: 120,
                  height: 90,
                  child: Image.asset("assets/images/icon.jpg")),
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                      });
                    },
                    child: const SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 27,
                      ),
                    )),
              ),
              const Icon(Icons.search)
            ])),
        body: SingleChildScrollView(
            child: Column(children: [
          StickyHeader(
            content: Wrap(
              children: [
                SizedBox(
                  height: 30,
                ),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/sam.jpg"))),
                      )),
                  const SizedBox(
                      width: 125,
                      height: 125,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("سینما و چهره ها",
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/siasi.jpg"))),
                      )),
                  const SizedBox(
                      width: 125,
                      height: 125,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("سیاسی",
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/baiden.jpg"))),
                      )),

                  //  Image.asset(
                  //     width: 125, height: 125, "assets/images/baiden.jpg")

                  const SizedBox(
                      width: 125,
                      height: 125,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("اخبار برگزیده",
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/sil1.jpg"))),
                      )),
                  const SizedBox(
                      width: 125,
                      height: 125,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("جامعه و حوادث",
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/potin.jpeg"))),
                      )),
                  const SizedBox(
                      width: 125,
                      height: 125,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("بین الملل",
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/sports.jpg"))),
                      )),
                  const SizedBox(
                      width: 125,
                      height: 125,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("ورزشی",
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(2, 3, 3, 3),
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/khan.jpg"))),
                      )),
                  const SizedBox(
                      width: 125,
                      height: 125,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("چند رسانه ای",
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
                      child: Container(
                        width: 255,
                        height: 125,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/joker.jpg"))),
                      )),
                  const SizedBox(
                      width: 255,
                      height: 125,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("جذاب ترین ها",
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 3, 2),
                      child: Container(
                        width: 255,
                        height: 130,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/movie.jpg"))),
                      )),
                  const SizedBox(
                      width: 255,
                      height: 130,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("فیلم و سریال",
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 0, 2),
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/gold.jpg"))),
                      )),
                  const SizedBox(
                      width: 130,
                      height: 130,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("اقتصادی",
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(2, 3, 3, 0),
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/mobile.jpg"))),
                      )),
                  const SizedBox(
                      width: 125,
                      height: 125,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(" فناوری اطلاعات ",
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(2, 3, 2, 3),
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/baiden2.jpg"))),
                      )),
                  const SizedBox(
                      width: 125,
                      height: 125,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("تحلیل ها",
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 2, 0),
                      child: Container(
                        width: 128,
                        height: 130,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/imag.jpg"))),
                      )),
                  const SizedBox(
                      width: 128,
                      height: 130,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("عکس ها",
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(2, 2, 3, 0),
                      child: Container(
                        width: 125,
                        height: 130,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/dinosaur.jpg"))),
                      )),
                  const SizedBox(
                      width: 125,
                      height: 130,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("دیدنی خواندنی ",
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(3, 2, 3, 0),
                      child: Container(
                        width: 125,
                        height: 130,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/music.jpg"))),
                      )),
                  const SizedBox(
                      width: 125,
                      height: 130,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(" موسیقی",
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(2, 2, 3, 0),
                      child: Container(
                        width: 125,
                        height: 130,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/gaim.jpg"))),
                      )),
                  const SizedBox(
                      width: 125,
                      height: 130,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(" بازار اپ",
                              style: TextStyle(color: Colors.red)))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(2, 0, 3, 0),
                      child: Container(
                        width: 125,
                        height: 130,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/car.jpg"))),
                      )),
                  const SizedBox(
                      width: 125,
                      height: 130,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(" خودرو ", style: TextStyle())))
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(2, 2, 3, 0),
                      child: Container(
                        width: 125,
                        height: 130,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/iran.jpg"))),
                      )),
                  const SizedBox(
                      width: 125,
                      height: 130,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("استانها", style: TextStyle()))),
                ]),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(2, 2, 3, 0),
                      child: Container(
                        width: 125,
                        height: 130,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/food.jpg"))),
                      )),
                  const SizedBox(
                      width: 125,
                      height: 130,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("اشپزی من",
                              style: TextStyle(color: Colors.white)))),
                ]),
              ],
            ),
            header: Container(
              width: double.infinity,
              height: 35,
              color: Colors.white,
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: const [
                  Icon(Icons.location_on_outlined,
                      color: Color.fromARGB(255, 209, 19, 5)),
                  Text(
                    "غافلگیری مرگبار سیل در فارس فوتی ها به هفده نفر رسید",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ])),
      ),
    );
  }
}

bottomSheet(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 224, 223, 223),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: const Center(
              child: Text(
            "برنامه نویس محمد امیدی ",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )),
        );
      });
}
