import 'package:flutter/material.dart';
import 'package:helth_pay/Components/round_edge_button.dart';
import 'package:helth_pay/Components/rounded_Button.dart';


class SettingsTiles extends StatelessWidget {
  const SettingsTiles({
    Key? key,
    required this.tileTitle,
    required this.leftIcon,
    this.onPressed,
  }) : super(key: key);

  final String tileTitle;
  final IconData leftIcon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedEdgeButton(
              buttonIcon: leftIcon,
              iconRotation: 39.4,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(tileTitle)
          ],
        ),
        RoundedButton(
          onPressed: onPressed,
        )
      ],
    );
  }
}
