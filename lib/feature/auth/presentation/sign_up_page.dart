import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_course_app/common_util/extensions/build_context_extension.dart';
import 'package:online_course_app/common_widget/button/custom_button.dart';
import 'package:online_course_app/feature/auth/domain/usecases/register/register_params.dart';
import 'package:online_course_app/feature/auth/presentation/sign_in_page.dart';
import 'package:online_course_app/feature/main/main_page.dart';

import '../../../common_util/size/methods.dart';
import '../../../common_widget/button/button_text_widget.dart';
import '../../../common_widget/forms.dart';
import '../../../config/theme/app_theme.dart';
import '../../../config/theme/custom_text_style.dart';
import 'auth_bloc/auth_bloc.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = "sign_up_page";

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isObscure = true;
  bool isObscureConfirm = true;
  final nameCont = TextEditingController(text: '');
  final emailCont = TextEditingController(text: '');
  final passwordCont = TextEditingController(text: '');
  final confirmPassCont = TextEditingController(text: '');

  @override
  void dispose() {
    super.dispose();
    nameCont.dispose();
    emailCont.dispose();
    passwordCont.dispose();
    confirmPassCont.dispose();
  }

  String? validationInput() {
    if (emailCont.text.isEmpty || passwordCont.text.isEmpty) {
      return 'Name, Email or Password can\'t be Empty';
    }

    if (emailCont.text.length < 4 || passwordCont.text.length < 4) {
      return 'Too Short, minimum 4 characters';
    }

    if (passwordCont.text != confirmPassCont.text) {
      return 'Password does not match';
    }

    if (!emailCont.text.contains('@')) {
      return 'Email not valid without @';
    }

    return null;
  }

  void _onSignUpPressed(BuildContext context) {
    context.read<AuthBloc>().add(
          AuthRegister(
            param: RegisterParams(
              name: nameCont.text,
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
              // signLoginText(),
              Text(
                'Join us to exciting\nopportunities and career growth.',
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
                    // NOTE: NAME INPUT
                    CustomFormField(
                      title: 'Full Name',
                      controller: nameCont,
                    ),
                    verticalSpace(16),
                    // NOTE: EMAIL INPUT
                    CustomFormField(
                      title: 'Email Address',
                      controller: emailCont,
                    ),
                    verticalSpace(16),
                    // NOTE: PASSWORD INPUT
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
                    verticalSpace(16),
                    CustomFormField(
                      // maxLines: null,
                      title: 'Confirm Password',
                      obscureText: isObscureConfirm,
                      controller: confirmPassCont,
                      suffixIcon: GestureDetector(
                        onTap: () => setState(() {
                          isObscureConfirm = !isObscureConfirm;
                        }),
                        child: Icon(
                          isObscureConfirm ? Icons.visibility : Icons.visibility_off,
                          color: theme.colorScheme.onPrimaryContainer
                              .withOpacity(1),
                        ),
                      ),
                    ),
                    verticalSpace(30),
                    CustomButtonWidget(
                      title: 'Continue',
                      isLoading: state is AuthLoading,
                      onPressed: () {
                        final message = validationInput();
                        if (message != null) {
                          context.showSnackBar(message);
                          return;
                        }
                        _onSignUpPressed(context);
                      },
                    ),
                  ],
                ),
              ),
              verticalSpace(30),
              Center(
                child: ButtonTextWidget(
                  title: 'Sign In',
                  onTap: () {
                    context.goNamed(SignInPage.routeName);
                  },
                ),
              ),
              verticalSpace(30),
            ],
          );
        },
      ),
    );
  }
}
