import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:hauxe/screens/auth_screen/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hauxe/screens/user_info_screen.dart';
import 'package:hauxe/utils/authentication.dart';

class WelcomeScreen extends StatelessWidget {
  final Duration duration = const Duration(milliseconds: 400);
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/welcome.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        margin: const EdgeInsets.all(0),
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FadeInUp(
              duration: duration,
              delay: const Duration(milliseconds: 800),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 50,
                  left: 5,
                  right: 5,
                ),
                width: size.width,
                height: size.height / 3,
                //child: Lottie.asset("assets/icon.png", animate: true),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icon.png"),
                    scale: 10,
                  ),
                ),
              ),
            ),

            ///
            const SizedBox(
              height: 15,
            ),

            /// TITLE
            FadeInUp(
              duration: duration,
              delay: const Duration(milliseconds: 1600),
              child: const Text(
                "Hauxe",
                style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),

            ///
            const SizedBox(
              height: 10,
            ),

            /// SUBTITLE
            FadeInUp(
              duration: duration,
              delay: const Duration(milliseconds: 1000),
              child: const Text(
                "Keep various ways to contact and get in touch easily right from the app.",
                textAlign: TextAlign.center,
                style: TextStyle(height: 0.9, color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
              ),
            ),

            ///
            Expanded(child: Container()),

            /// EMAIL BTN
            FadeInUp(
              duration: duration,
              delay: const Duration(milliseconds: 600),
              child: SButton(
                size: size,
                borderColor: Colors.white,
                color: const Color.fromARGB(255, 54, 54, 54),
                img: 'assets/Gt.png',
                text: "Sign up with Email",
                textStyle: const TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            /// GITHUB BTN
            FadeInUp(
              duration: duration,
              delay: const Duration(milliseconds: 400),
              child: SButton(
                size: size,
                borderColor: Colors.white,
                color: const Color.fromARGB(255, 54, 54, 54),
                img: 'assets/Pt.png',
                text: "Sign up with Phone",
                textStyle: const TextStyle(color: Colors.white),
              ),
            ),

            ///
            const SizedBox(
              height: 20,
            ),

            /// GOOGLE BTN
            FadeInUp(
              duration: duration,
              delay: const Duration(milliseconds: 200),
              child: GButton(
                size: size,
                borderColor: Colors.grey,
                color: Colors.white,
                img: 'assets/g.png',
                text: "Continue with Google",
                textStyle: null,
              ),
            ),

            ///
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class GButton extends StatelessWidget {
  const GButton({
    Key? key,
    required this.size,
    required this.color,
    required this.borderColor,
    required this.img,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  final Size size;
  final Color color;
  final Color borderColor;
  final String img;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () //{
      //Navigator.pushReplacement(
      //context,
      // MaterialPageRoute(
      // builder: ((context) => const SignInScreen()),
      //  ),
      // );
      //}
      //
      onTap: () async {
        // setState(() {
        //  _isSigningIn = true;
        //});
        User? user = await Authentication.signInWithGoogle(context: context);

        // setState(() {
        //   _isSigningIn = false;
        // });

        if (user != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => UserInfoScreen(
                user: user,
              ),
            ),
          );
        }
      },

      child: Container(
        width: size.width / 1.2,
        height: size.height / 15,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10), border: Border.all(color: borderColor, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              height: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class SButton extends StatelessWidget {
  const SButton({
    Key? key,
    required this.size,
    required this.color,
    required this.borderColor,
    required this.img,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  final Size size;
  final Color color;
  final Color borderColor;
  final String img;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const SignInScreen()),
          ),
        );
      },
      child: Container(
        width: size.width / 1.2,
        height: size.height / 15,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10), border: Border.all(color: borderColor, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              height: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class PButton extends StatelessWidget {
  const PButton({
    Key? key,
    required this.size,
    required this.color,
    required this.borderColor,
    required this.img,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  final Size size;
  final Color color;
  final Color borderColor;
  final String img;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const SignInScreen()),
          ),
        );
      },
      child: Container(
        width: size.width / 1.2,
        height: size.height / 15,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10), border: Border.all(color: borderColor, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              height: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
