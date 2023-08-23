import 'package:e_lab/core/utils/app_strings/appstrings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_colors/app_color.dart';
import '../components/main_option.dart';
import '../controller/cubit.dart';
import '../controller/state.dart';

class DiabetesScreen extends StatelessWidget {
  const DiabetesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColor appColor = AppColor();

    return BlocBuilder<ElabCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
            child: SingleChildScrollView(
              controller: ElabCubit.get(context).scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back,)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Diabetes',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: appColor.appColor),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 15, left: 15, top: 5, bottom: 2),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Age',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 50,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: ElabCubit.get(context)
                                      .ageEditingController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '35',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: appColor.appColor),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 3,
                                          color: Colors.greenAccent),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    ElabCubit.get(context).editAge(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 12, bottom: 12),
                            height: 1,
                            color: Colors.black12,
                          ),
                          MainOption(
                            title: "Gender",
                            hint: "Male",
                            items: const ['Male', 'Female'],
                            answer: ElabCubit.get(context).gender,
                            onChanged: (newValue) {
                              ElabCubit.get(context).editGender(newValue);
                            },
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 12, bottom: 12),
                            height: 1,
                            color: Colors.black12,
                          ),
                          MainOption(
                            title: "Sudden weight loss?",
                            hint: "Yes",
                            items: const ['Yes', 'No'],
                            answer:
                                ElabCubit.get(context).suddenWeightLoss,
                            onChanged: (newValue) {
                              ElabCubit.get(context)
                                  .editSuddenWeightLoss(newValue);
                            },
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 12, bottom: 12),
                            height: 1,
                            color: Colors.black12,
                          ),
                          Column(
                            children: [
                              MainOption(
                                title: "Polyuria",
                                hint: "Yes",
                                items: const ['Yes', 'No'],
                                answer: ElabCubit.get(context).polyuria,
                                onChanged: (newValue) {
                                  ElabCubit.get(context)
                                      .editPolyuria(newValue);
                                },
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'If you unrinate more than 6-7 times a day',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade700),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 12, bottom: 12),
                            height: 1,
                            color: Colors.black12,
                          ),
                          Column(
                            children: [
                              MainOption(
                                title: "Alopecia",
                                hint: "Yes",
                                items: const ['Yes', 'No'],
                                answer: ElabCubit.get(context).alopecia,
                                onChanged: (newValue) {
                                  ElabCubit.get(context)
                                      .editAlopecia(newValue);
                                },
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Do you suffer from hair loss?',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade700),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 12, bottom: 12),
                            height: 1,
                            color: Colors.black12,
                          ),
                          Column(
                            children: [
                              MainOption(
                                title: "Polydipsia",
                                hint: "Yes",
                                items: const ['Yes', 'No'],
                                answer: ElabCubit.get(context).polydipsia,
                                onChanged: (newValue) {
                                  ElabCubit.get(context)
                                      .editPolydipsia(newValue);
                                },
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'If you feel abnormally thirsty',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade700),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 12, bottom: 12),
                            height: 1,
                            color: Colors.black12,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            margin: const EdgeInsets.all(25),
                            elevation: 0.0,
                            shadowColor: Colors.white,
                            child: SizedBox(
                              height: 65,
                              width: 330,
                              child: Row(
                                children: [
                                  ElabCubit.get(context).diabetesResult==null
                                      ? Text(
                                    '${AppStrings().result}' '',
                                    style: const TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w600),
                                  )
                                      : Text(
                                    '${AppStrings().result}        ${ElabCubit.get(context).diabetesResult}',
                                    style: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: appColor.appColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextButton(
                              onPressed: () {
                                ElabCubit.get(context).postDiabetes();
                              },
                              child: ElabCubit.get(context).diabetesResultLoading? const CircularProgressIndicator(color: Colors.white,) : const Text(
                                'Upload',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
