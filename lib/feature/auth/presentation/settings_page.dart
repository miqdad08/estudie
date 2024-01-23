import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_course_app/common_widget/button/custom_button.dart';
import 'package:online_course_app/config/theme/app_theme.dart';
import 'package:online_course_app/feature/auth/presentation/welcome_page.dart';

import '../../../common_util/size/methods.dart';
import 'auth_bloc/auth_bloc.dart';
import 'methods/profile_item.dart';
import 'methods/user_info.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthInitial){
          context.goNamed(WelcomePage.routeName);
        }
      },
      builder: (context, state) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  verticalSpace(20),
                  userInfo(),
                  verticalSpace(20),
                  Divider(
                    color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                  ),
                  verticalSpace(20),
                  profileItem('Update Profile'),
                  // verticalSpace(20),
                  // profileItem(
                  //   'My Wallet',
                  //   onTap: () => ref.read(routerProvider).pushNamed('wallet'),
                  // ),
                  verticalSpace(20),
                  profileItem('Change Password'),
                  verticalSpace(20),
                  profileItem('Change Language'),
                  verticalSpace(20),
                  Divider(
                    color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                  ),
                  verticalSpace(20),
                  profileItem('Contact Us'),
                  verticalSpace(20),
                  profileItem('Privacy Policy'),
                  verticalSpace(20),
                  profileItem('Terms and Conditions'),
                  verticalSpace(60),
                  CustomButtonWidget(
                    isLoading: state is AuthLoading,
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        AuthLogout()
                      );
                    },
                    title: 'Logout',
                  ),
                  verticalSpace(20),
                  const Text(
                    'version 0.0.1',
                    style: TextStyle(fontSize: 12),
                  ),
                  verticalSpace(100),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
