import 'dart:io';

import 'package:dreamer_flutter/config/dreamer_color.dart';
import 'package:dreamer_flutter/presentation/auth/provider/sign_up_provider.dart';
import 'package:dreamer_flutter/presentation/auth/view/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool imageChoice = false;
  final picker = ImagePicker();
  XFile? image; // 갤러리에서 여러 장의 사진을 선택해서 저장할 변수
  @override
  Widget build(BuildContext context) {
    final signUpNotifier = ref.read(signUpProvider.notifier);
    final signUpState = ref.watch(signUpProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: DreamerColor.g4,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              '환영합니다!',
              style: TextStyle(
                fontFamily: 'suit',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: DreamerColor.g1,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "회원가입을 해주세요",
              style: TextStyle(
                fontFamily: 'suit',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: DreamerColor.black,
              ),
            ),
            const SizedBox(
              height: 31,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    width: 100,
                    height: 100,
                    child: ClipOval(
                      child: imageChoice
                          ? Image.file(
                              File(image!.path),
                              fit: BoxFit.cover,
                            )
                          : SvgPicture.asset(
                              'assets/images/icons/page_manager/signup_filled_icon.svg'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () async {
                        image = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        imageChoice = true;
                        setState(() {});
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: DreamerColor.g3,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              children: [
                Text(
                  '닉네임',
                  style: TextStyle(
                    fontFamily: 'suit',
                    color: DreamerColor.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  '한글 최대 8글자, 중복 불가',
                  style: TextStyle(
                    color: Color(0xffc4c4c4),
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: 345,
              height: 55,
              color: Colors.white,
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: '닉네임을 입력하세요',
                  hintStyle: TextStyle(
                    fontFamily: 'suit',
                    fontSize: 14,
                    color: Color(0xffc4c4c4),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffc4c4c4),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            Text(
              '이메일',
              style: TextStyle(
                fontFamily: 'suit',
                color: DreamerColor.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: 345,
              height: 55,
              color: Colors.white,
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: '이메일을 입력하세요',
                  hintStyle: TextStyle(
                    fontFamily: 'suit',
                    fontSize: 14,
                    color: Color(0xffc4c4c4),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffc4c4c4),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            Text(
              '비밀번호',
              style: TextStyle(
                fontFamily: 'suit',
                color: DreamerColor.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: 345,
              height: 55,
              color: Colors.white,
              child: TextField(
                controller: pwdController,
                decoration: const InputDecoration(
                  hintText: '비밀번호를 입력하세요',
                  hintStyle: TextStyle(
                    fontFamily: 'suit',
                    fontSize: 14,
                    color: Color(0xffc4c4c4),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffc4c4c4),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 72,
            ),
            GestureDetector(
              onTap: () async {
                await signUpNotifier.signUp(
                  nameController.text,
                  emailController.text,
                  pwdController.text,
                  image!.path,
                );
                if (signUpState == SignUpState.success) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                    (route) => false,
                  );
                }
              },
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: DreamerColor.keyDeepPurple,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  width: 340,
                  height: 50,
                  child: Text(
                    "회원가입",
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
