import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import '../theme/assets_paths.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> _cartProducts = [
    {
      'id': 1,
      'name': 'Product 1',
      'price': 17.00,
      'description': 'pkjkkm',
      'details': 'Pink, Size M',
      'image': AppAssets.getProductImage(0),
      'quantity': 1,
    },
    {
      'id': 2,
      'name': 'Product 2',
      'price': 17.00,
      'description': 'pkjkkm',
      'details': 'Pink, Size M',
      'image': AppAssets.getProductImage(1),
      'quantity': 1,
    },
  ];

  void _increaseQuantity(int index) {
    setState(() {
      _cartProducts[index]['quantity']++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (_cartProducts[index]['quantity'] > 1) {
        _cartProducts[index]['quantity']--;
      }
    });
  }

  void _removeFromCart(int index) {
    setState(() {
      _cartProducts.removeAt(index);
    });
  }

  double get _totalPrice {
    return _cartProducts.fold(0, (total, product) {
      return total + (product['price'] * product['quantity']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    Text(
                      'Cart',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.blueLight,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          _cartProducts.length.toString(),
                          style: AppTextStyles.titleMedium.copyWith(
                            fontSize: 30,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                if (_cartProducts.isEmpty)
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.shopping,
                            width: 64,
                            height: 64,
                            color: AppColors.greyMedium,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Your cart is empty',
                            style: AppTextStyles.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Add products to your cart',
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
                    child: ListView.builder(
                      itemCount: _cartProducts.length,
                      itemBuilder: (context, index) {
                        return _buildCartItem(index);
                      },
                    ),
                  ),
                
                if (_cartProducts.isNotEmpty) 
                  const SizedBox(height: 80),
              ],
            ),
          ),
          
          if (_cartProducts.isNotEmpty)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.greyLight,
                ),
                child: SafeArea(
                  top: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            'Total  ',
                            style: AppTextStyles.titleLarge.copyWith(
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            '\$${_totalPrice.toStringAsFixed(2)}',
                            style: AppTextStyles.titleLarge.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          child: Text(
                            'Checkout',
                            style: AppTextStyles.buttonMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCartItem(int index) {
    final product = _cartProducts[index];
    
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
       
                Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
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
                
                    Positioned(
                      top: 70,
                      right: 75,
                      child: GestureDetector(
                        onTap: () => _removeFromCart(index),
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          child: Image.asset(
                            AppAssets.deleteIcon,
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['description'],
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      
                      Text(
                        product['details'],
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      
                      Text(
                        '\$${product['price'].toStringAsFixed(2)}',
                        style: AppTextStyles.priceText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            Positioned(
              bottom: 16,
              right: 16,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => _decreaseQuantity(index),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        AppAssets.less,
                        width: 20,
                        height: 20,
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.blueLight,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        product['quantity'].toString(),
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  
                  GestureDetector(
                    onTap: () => _increaseQuantity(index),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        AppAssets.more,
                        width: 20,
                        height: 20,
                        color: AppColors.primaryLight,
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