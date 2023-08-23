import 'package:e_lab/presentation/screens/diabetes_screen.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors/app_color.dart';
import '../../core/utils/app_images/appimages.dart';
import '../../core/utils/app_strings/appstrings.dart';
import '../screens/brain_tumor_screen.dart';
import '../screens/skin_cancer_screen.dart';
import '../screens/x_ray_screen.dart';

class DiseasesComponent extends StatelessWidget {


  const DiseasesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    AppColor appColor = AppColor();
    AppStrings appStrings = AppStrings();
    AppImages appImages = AppImages();

    return Column(
      children: [
        ///Diabetes
        InkWell(
          onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const DiabetesScreen()));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              color: appColor.appColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage(appImages.diabetesImage),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  appStrings.diabetes,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        ///Skin cancer
        InkWell(
          onTap: () {
            Navigator.push(context,
                PageRouteBuilder(pageBuilder: (_, __, ___) => const SkinScreen(),
                transitionDuration: const Duration(seconds: 1)));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              color: appColor.appColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Hero(
                  tag: 'SKIN',
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage(appImages.cancerImage),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  appStrings.skinCancer,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        ///Xray
        InkWell(
          onTap: () {
            Navigator.push(
                context, PageRouteBuilder(pageBuilder: (_, __, ___) => const XrayScreen(),
                transitionDuration: const Duration(seconds: 1)));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              color: appColor.appColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Hero(
                  tag: 'XRAY',
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage(appImages.xRayImage),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  appStrings.xRay,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        ///Brain
        InkWell(
          onTap: () {
            Navigator.push(
                context, PageRouteBuilder(pageBuilder: (_, __, ___) => const BrainTumorScreen(),
                transitionDuration: const Duration(seconds: 1)));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              color: appColor.appColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Hero(
                  tag: 'BRAIN',
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage(appImages.brainTumorImage),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  appStrings.brainTumor,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
