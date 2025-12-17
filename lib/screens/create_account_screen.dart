import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import 'login_screen.dart';
import '../theme/assets_paths.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

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
            height: MediaQuery.of(context).size.height / 3,
            child: Image.asset(
              AppAssets.createAccountBackground,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              fit: BoxFit.cover,
            ),
          ),
          
          Positioned(
            top: 122,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  'Account',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),
          
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 1.8,
            child: Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: AppTextStyles.hintText,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: AppTextStyles.hintText,
                      suffixIcon: Icon(Icons.visibility_off, size: 16, color: AppColors.textPrimary),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Your number',
                      hintStyle: AppTextStyles.hintText,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          AppAssets.flag,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    child: Text(
                      'Done',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}