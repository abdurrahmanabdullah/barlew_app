
import 'package:flutter/material.dart';

import '../helpers/navigation_service.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          NavigationService.goBack;
        },
        child: const Icon(
          Icons.arrow_back_ios,
          // color: AppColors.c000000,
        ));
  }
}

