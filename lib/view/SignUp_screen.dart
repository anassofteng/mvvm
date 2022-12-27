import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/authview_model.dart';

class SignUp_view extends StatefulWidget {
  const SignUp_view({super.key});

  @override
  State<SignUp_view> createState() => _SignUp_viewState();
}

class _SignUp_viewState extends State<SignUp_view> {
  @override
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('SignUp ')),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: InputDecoration(
                  hintText: 'email',
                  labelText: 'email',
                  prefixIcon: Icon(Icons.alternate_email)),
              onFieldSubmitted: ((valu) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              }),
            ),
            ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword.value,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                        hintText: 'password',
                        labelText: 'password',
                        prefixIcon: Icon(Icons.lock_open_rounded),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obscurePassword.value = !_obscurePassword.value;
                            },
                            child: Icon(_obscurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility))),
                  );
                }),
            SizedBox(
              height: height * .085,
            ),
            RoundButton(
              title: 'SignUp',
              loading: AuthViewMode.SignUpLoading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErroressage('Please enter your email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErroressage(
                      'Please enter your Password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErroressage(
                      'Please enter 6 digit password', context);
                } else {
                  Map data = {
                    'email': _emailController.text.toString(),
                    'password': _passwordController.text.toString()
                  };
                  AuthViewMode.SignupApi(data, context);
                  print('API hit');
                }
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
                onTap: () => Navigator.pushNamed(context, RoutesName.signup),
                child: const Text('Already have an acount ? Login')),
          ],
        ),
      ),
    );
  }
}
