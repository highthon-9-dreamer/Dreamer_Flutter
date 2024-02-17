import 'package:dreamer_flutter/config/dreamer_color.dart';
import 'package:dreamer_flutter/presentation/auth/provider/sign_in_provider.dart';
import 'package:dreamer_flutter/presentation/auth/view/sign_up_screen.dart';
import 'package:dreamer_flutter/presentation/page_manager/view/page_manager_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(signInProvider);
    final signInNotifier = ref.read(signInProvider.notifier);
    return Scaffold(
      backgroundColor: const Color(0xFF7876D0),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.asset(
              "assets/images/icons/core/on_boarding.png",
            ),
            const SizedBox(height: 13),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: emailController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '아이디',
                  hintStyle: TextStyle(
                    fontFamily: 'suit',
                    fontSize: 14,
                    color: DreamerColor.g2,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 22),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: passwordController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '비밀번호',
                  hintStyle: TextStyle(
                    fontFamily: 'suit',
                    fontSize: 14,
                    color: DreamerColor.g2,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '계정이 없으신가요?',
                  style: TextStyle(
                    color: DreamerColor.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: suit,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: DreamerColor.white,
                      decorationThickness: 2,
                      color: DreamerColor.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: suit,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
              ],
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () async {
                await signInNotifier.signIn(
                    emailController.text, passwordController.text);
                if (signInState == SignInState.success) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const PageManagerScreen(),
                    ),
                    (route) => false,
                  );
                }
              },
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xFF34329C),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 60,
                  height: 50,
                  child: Text(
                    "로그인",
                    style: TextStyle(
                      color: DreamerColor.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
