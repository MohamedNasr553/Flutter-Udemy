import 'package:flutter/material.dart';

class MessengerPage extends StatelessWidget {
  const MessengerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.blue,
          ),
        ),
        title: const Text(
          'Chats',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        // Whole Page
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchBar(),
              const SizedBox(
                height: 15.0,
              ),
              // Story Item
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return buildStoryItem();
                  },
                  separatorBuilder: (context, index){
                    return const SizedBox(
                      width: 10.0,
                    );
                  },
                  itemCount: 7,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Chat Item
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return buildChatItem();
                },
                separatorBuilder: (context, index){
                  return const SizedBox(
                    height: 20.0,
                  );
                },
                itemCount: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() =>  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          const Text(
              'Search',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              )),
        ],
      ),
    );

  Widget buildStoryItem(){
    return Container(
      width: 70.0,
      child: const Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.blue,
              ),
              CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.green,
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Mohamed Ahmed Nasr',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChatItem(){
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 10.0,
      ),
      child: Row(
        children: [
          const Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.blue,
              ),
              CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.green,
              ),
            ],
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mohamed Nasr',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'How is ur day bro, I want to ask you many Questions',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const Text(
                      '02:00 am',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// 1. Build Item
// 2. Build List
// 3. Add item to the list
