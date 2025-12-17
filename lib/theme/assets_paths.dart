class AppAssets {
  static const String createAccountBackground = 'assets/backgrounds/create_account.png';
  static const String loginBackground = 'assets/backgrounds/login.png';
  static const String passwordBackground = 'assets/backgrounds/password.png';
  
  static const String deleteIcon = 'assets/icons/common/delete.png';
  static const String heartFilled = 'assets/icons/common/heart_filled.png';
  static const String heart = 'assets/icons/common/heart.png';
  static const String less = 'assets/icons/common/less.png';
  static const String more = 'assets/icons/common/more.png';
  static const String shoppingFilled = 'assets/icons/common/shopping_filled.png';
  static const String shopping = 'assets/icons/common/shopping.png';
  static const String flag = 'assets/icons/common/flag.png';
  
  static const String cartFilled = 'assets/icons/navigation/cart_filled.png';
  static const String cart = 'assets/icons/navigation/cart.png';
  static const String favoritesFilled = 'assets/icons/navigation/favorites_filled.png';
  static const String favorites = 'assets/icons/navigation/favorites.png';
  static const String shopFilled = 'assets/icons/navigation/shop_filled.png';
  static const String shop = 'assets/icons/navigation/shop.png';

  
  static const String splashLogo = 'assets/logos/splash_logo.png';
  
  static const String product1 = 'assets/products/product_1.png';
  static const String product2 = 'assets/products/product_2.png';
  static const String product3 = 'assets/products/product_3.png';
  static const String product4 = 'assets/products/product_4.png';
  static const String product5 = 'assets/products/product_5.png';
  static const String product6 = 'assets/products/product_6.png';
  static const String product7 = 'assets/products/product_7.png';
  static const String product8 = 'assets/products/product_8.png';
  static const String product9 = 'assets/products/product_9.png';
  
  static String getProductImage(int index) {
    final products = [
      product1, product2, product3, product4, product5,
      product6, product7, product8, product9
    ];
    return products[index % products.length];
  }
}