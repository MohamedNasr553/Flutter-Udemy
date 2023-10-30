import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/cubit.dart';
import 'package:flutter_app/layout/shop_app/states.dart';
import 'package:flutter_app/models/shop_app/shop_layout_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopProductScreen extends StatelessWidget {
  const ShopProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopCubit.get(context).shopLayoutModel != null,
          builder: (context) => productsBuilder(ShopCubit.get(context).shopLayoutModel),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget productsBuilder(ShopLayoutModel? model) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CarouselSlider(
            //   items: model?.data?.banners.map((e) => Image(
            //     image: NetworkImage(e.image!),
            //     width: double.infinity,
            //     fit: BoxFit.cover,
            //   )).toList(),
            //
            //   options: CarouselOptions(
            //     height: 250.0,
            //     initialPage: 0,
            //     viewportFraction: 1.0,
            //     enableInfiniteScroll: true,
            //     reverse: false,
            //     autoPlay: true,
            //     autoPlayInterval: const Duration(seconds: 3),
            //     autoPlayAnimationDuration: const Duration(seconds:1),
            //     autoPlayCurve: Curves.fastOutSlowIn,
            //     scrollDirection: Axis.horizontal,
            //   )
            // ),
            // const SizedBox(
            //   height: 20.0,
            // ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1 / 1.58,
                children: List.generate(
                  model!.data!.products.length,
                  (index) => buildGridProduct(model.data!.products[index]),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildGridProduct(ProductModel model) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(model.image),
            width: double.infinity,
            height: 200.0,
          ),
          Text(
            model.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14.0,
              height: 1.3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.price,
                style: const TextStyle(
                  fontSize: 12.0,
                  height: 1.3,
                ),
              ),
              Text(
                model.oldPrice.round(),
                style: const TextStyle(
                  fontSize: 11.0,
                  color: Colors.grey,
                  height: 1.3,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const Spacer(),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  size: 14.0,
                ),
              )
            ],
          ),
        ],
      );
}
