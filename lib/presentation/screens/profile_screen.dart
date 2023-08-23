// import 'package:e_lab/presentation/controller/cubit.dart';
// import 'package:e_lab/presentation/controller/state.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../core/utils/app_colors/app_color.dart';
// import '../../core/utils/app_images/appimages.dart';
// import '../../core/utils/app_strings/appstrings.dart';
//
// class ProfileScreen extends StatelessWidget {
//   AppColor appColor = AppColor();
//   AppStrings appStrings = AppStrings();
//   AppImages appImages = AppImages();
//   final credential = FirebaseAuth.instance.currentUser;
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ElabCubit,MainState>(
//       listener: (context,state){},
//       builder: (context,state)=>Scaffold(
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 75.0),
//               child: Text(appStrings.profile,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 20,
//                     color: appColor.appColor
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 50.0),
//               child: Center(
//                 child: CircleAvatar(
//                   maxRadius: 50,
//                   child: Image.asset(
//                     appImages.profileImage,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 6,
//             ),
//              Text(
//               '${credential!.displayName}' ,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 20,
//                 //color: Colors.black,
//               ),
//             ),
//              Text(
//               '${credential!.email}' ,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w300,
//                 fontSize: 12,
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 20,),
//             SizedBox(
//               height: 50,
//               child: Card(
//                 semanticContainer: true,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16.0),
//                 ),
//                 margin: const EdgeInsets.only(left: 16,right: 16),
//                 elevation: 0.0,
//                 shadowColor: Colors.white,
//
//                 child: Row(
//                   children:const  [
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.0),
//                       child: Icon(Icons.location_on_outlined),
//                     ),
//                     SizedBox(width: 16,),
//                     Text( '' ,),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16,),
//             SizedBox(
//               height: 50,
//               child: Card(
//                 semanticContainer: true,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16.0),
//                 ),
//                 margin: const EdgeInsets.only(left: 16,right: 16),
//                 elevation: 0.0,
//                 shadowColor: Colors.white,
//                 child: Row(
//                   children:const  [
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.0),
//                       child: Icon(Icons.male),
//                     ),
//                     SizedBox(width: 16,),
//                     Text('Male'),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16,),
//             SizedBox(
//               height: 50,
//               child: Card(
//                 semanticContainer: true,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16.0),
//                 ),
//                 margin: const EdgeInsets.only(left: 16,right: 16),
//                 elevation: 0.0,
//                 shadowColor: Colors.white,
//                 child: Row(
//                   children:const [
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.0),
//                       child:Icon(Icons.accessibility_outlined),
//                     ),
//                     SizedBox(width: 16,),
//                     Text('21'),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16,),
//             SizedBox(
//               height: 50,
//               child: Card(
//                 semanticContainer: true,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16.0),
//                 ),
//                 margin: const EdgeInsets.only(left: 16,right: 16),
//                 elevation: 0.0,
//                 shadowColor: Colors.white,
//                 child: Row(
//                   children:const  [
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.0),
//                       child: Icon(Icons.bloodtype_outlined),
//                     ),
//                     SizedBox(width: 16,),
//                     Text('B+'),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16,),
//             SizedBox(
//               height: 50,
//               child: Card(
//
//                 margin: const EdgeInsets.only(left: 16, right: 16),
//                 elevation: 0.0,
//                 shadowColor: Colors.white,
//                 child:   TextButton.icon(
//                   onPressed: () async {
//                     await FirebaseAuth.instance.signOut();
//                   },
//                   label: const Text(
//                     "logout",
//                     style: TextStyle(fontSize: 20,
//                       color: Color(0xff6DADB1),
//                     ),
//                   ),
//                   icon: const Icon(
//                     Icons.logout,
//                     color: Color(0xff6DADB1),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
