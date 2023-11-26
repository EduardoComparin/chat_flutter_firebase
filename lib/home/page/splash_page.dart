import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_flutter_firebase/home/page/home_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    carregarHome();
  }

  carregarHome() async {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    analytics.logEvent(name: "Splash");
    final prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('user_id');
    if (userId == null) {
      var uuid = const Uuid();
      userId = uuid.v4();
      await prefs.setString('user_id', userId);
    }
  }

 @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 80,
                child: ClipRRect(
                  child: Image.asset('assets/images/call.png'),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    repeatForever: false,
                    onFinished: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => HomePage()));
                    },
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'CHAT',
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Horizon',
                        ),
                        speed: const Duration(milliseconds: 100)
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
