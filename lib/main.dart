import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_variants/pages/homepage.dart';

import 'bloc/products/products_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(
      providers: [
       
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
       
         
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          // Add your route names and corresponding widgets here
          '/home': (context) =>  const HomePage(),
          //'/login': (context) =>  const LoginPage(),
          
        },
      ),
    );
  }
}

