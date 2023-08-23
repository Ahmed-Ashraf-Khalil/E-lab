import 'package:e_lab/core/utils/app_colors/app_color.dart';
import 'package:flutter/material.dart';

class HistoryComponent extends StatelessWidget {
  final Widget nextScreen;
  final String title;

  const HistoryComponent(
      {Key? key, required this.nextScreen, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor().appColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => nextScreen)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 18),),
            const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
