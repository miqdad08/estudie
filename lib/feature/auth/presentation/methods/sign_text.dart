import 'package:flutter/material.dart';

import '../../../../config/theme/custom_text_style.dart';

RichText signText() {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "Learn.\n",
          style: CustomTextStyles.poppinsOnPrimaryContainer,
        ),
        TextSpan(
          text: "Practice.\n",
          style: CustomTextStyles.poppinsPrimaryContainer,
        ),
        TextSpan(
          text: "Earn.",
          style: CustomTextStyles.poppinsOnPrimaryContainer,
        ),
      ],
    ),
    textAlign: TextAlign.left,
  );
}