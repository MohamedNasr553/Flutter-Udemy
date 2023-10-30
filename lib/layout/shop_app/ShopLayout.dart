import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/cubit.dart';
import 'package:flutter_app/layout/shop_app/states.dart';
import 'package:flutter_app/modules/shop_app/search/search.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state){},
      builder: (context, state){
        var shopCubit =  ShopCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Salla',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            actions: [
              IconButton(
                onPressed: (){
                  navigateTo(context, const ShopSearchScreen());
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
          body: shopCubit.shopScreens[shopCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 3.0,
            currentIndex: shopCubit.currentIndex,
            onTap: (int index){
              shopCubit.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home,
                  size: 18.0,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Category',
                icon: Icon(
                  Icons.grid_view_sharp,
                  size: 18.0,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Favorite',
                icon: Icon(
                  Icons.favorite,
                  size: 18.0,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(
                  Icons.settings,
                  size: 18.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
