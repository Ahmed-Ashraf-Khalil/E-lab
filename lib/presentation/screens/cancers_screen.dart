// import 'package:elab/core/utils/app_colors/app_color.dart';
// import 'package:elab/presentation/screens/skin_cancer_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// class CancerScreen extends StatelessWidget {
// AppColor appColor =AppColor();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 40.0),
//               child: Row(
//                 children: [
//                   IconButton(onPressed: (){
//                     Navigator.pop(context);
//                   }, icon:Icon( Icons.arrow_back),
//                     color: appColor.appColor,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 100.0),
//                     child: Text('Cancer',
//                     style: TextStyle(
//                       color: appColor.appColor,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20
//                     ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 330,
//               width: double.infinity,
//               child: Image.network(
//                   'https://img.freepik.com/premium-vector/oncology-patient-having-chemotherapy-woman-with-cancer-gets-drip-vector-concept-cancer-treatment-medicine-illustration-flat-cartoon-style-isolated-white-background_351831-52.jpg?w=740'),
//             ),
//             MaterialButton(
//               onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>SkinScreen()));
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: HexColor("#6DADB1"),
//                 ),
//                 height: 150,
//                 width: 300,
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: Text(
//                         'Skin\nCancer',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Spacer(),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 16.0),
//                       child: Image.network(
//                         'https://cdn0.iconfinder.com/data/icons/disease-and-treatments-vol-1-colored/130/Asset_33-512.png',
//
//                         height: 70,
//                         width: 70,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }