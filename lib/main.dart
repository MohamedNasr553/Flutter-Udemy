import 'package:flutter/material.dart';
import 'package:flutter_app/layout/news_app/NewsLayout.dart';
import 'package:flutter_app/layout/news_app/cubit/cubit.dart';
import 'package:flutter_app/layout/news_app/cubit/states.dart';
import 'package:flutter_app/layout/shop_app/ShopLayout.dart';
import 'package:flutter_app/layout/shop_app/cubit.dart';
import 'package:flutter_app/layout/todo_app/todoLayout.dart';
import 'package:flutter_app/modules/shop_app/login/LoginScreen.dart';
import 'package:flutter_app/modules/shop_app/on_boarding/onboarding_screen.dart';
import 'package:flutter_app/shared/bloc_observer.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_app/shared/cubit/states.dart';
import 'package:flutter_app/shared/network/local/CacheHelper.dart';
import 'package:flutter_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_app/shared/styles/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // ensure that everything in main method has finished then run MyApp.
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  // await CacheHelper.init();

  // Widget widget;

  // bool isDark = CacheHelper.get(key: 'isDark');

  // bool onBoarding = CacheHelper.get(key: 'onBoarding');

  // token = CacheHelper.get(key: 'token')?? "OUivTRhAD27e7V4ulp3L8M6BimJo2UjUJ5MSVWYU450VMgVchMnKpdjl0yuIWai0j8Ix8z";

  // if(onBoarding != null)
  // {
  //   if(token != null) {
  //     widget = const ShopLayout();
  //   }
  //   else{
  //     widget = ShopLoginScreen();
  //   }
  // }
  // else {
  //   widget = const OnBoardingScreen();
  // }

  return runApp(const MyApp(
    // isDark: isDark,
    // startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  // final bool isDark;
  // final Widget startWidget;

  const MyApp({
    super.key,
    // required this.isDark,
    // required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()..getBusiness(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()..changeTheme(),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopCubit()..shopHomeData()..getCategories()..getUserProfile(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            // themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            themeMode: ThemeMode.light,
            home: const ShopLayout(),
          );
        },
      ),
    );
  }
}
