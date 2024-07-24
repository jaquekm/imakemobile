import 'package:flutter/material.dart';
import 'package:imakemobile/components/build_text_field.dart';
import 'package:imakemobile/components/custom_app_bar.dart';
import 'package:imakemobile/components/widgets.dart';
import 'package:imakemobile/routes/pages.dart';
import 'package:imakemobile/utils/color_palette.dart';
import 'package:imakemobile/utils/font_sizes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'login',
        showBackArrow: false,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildText(
            'E-mail',
            kBlackColor,
            textMedium,
            FontWeight.bold,
            TextAlign.center,
            TextOverflow.clip,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: BuildTextField(
              hint: "E-mail",
              controller: email,
              inputType: TextInputType.emailAddress,
              fillColor: kWhiteColor,
              onChange: (value) {},
            ),
          ),
          const SizedBox(height: 20),
          buildText('Senha', kBlackColor, textMedium, FontWeight.bold,
              TextAlign.start, TextOverflow.clip),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: BuildTextField(
              hint: "Senha",
              controller: senha,
              inputType: TextInputType.visiblePassword,
              fillColor: kWhiteColor,
              onChange: (value) {},
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: screenSize.width * 0.5,
            height: screenSize.height * 0.05,
            child: MaterialButton(
              onPressed: () {
                if (email.text != "" && senha.text != "") {
                  Navigator.pushNamed(context, Pages.home);
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(
                  color: Color.fromARGB(255, 155, 68, 17),
                  width: 3,
                ),
              ),
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}