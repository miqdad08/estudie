import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../common_widget/button/button_text_widget.dart';
import '../../../common_widget/button/custom_button.dart';
import '../../../config/theme/app_theme.dart';
import 'methods/image_banner.dart';
import 'methods/sign_text.dart';

class WelcomePage extends StatelessWidget {
  static String routeName = "welcome_page";
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                imageBanner(context),
                const SizedBox(height: 26),
                signText(),
                const SizedBox(height: 20),
                Text(
                  "New way to study abroad from the real professional with great work.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    height: 2.00,
                  ),
                ),
                const SizedBox(height: 35),
                const CustomButtonWidget(
                  text: "Create New Account",
                ),
                const SizedBox(height: 31),
                Align(
                  alignment: Alignment.center,
                  child: ButtonTextWidget(
                    onTap: () {
                      context.goNamed('main_page');
                    },
                    title: "Sign In to My Account",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
