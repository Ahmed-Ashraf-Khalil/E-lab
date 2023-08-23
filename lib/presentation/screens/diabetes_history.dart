import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_lab/core/utils/app_colors/app_color.dart';
import 'package:e_lab/presentation/controller/cubit.dart';
import 'package:e_lab/presentation/controller/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_strings/appstrings.dart';

class DiabetesHistory extends StatelessWidget {
  const DiabetesHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColor appColor = AppColor();
    AppStrings appStrings = AppStrings();

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              appStrings.diabetesHistory,
              style: TextStyle(
                  color: appColor.appColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: appColor.appColor,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8,),
          child: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('userSSS').doc(ElabCubit.get(context).credential!.uid).collection('Diabetes_history').get(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.hasData == false){
                return Center(child: Text('History is empty', style: TextStyle(
                    color: appColor.appColor, fontWeight: FontWeight.w600, fontSize: 20),));
              }else{
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: snapshot.data!.docs.map((document) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 250.0, top: 26),
                            child: Text(
                              document.id,
                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Card(
                            semanticContainer: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            margin: const EdgeInsets.only(left: 16, right: 16),
                            elevation: 0.0,
                            shadowColor: Colors.white,
                            child: Container(
                              //width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.15,
                              padding: const EdgeInsets.all(16.0),
                              child: ListView.builder(
                                itemCount: document['results'].length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Text(
                                        '${document['results'][index]['time']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600, fontSize: 20),
                                      ),
                                      const SizedBox(width: 26),
                                      Text('${document['results'][index]['result']}', style: const TextStyle(
                                          fontWeight: FontWeight.w600, fontSize: 20),)
                                    ],
                                  );
                              }),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              }
            },
          ),
        ),

    );
  }
}
