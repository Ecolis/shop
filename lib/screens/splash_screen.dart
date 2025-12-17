import 'package:flutter/material.dart';
import 'create_account_screen.dart';
import '../theme/colors.dart';
import '../theme/assets_paths.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const CreateAccountScreen()),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.splashLogo,
                width: 300,
                height: 300,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.shopping_bag,
                    size: 120,
                    color: Theme.of(context).primaryColor,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}