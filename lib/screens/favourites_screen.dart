import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import '../theme/assets_paths.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final List<Map<String, dynamic>> _favouriteProducts = [
    {
      'id': 1,
      'name': 'Product 1',
      'price': '\$17,00',
      'description': 'pkjkkm',
      'image': AppAssets.getProductImage(0),
    },
    {
      'id': 2,
      'name': 'Product 2',
      'price': '\$17,00',
      'description': 'pkjkkm',
      'image': AppAssets.getProductImage(1),
    },
    {
      'id': 3,
      'name': 'Product 3',
      'price': '\$17,00',
      'description': 'pkjkkm',
      'image': AppAssets.getProductImage(2),
    },
  ];

  void _removeFromFavourites(int index) {
    setState(() {
      _favouriteProducts.removeAt(index);
    });
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
            const SizedBox(height: 40),
            Text(
              'Favourites',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 16),
            
            if (_favouriteProducts.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.heart,
                        width: 64,
                        height: 64,
                        color: AppColors.greyMedium,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No favourites yet',
                        style: AppTextStyles.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Add products to your favourites',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.greyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: _favouriteProducts.length,
                  itemBuilder: (context, index) {
                    return _buildFavouriteProductCard(index);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavouriteProductCard(int index) {
    final product = _favouriteProducts[index];
    
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
                    product['image'],
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
                  product['description'],
                  style: AppTextStyles.productDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                
                Text(
                  product['price'],
                  style: AppTextStyles.priceText,
                ),
              ],
            ),
            
            Positioned(
              top: 8,
              left: 8,
              child: GestureDetector(
                onTap: () => _removeFromFavourites(index),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(
                    AppAssets.heartFilled,
                    width: 22,
                    height: 22,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}