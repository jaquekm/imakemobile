import 'package:flutter/material.dart';
import 'package:imakemobile/components/custom_app_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppBar(
          title: 'Informações dos desenvolvedores',
        ),
        body: Container(
          margin: const EdgeInsets.all(75),
          child: const Center(
            child: Text(
                'Acadêmica Jaqueline Kogh do curso de pós graduação em desemvolvimento web e mobile'
            ),
          ),
        ));
}
