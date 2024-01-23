import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_course_app/common_util/extensions/build_context_extension.dart';
import 'package:online_course_app/common_widget/button/button_text_widget.dart';
import 'package:online_course_app/common_widget/button/custom_button.dart';
import 'package:online_course_app/feature/auth/domain/usecases/login/login_params.dart';
import 'package:online_course_app/feature/auth/presentation/sign_up_page.dart';

import '../../../common_util/size/methods.dart';
import '../../../common_widget/forms.dart';
import '../../../config/theme/app_theme.dart';
import '../../../config/theme/custom_text_style.dart';
import '../../main/main_page.dart';
import 'auth_bloc/auth_bloc.dart';

class SignInPage extends StatefulWidget {
  static String routeName = "sign_in_page";

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isObscure = true;
  final emailCont = TextEditingController(text: '');
  final passwordCont = TextEditingController(text: '');

  @override
  void dispose() {
    super.dispose();
    emailCont.dispose();
    passwordCont.dispose();
  }

  String? validationInput() {
    if (emailCont.text.isEmpty || passwordCont.text.isEmpty) {
      return 'Name, Email or Password can\'t be Empty';
    }

    if (emailCont.text.length < 4 || passwordCont.text.length < 4) {
      return 'Too Short, minimum 4 characters';
    }

    if (!emailCont.text.contains('@')) {
      return 'Email not valid without @';
    }

    return null;
  }

  void _onSignInPressed(BuildContext context) {
    context.read<AuthBloc>().add(
          AuthLogin(
            param: LoginParams(
              email: emailCont.text,
              password: passwordCont.text,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            context.showSnackBar(state.message);
          }
          if (state is AuthSuccess) {
            context.goNamed(MainPage.routeName);
          }
        },
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 100,
                  bottom: 80,
                ),
                child: Text(
                  'ëstudiè.',
                  style: CustomTextStyles.poppinsPrimaryContainer50,
                ),
              ),
              Text(
                'Sign In &\nGrowth Your Career',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalSpace(30),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.colorScheme.errorContainer,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      title: 'Email Address',
                      controller: emailCont,
                    ),
                    verticalSpace(16),
                    CustomFormField(
                      title: 'Password',
                      obscureText: isObscure,
                      controller: passwordCont,
                      suffixIcon: GestureDetector(
                        onTap: () => setState(() {
                          isObscure = !isObscure;
                        }),
                        child: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                          color: theme.colorScheme.onPrimaryContainer
                              .withOpacity(1),
                        ),
                      ),
                    ),
                    verticalSpace(8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password',
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: appTheme.deepPurpleA700,
                        ),
                      ),
                    ),
                    verticalSpace(30),
                    CustomButtonWidget(
                      title: 'Sign In',
                      isLoading: state is AuthLoading,
                      onPressed: () {
                        final message = validationInput();
                        if (message != null) {
                          context.showSnackBar(message);
                          return;
                        }
                        _onSignInPressed(context);
                      },
                    ),
                  ],
                ),
              ),
              verticalSpace(30),
              Align(
                alignment: Alignment.center,
                child: ButtonTextWidget(
                  title: 'Create New Account',
                  onTap: () {
                    context.goNamed(SignUpPage.routeName);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
