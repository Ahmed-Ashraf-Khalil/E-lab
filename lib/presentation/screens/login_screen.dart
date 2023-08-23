import 'package:e_lab/core/utils/app_colors/app_color.dart';
import 'package:e_lab/presentation/screens/layout.dart';
import 'package:e_lab/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_password.dart';
import '../controller/cubit.dart';
import '../controller/state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElabCubit,MainState>(
      listener: (context,state){
        if(state is LoginSuccess){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const AppLayout()));
        }
      },
      builder: (context,state)=>SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: ElabCubit.get(context).formKeyLogin,
              child: Column(
                children: [
                  const SizedBox(height: 140),
                  const Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'myfont',
                        fontSize: 50,
                        color: Color(0xff6DADB1)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "Please enter your email and your password",
                      style: TextStyle(fontSize: 15, color: Color(0xff6DADB1)),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ///email text field
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 19),
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: 380,
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: ElabCubit.get(context).emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: "Email",
                          labelStyle: TextStyle(color: Color(0xff6DADB1)),
                          border: InputBorder.none),
                      validator: (value) {
                        return value == null || value.isEmpty || !value.contains('@')? 'enter valid email' : null;
                      },
                    ),
                  ),
                  ///password text field
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 19),
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: ElabCubit.get(context).passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "password",
                          labelStyle: TextStyle(color: Color(0xff6DADB1)),
                          border: InputBorder.none),
                      validator: (value) {
                        return value == null || value.isEmpty || value.length < 6? 'Please enter at least 6 characters' : null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ///login button
                  ElevatedButton(
                    onPressed: () {
                      ElabCubit.get(context).signIn(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xff6DADB1)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 135, vertical: 12)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  ///forgot password button
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  const ForgotPassword()));
                    },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(0xff6DADB1)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                      ),
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        //decoration: TextDecoration.underline,
                      ),
                    ),
                ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ///google sign in button
                  // Container(width: 330,
                  //   height: 55,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: const Color(0xff6DADB1)),
                  //     borderRadius: BorderRadius.circular(12),),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       ElabCubit.get(context).googleSignIn(context);
                  //     },
                  //     style: ButtonStyle(
                  //       backgroundColor: MaterialStateProperty.all(Colors.white),
                  //       padding: MaterialStateProperty.all(
                  //           const EdgeInsets.symmetric(horizontal: 12, vertical: 15)),
                  //       shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(13))),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         SvgPicture.asset(
                  //           "assets/icons/google.svg",
                  //           height: 27,
                  //         ),
                  //         const Text(
                  //           "  Or sign-in with Google",
                  //           style: TextStyle(
                  //             color: Colors.blueAccent,
                  //             fontSize: 18,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 12,
                  // ),
                  ///not have account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not a member yet? "),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const SignUp()));
                          },
                          child: Text(
                            " Register",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: AppColor().appColor),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}