import 'package:e_lab/presentation/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_colors/app_color.dart';
import '../../core/utils/app_images/appimages.dart';
import '../../core/utils/app_strings/appstrings.dart';
import '../components/dataFromFirestore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final credential = FirebaseAuth.instance.currentUser;

  AppColor appColor = AppColor();

  AppStrings appStrings = AppStrings();

  AppImages appImages = AppImages();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 20, left: 20),
            child: Text(
              appStrings.profile,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: appColor.appColor),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 50.0)),
          const SizedBox(height: 6),
          const Text(
            '',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              //color: Colors.black,
            ),
          ),
          ///E-mail
          Text(
            '${credential!.email}',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 20),
          GetData(
            documentId: credential!.uid,
          ),
          const SizedBox(height: 22),
          ///City
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
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.location_on_outlined),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text('Egypt, Cairo'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          ///Logout
          SizedBox(
            height: 50,
            child: Card(
              margin: const EdgeInsets.only(left: 16, right: 16),
              elevation: 0.0,
              shadowColor: Colors.white,
              child: TextButton.icon(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  if (mounted) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()));
                  }
                },
                label: const Text(
                  "logout",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff6DADB1),
                  ),
                ),
                icon: const Icon(
                  Icons.logout,
                  color: Color(0xff6DADB1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
