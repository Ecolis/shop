import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import 'create_account_screen.dart';
import 'password_screen.dart';
import '../theme/assets_paths.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.loginBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          Positioned(
            top: MediaQuery.of(context).size.height / 1.8,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 8),
                
                Row(
                  children: [
                    Text(
                      'Good to see you back!',
                      style: AppTextStyles.titleSmall,
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.favorite,
                      size: 16,
                      color: AppColors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColors.greyLight,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: AppTextStyles.hintText,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                SizedBox(
                  width: double.infinity,
                  height: 61,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PasswordScreen()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                SizedBox(
                  width: double.infinity,
                  height: 61,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CreateAccountScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.transparent,
                      backgroundColor: AppColors.transparent,
                    ),
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: AppColors.black,
                      ),
                    ),
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