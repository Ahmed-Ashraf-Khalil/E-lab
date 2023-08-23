import 'package:e_lab/core/utils/app_colors/app_color.dart';
import 'package:e_lab/presentation/controller/cubit.dart';
import 'package:e_lab/presentation/controller/state.dart';
import 'package:e_lab/presentation/screens/login_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/snackBar.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElabCubit,MainState>(
      listener: (context, state) {
        if(state is ResetPassSuccess){
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      },
      builder: (context, state) => Scaffold(
        // appBar: AppBar(
        //   title: Text("Reset Password", style: TextStyle(color: AppColor().appColor),),
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        // ),
        body: Padding(
          padding: const EdgeInsets.all(33.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back, color: AppColor().appColor,)),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
                    Text("Reset Password", style: TextStyle(color: AppColor().appColor, fontSize: 20, fontWeight: FontWeight.bold),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
                    const Text(
                      "Enter your email to rest your password.",
                      style: TextStyle(fontSize: 18, color: Color(0xff6DADB1)),
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 19),
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          return value != null && !EmailValidator.validate(value)
                              ? "Enter a valid email"
                              : null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: ElabCubit.get(context).emailController,
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: Color(0xff6DADB1),
                            ),
                            hintText: "Email",
                            labelStyle: TextStyle(color: Color(0xff6DADB1)),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ElabCubit.get(context).resetPassword(context);
                        } else {
                          showSnackBar(context, "ERROR");
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff6DADB1)),
                        padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Reset Password",
                              style: TextStyle(fontSize: 19, color: Colors.white),
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
