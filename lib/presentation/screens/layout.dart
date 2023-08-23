import 'package:e_lab/presentation/screens/history.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import '../../core/utils/app_colors/app_color.dart';
import 'home_screen.dart';
import 'profileScreen.dart';
import '../controller/cubit.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<AppLayout> {
  late PageController _pageController;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }
  @override
  Widget build(BuildContext context) {
    AppColor appColor = AppColor();

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70),
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.brightness_4_outlined, color: appColor.appColor,),
                onPressed: (){
                  setState(() {
                    ElabCubit.get(context).changeAppMode();
                  });
                },
              ),
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: const <Widget>[
                  HomeScreen(),
                  ProfileScreen(),
                  History(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: ElabCubit.get(context).isDark?Colors.grey.shade900:Colors.grey.shade100,
        onButtonPressed: onButtonPressed,
        iconSize: 30,
        activeColor:  HexColor('6DADB1'),
        selectedIndex: selectedIndex,
        inactiveColor: Colors.grey,
        barItems: <BarItem>[
          BarItem(
            icon: Icons.home,
            title: 'Home',
          ),
          BarItem(
            icon: Icons.person_outline_outlined,
            title: 'Profile',
          ),
          BarItem(
            icon: Icons.history_outlined,
            title: 'History',
          ),
        ],
      ),
    );
  }
}

///Setting screen
// class SettingScreen extends StatelessWidget {
//   AppColor appColor = AppColor();
//   AppStrings appStrings = AppStrings();
//   AppImages appImages = AppImages();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ElabCubit, MainState>(
//       listener: (context, state) {},
//       builder: (context, state) => Scaffold(
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 75.0),
//               child: Text(
//                 appStrings.setting,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 20,
//                     color: appColor.appColor),
//               ),
//             ),
//
//             const Padding(
//               padding: EdgeInsets.only(top: 50.0),
//             ),
//             const SizedBox(
//               height: 6,
//             ),
//             // Text(
//             //   '${ElabCubit.get(context).getUsername()}',
//             //   style: const TextStyle(
//             //     fontWeight: FontWeight.w700,
//             //     fontSize: 20,
//             //     //color: Colors.black,
//             //   ),
//             // ),
//             Text(
//               '${ElabCubit.get(context).credential!.email}',
//               style: const TextStyle(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 20,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16.0),
//               ),
//               margin: const EdgeInsets.only(left: 16, right: 16),
//               elevation: 0.0,
//               shadowColor: Colors.white,
//               child: Row(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(left: 16.0, right: 16),
//                     child: Text('Dark Mode'),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     icon: const Icon(
//                       Icons.brightness_4_outlined,
//                     ),
//                     onPressed: (){
//                       ElabCubit.get(context).changeAppMode();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
