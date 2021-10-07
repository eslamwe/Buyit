import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:e_c_shop/blocs/cart/cart_bloc.dart';
import 'package:e_c_shop/blocs/category/category_bloc.dart';
import 'package:e_c_shop/blocs/product/product_bloc.dart';
import 'package:e_c_shop/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_c_shop/config/app_router.dart';
import 'package:flutter/material.dart';
import 'package:e_c_shop/config/theme.dart';
import 'package:e_c_shop/repositories/category/category_repository.dart';

import 'repositories/product/product_repository.dart';
import 'screens/home/home_screen.dart';
import 'package:e_c_shop/screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /*Provider<AuthService>(
          create: (_) => AuthService(),
        ),*/
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        /*BlocProvider(
          create: (context) => CheckoutBloc(
              cartBloc: context.read<CartBloc>(),
              checkoutRepository: CheckoutRepository()),
        ),*/
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(
            LoadProducts(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Buyit',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}