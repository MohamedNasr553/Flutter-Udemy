import 'package:flutter/material.dart';
import 'package:flutter_app/modules/shop_app/login/LoginScreen.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_app/shared/network/local/CacheHelper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingModel {
  late final String image;
  late final String title;
  late final String body;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.body
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> boardingList = [
      OnBoardingModel(
          image: 'assets/images/OnBoarding.jpg',
          title: 'Boarding Title 1',
          body: 'Boarding body 1'),
      OnBoardingModel(
          image: 'assets/images/OnBoarding.jpg',
          title: 'Boarding Title 2',
          body: 'Boarding body 2'),
      OnBoardingModel(
          image: 'assets/images/OnBoarding.jpg',
          title: 'Boarding Title 3',
          body: 'Boarding body 3'),
    ];

    // void submit(){
    //   CacheHelper.saveData(
    //       key: 'onBoarding',
    //       value: true,
    //   ).then((value){
    //     navigateAndFinish(context, ShopLoginScreen());
    //   });
    // }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AppCubit.get(context).changeTheme();
            },
            icon: const Icon(
              Icons.brightness_4_outlined,
            ),
          ),
          TextButton(
            onPressed: (){
              navigateAndFinish(context, ShopLoginScreen());
              // submit();
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.deepOrange,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (index) {
                  if (index == boardingList.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) => buildBoardingItem(boardingList[index]),
                itemCount: 3,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.deepOrange,
                    dotHeight: 8.0,
                    expansionFactor: 4,
                    dotWidth: 8.0,
                    spacing: 5.0,
                  ),
                  count: boardingList.length,
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      navigateAndFinish(context, ShopLoginScreen());
                      // submit();
                    }
                    else {
                      boardController.nextPage(
                        duration: const Duration(
                            milliseconds: 750
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(OnBoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          Text(
            '${model.title}',
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            '${model.body}',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
