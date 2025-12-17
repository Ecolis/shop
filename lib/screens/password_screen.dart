import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import 'shop_screen.dart';
import '../theme/assets_paths.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 1.8,
            child: Image.asset(
              AppAssets.passwordBackground,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.8,
              fit: BoxFit.cover,
            ),
          ),
          
          Positioned(
            top: MediaQuery.of(context).size.height / 2.5,
            left: 24,
            right: 24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hello!',
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                
                Text(
                  'Type your password',
                  style: AppTextStyles.titleSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: AppTextStyles.hintText,
                    suffixIcon: Icon(Icons.visibility_off, size: 16, color: AppColors.textPrimary),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 50,
            left: 24,
            right: 24,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ShopScreen()),
                    );
                  },
                  child: Text(
                    'Start',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                
                const SizedBox(height: 20),
                
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.transparent,
                    backgroundColor: AppColors.transparent,
                    shadowColor: AppColors.transparent,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}