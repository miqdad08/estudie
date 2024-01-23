import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_course_app/common_util/extensions/build_context_extension.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/feature/auth/presentation/sign_in_page.dart';
import 'package:online_course_app/feature/auth/presentation/sign_up_page.dart';
import 'package:online_course_app/feature/main/main_page.dart';
import '../../../common_widget/button/button_text_widget.dart';
import '../../../common_widget/button/custom_button.dart';
import '../../../config/theme/app_theme.dart';
import 'auth_bloc/auth_bloc.dart';
import 'methods/image_banner.dart';
import 'methods/sign_text.dart';

class WelcomePage extends StatelessWidget {
  static String routeName = "welcome_page";

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
         context.goNamed(MainPage.routeName);
        }
        if (state is AuthFailed) {
          context.showSnackBar(state.message);
        }
      },
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(14),
                  imageBanner(context),
                  verticalSpace(26),
                  signText(),
                  verticalSpace(20),
                  Text(
                    "New way to study abroad from the real professional with great work.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      height: 2.00,
                    ),
                  ),
                  verticalSpace(35),
                  CustomButtonWidget(
                    onPressed: () {
                      context.goNamed(SignUpPage.routeName);
                    },
                    title: "Create New Account",
                  ),
                  verticalSpace(31),
                  Align(
                    alignment: Alignment.center,
                    child: ButtonTextWidget(
                      onTap: () {
                        context.goNamed(SignInPage.routeName);
                      },
                      title: "Sign In to My Account",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
