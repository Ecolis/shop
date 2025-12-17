import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import '../theme/assets_paths.dart';
import 'favourites_screen.dart';
import 'cart_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ShopContent(),
    const FavouritesScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.shop, width: 24, height: 24),
            activeIcon: Image.asset(AppAssets.shopFilled, width: 24, height: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.favorites, width: 24, height: 24),
            activeIcon: Image.asset(AppAssets.favoritesFilled, width: 24, height: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.cart, width: 24, height: 24),
            activeIcon: Image.asset(AppAssets.cartFilled, width: 24, height: 24),
            label: '',
          ),
        ],
      ),
    );
  }
}

class ShopContent extends StatefulWidget {
  const ShopContent({super.key});

  @override
  State<ShopContent> createState() => _ShopContentState();
}

class _ShopContentState extends State<ShopContent> {
  final List<bool> _favourites = List.generate(6, (index) => false);
  final List<bool> _inCart = List.generate(6, (index) => false);

  void _toggleFavourite(int index) {
    setState(() {
      _favourites[index] = !_favourites[index];
    });
  }

  void _addToCart(int index) {
    setState(() {
      _inCart[index] = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Product ${index + 1} added to cart'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Row(
              children: [
                Text(
                  'Shop',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(width: 16),
                
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color:  AppColors. blueLight, 
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Clothing',
                        hintStyle: TextStyle(
                          color: AppColors.primary, 
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                        border: InputBorder.none,
                        filled: false, 
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      ),
                      style: TextStyle(
                        color: AppColors.primary, 
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return _buildProductCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(int index) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.greyLight,
                  ),
                  child: Image.asset(
                    AppAssets.getProductImage(index),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.greyLight,
                        child: Image.asset(AppAssets.flag, width: 40, height: 40),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                
                Text(
                  'pkjkkm',
                  style: AppTextStyles.productDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                
                Text(
                  '\$17,00',
                  style: AppTextStyles.priceText,
                ),
              ],
            ),
            
            Positioned(
              top: 8,
              left: 8,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => _toggleFavourite(index),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        _favourites[index] ? AppAssets.heartFilled : AppAssets.heart,
                        width: 22,
                        height: 22,
                        color: _favourites[index] ? Colors.red : AppColors.greyMedium,
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  
                  GestureDetector(
                    onTap: () => _addToCart(index),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        _inCart[index] ? AppAssets.shoppingFilled : AppAssets.shopping,
                        width: 22,
                        height: 22,
                        color: _inCart[index] ? AppColors.primary : AppColors.greyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}