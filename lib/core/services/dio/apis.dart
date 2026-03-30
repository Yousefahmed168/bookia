// base url and endpoint

abstract class Apis {
  static const baseUrl = 'https://codingarabic.online/api';

  // auth
  static const login = '/login';
  static const register = '/register';
  static const forgetpassword = '/forget-password';
  static const otpcode = 'otpcode';

  // home
  static const sliders = '/sliders';
  static const productsBestseller = '/products-bestseller';

  // wishlist
  static const addToWishlist = '/add-to-wishlist';
  static const removeFromWishlist = '/remove-from-wishlist';
  static const wishlist = '/wishlist';

  // cart
  static const cart = '/cart';
  static const addToCart = '/add-to-cart';
  static const removeFromCart = '/remove-from-cart';
  static const updateCart = '/update-cart';
  static const checkout = '/checkout';

  // place order
  static const governorates = '/governorates';

  // profile
  static const profile = '/profile';
  static const updateProfile = '/update-profile';
  static const logout = '/logout';

  // orders
  static const String myOrders = "/order-history";
  static const String showSingleOrder = "/order-history";

  // reset password
  static const String updatePassword = "/update-password";
}
