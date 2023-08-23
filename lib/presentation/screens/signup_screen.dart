import 'package:e_lab/core/utils/app_colors/app_color.dart';
import 'package:e_lab/presentation/controller/cubit.dart';
import 'package:e_lab/presentation/controller/state.dart';
import 'package:e_lab/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElabCubit, MainState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const AppLayout()));
        }
      },
      builder: (context, state) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: ElabCubit.get(context).formKeySignUp,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontFamily: "myfont",
                        // fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Color(0xff6DADB1)),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "Please enter your login amd your password",
                      style: TextStyle(fontSize: 15, color: Color(0xff6DADB1)),
                    ),
                  ),
                  const SizedBox(height: 25),
                  ///user name text field
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
                      controller: ElabCubit.get(context).userNameController,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Color(0xff6DADB1),
                          ),
                          hintText: "user name",
                          labelStyle: TextStyle(color: Color(0xff6DADB1)),
                          border: InputBorder.none),
                      validator: (value) {
                        return value == null || value.isEmpty ||
                                value.length < 3 ? 'enter valid name' : null;
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
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
                          icon: Icon(
                            Icons.email,
                            color: Color(0xff6DADB1),
                          ),
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
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 19),
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: 380,
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: ElabCubit.get(context).passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          // suffix: Icon(
                          //   Icons.visibility,
                          //   color: Color(0xff6DADB1),
                          // ),
                          icon: Icon(
                            Icons.lock,
                            color: Color(0xff6DADB1),
                            size: 19,
                          ),
                          hintText: "password",
                          labelStyle: TextStyle(color: Color(0xff6DADB1)),
                          border: InputBorder.none),
                      validator: (value) {
                        return value == null || value.isEmpty || value.length < 6? 'Please enter at least 6 characters' : null;
                      },
                    ),
                  ),
                  ///phone text field
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
                      controller: ElabCubit.get(context).phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.phone,
                            color: Color(0xff6DADB1),
                          ),
                          hintText: "phone",
                          labelStyle: TextStyle(color: Color(0xff6DADB1)),
                          border: InputBorder.none),
                      validator: (value) {
                        return value == null || value.isEmpty || value.length < 11 || !value.startsWith('01') ? 'enter valid phone' : null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  ///blood type and gender fields
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        margin: const EdgeInsets.symmetric(horizontal: 19),
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.transgender_outlined),
                            DropdownButton(
                              alignment: Alignment.center,
                              value: ElabCubit.get(context).accountGender,
                              elevation: 30,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                              hint: const Text(
                                'Male',
                                //style: TextStyle(color: Colors.black),
                              ),
                              dropdownColor: HexColor('#6DADB1'),
                              icon: Container(
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                ),
                              ),
                              onChanged: (newValue) {
                                ElabCubit.get(context).editAccountGender(newValue!);
                              },
                              underline: Container(
                                height: 0,
                                color: Colors.black,
                              ),
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              items: ['Male','Female']
                                  .map<DropdownMenuItem<String>>((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 19),
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.bloodtype_outlined),
                            DropdownButton(
                              alignment: AlignmentDirectional.center,
                              value: ElabCubit.get(context).accountBlood,
                              elevation: 30,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                              menuMaxHeight: 130,
                              hint: const Text(
                                'A+',
                                //style: TextStyle(color: Colors.black),
                              ),
                              dropdownColor: HexColor('#6DADB1'),
                              icon: Container(
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                ),
                              ),
                              onChanged: (newValue) {
                                ElabCubit.get(context).editAccountBlood(newValue!);
                              },
                              underline: Container(
                                height: 0,
                                color: Colors.black,
                              ),
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              items: ['A+','A-','B+','B-','O+','O-','AB+','AB-']
                                  .map<DropdownMenuItem<String>>((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ///birthdate picker
                  InkWell(
                    onTap: () => ElabCubit.get(context).pickDate(context),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.calendar_month_outlined),
                          const SizedBox(width: 10,),
                          Text(ElabCubit.get(context).birthdate == null? 'Birth date' :
                          '${ElabCubit.get(context).birthdate!.day}/${ElabCubit.get(context).birthdate!.month}/${ElabCubit.get(context).birthdate!.year}',
                            style: const TextStyle(fontSize: 18),),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ///sign up button
                  ElevatedButton(
                    onPressed: () {
                      ElabCubit.get(context).register(context);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff6DADB1)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 120, vertical: 12)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13))),
                    ),
                    child: const Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ///google sign in button
                  // Container(
                  //   width: 330,
                  //   height: 55,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: const Color(0xff6DADB1)),
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       ElabCubit.get(context).googleSignIn(context);
                  //     },
                  //     style: ButtonStyle(
                  //       backgroundColor:
                  //           MaterialStateProperty.all(Colors.white),
                  //       padding: MaterialStateProperty.all(
                  //           const EdgeInsets.symmetric(
                  //               horizontal: 12, vertical: 15)),
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
                  // const SizedBox(height: 12),
                  ///already have an account button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const LoginScreen()));
                          },
                          child: Text(
                            " Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor().appColor,
                            ),
                          ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 17),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
