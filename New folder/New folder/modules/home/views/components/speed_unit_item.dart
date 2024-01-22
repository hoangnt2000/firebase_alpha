import '../../../../ui/ui.dart';
import '../../controllers/home_controller.dart';
import '../../../../servive/location_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpeedUnitItem extends GetWidget<HomeController> {
  const SpeedUnitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButton<SpeedUnit>(
        value: controller.speedUnit.value,
        focusColor: UI.color.black,
        elevation: 16,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onChanged: (SpeedUnit? value) {
          controller.speedUnit.value = value!;
        },
        items: speedUnitList.map<DropdownMenuItem<SpeedUnit>>((speedUnit) {
          return DropdownMenuItem<SpeedUnit>(
            alignment: Alignment.center,
            value: speedUnit,
            child: Text(
              "${speedUnit.name}/h",
              style: UI.textStyle.H4,
            ),
          );
        }).toList(),
      );
    });
  }
}
