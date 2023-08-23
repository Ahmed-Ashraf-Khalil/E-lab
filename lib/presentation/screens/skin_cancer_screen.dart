import 'package:e_lab/core/utils/app_images/appimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/app_colors/app_color.dart';
import '../../core/utils/app_strings/appstrings.dart';
import '../controller/cubit.dart';
import '../controller/state.dart';

class SkinScreen extends StatelessWidget {
  const SkinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppColor appColor = AppColor();
    AppStrings appStrings = AppStrings();
    AppImages appImages = AppImages();

    return BlocConsumer<ElabCubit, MainState>(
      listener: (context, state) {},
      builder: (BuildContext context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: appColor.appColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 75.0),
                      child: Text(
                        'Skin Cancer',
                        style: TextStyle(
                            color: appColor.appColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElabCubit.get(context).skinImg == null
                  ? Hero(
                tag: 'SKIN',
                    child: CircleAvatar(
                        maxRadius: 150,
                        backgroundImage: AssetImage(appImages.cancerImage),
                      ),
                  )
                  : CircleAvatar(
                      maxRadius: 150,
                      backgroundImage: FileImage(ElabCubit.get(context).skinImg!),
                    ),
              const SizedBox(
                height: 20,
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
                       ElabCubit.get(context).skinImg == null||ElabCubit.get(context).skinResult==null
                          ? Text(
                              '${appStrings.result}' '',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          : Text(
                              '${appStrings.result}        ${ElabCubit.get(context).skinResult}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.only(top: 8, bottom: 8,),
                decoration: BoxDecoration(
                  color: appColor.appColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: MaterialButton(
                  onPressed: () {
                    ElabCubit.get(context).pickSkinCancerImage();
                  },
                  child: Row(
                    children: [
                      Text(
                        appStrings.pickImageHere,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.photo_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.only(top: 8, bottom: 8,),
                decoration: BoxDecoration(
                  color: appColor.appColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: MaterialButton(
                  onPressed: () {
                    ElabCubit.get(context).uploadSKinCancer();
                  },
                  child: ElabCubit.get(context).skinResultLoading? const CircularProgressIndicator(color: Colors.white,) : Row(
                    children: [
                      Text(
                        appStrings.uploadImage,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.upload,
                        color: Colors.white,
                        size: 30,
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
  }
}
