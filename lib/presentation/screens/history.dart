import 'package:e_lab/presentation/components/history_component.dart';
import 'package:e_lab/presentation/screens/brain_history.dart';
import 'package:e_lab/presentation/screens/chest_history.dart';
import 'package:e_lab/presentation/screens/diabetes_history.dart';
import 'package:e_lab/presentation/screens/skin_cancer_history.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors/app_color.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 7),
        child: Column(
          children: [
            Text('History', style: TextStyle(color: AppColor().appColor, fontSize: 20),),
            const SizedBox(height: 50),
            const HistoryComponent(nextScreen: DiabetesHistory(), title: 'Diabetes History'),
            const SizedBox(height: 15),
            const HistoryComponent(nextScreen: SkinHistory(), title: 'Skin cancer History'),
            const SizedBox(height: 15),
            const HistoryComponent(nextScreen: ChestHistory(), title: 'Chest X-ray History'),
            const SizedBox(height: 15),
            const HistoryComponent(nextScreen: BrainTumorHistory(), title: 'Brain History'),
          ],
        ),
      ),
    );
  }
}
