import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_colors/app_color.dart';
import '../../core/utils/app_strings/appstrings.dart';
import '../controller/cubit.dart';
import '../controller/state.dart';

class BrainTumorHistory extends StatelessWidget {
  const BrainTumorHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColor appColor = AppColor();
    AppStrings appStrings = AppStrings();

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Center(
          child: Text(
            appStrings.brainHistory,
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
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('userSSS').doc(ElabCubit.get(context).credential!.uid).collection('Brain_history').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasData == false){
            return Center(child: Text('History is empty', style: TextStyle(
                color: appColor.appColor, fontWeight: FontWeight.w600, fontSize: 20),));
          }else{
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0, right: 8, left: 8),
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        margin: const EdgeInsets.only(left: 16, right: 16),
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
                    ],
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
