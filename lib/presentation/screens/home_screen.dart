import 'package:flutter/material.dart';
import '../../core/utils/app_colors/app_color.dart';
import '../components/diseases_component.dart';
import '../components/trending_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppColor appColor = AppColor();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 20, right: 20,),
            child: Text('Home',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: appColor.appColor,
                  fontSize: 20
              ),
            ),
          ),
          const SizedBox(height: 16,),
          TrendingComponent(),
          const SizedBox(
            height: 16,
          ),
          const DiseasesComponent(),
        ],
      ),
    );
  }
}

