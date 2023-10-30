import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  // 1. Constructor
  // 2. Build
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: menuClicked,
        ),
        title: const Text(
          'First Flutter Application',
        ),
        actions: const [
          IconButton(
            icon: Icon(
              Icons.notification_important,
            ),
            onPressed: notificationClicked,
          ),
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: searchClicked,
          ),
        ],
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 20.0,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Container(
        padding: EdgeInsetsDirectional.all(10.0),
        // width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.circular(20.0),
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.0),
                )
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children:
                [
                  const Image(
                    image: NetworkImage(
                      'https://townsquare.media/site/341/files/2013/04/FIGHT-CLUB.jpg',
                    ),
                    width: 250.0,
                    height: 250.0,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.all(10.0),
                    child: const Text(
                      'Fight Club (1999)',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        backgroundColor: Colors.white,
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





// ======================================
// When Menu Icon Clicked
void menuClicked(){
  print("Menu Button Clicked!");
}

// When Notification Icon Clicked
void notificationClicked(){
  print("Notification Button Clicked!");
}

// When Search Clicked
void searchClicked(){
  print("Search Button Clicked!");
}