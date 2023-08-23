import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class GetData extends StatelessWidget {
  final String documentId;

  const GetData({Key? key, required this.documentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('userSSS');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            children: [SizedBox(
              height: 50,
              child: Card(
                semanticContainer: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                margin: const EdgeInsets.only(left: 16, right: 16),
                elevation: 0.0,
                shadowColor: Colors.white,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.person),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "${data['username']}",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                height: 50,
                child: Card(
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  elevation: 0.0,
                  shadowColor: Colors.white,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(Icons.male),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "${data['gender']}",
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                height: 50,
                child: Card(
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  elevation: 0.0,
                  shadowColor: Colors.white,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(Icons.accessibility_outlined),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        '${AgeCalculator.age(DateTime(data['ageYear'], data['ageMonth'], data['ageDay']),).years}',
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                height: 50,
                child: Card(
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  elevation: 0.0,
                  shadowColor: Colors.white,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(Icons.bloodtype_outlined),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        " ${data['bloodType']} ",
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return const Text("loading");
      },
    );
  }
}
