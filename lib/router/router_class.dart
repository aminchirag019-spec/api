import 'package:api_learning/screens/dashboardScreen/show_all_products.dart';

enum RouterName{

  ///----Shell Route ----///
  searchScreen('/app/SearchScreen','SearchScreen'),
  dashboardScreen('/app/Dashboard','Dashboard'),
  orderScreen('/app/OrderScreen','OrderScreen'),
  profileScreen('/app/ProfileScreen','ProfileScreen'),
  cartScreen('/app/CartScreen','CartScreen'),


  ///------------Auth Routes-------------------///
  signupScreen('/SignupScreen','SignupScreen'),
  loginScreen('/LoginScreen','/LoginScreen'),
  splashScreen('/SplashScreen','SplashScreen'),
  forgotPassScreen('/ForgotPassScreen','ForgotPassScreen'),
  otpScreen('/OtpScreen','OtpScreen'),

  ///--------Other Screen Routes  ------------///

  showAllDresses('/DressesScreenAlll','DressesScreenAlll'),
  productDetailScreen('/ProductDetails/:id','ProductDetails/:id'),
  discoverScreen('/DiscoverScreen','DiscoverScreen'),
  paymentCheckoutScreen('/PaymentCheckoutScreen','PaymentCheckoutScreen'),
  onBoardingScreen('/IntroOnboarding','IntroOnboarding'),
  manualProductDetail('/DummyProductDetails','DummyProductDetails'),
 settingScreen('/SettingScreen','SettingScreen'),
  notificationScreen('/NotificationScreen','NotificationScreen'),
  wishlistScreen('/WishlistScreen','WishlistScreen'),
  showAllProducts('/ShowallProducts','ShowAllProducts');





  final String path;
  final String name;

const RouterName(this.path,this.name);
}
