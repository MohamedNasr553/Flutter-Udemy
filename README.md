# flutter_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

// ================================================================================================
1- App started with MaterialApp() => home: Class.name {the main or core component of a flutter app}
2- HomeScreen =>
    - return Scaffold(
        appBar: AppBar(
            leading:                                   --> Menu Button and so on..
            Title:                                     --> Text
            actions: []                                --> ArrayList of actions.
            backgroundColor: Colors.color_name,        --> Color of the AppBar.
            centerTitle: true,                         --> Centralized Text in the center.
            elevation: 20.0,                           --> Shadow.
        )
        floatingActionButton: FloatingActionButton(
            elevation: 10.0,
            child: const Icon(
                Icons.add,
            ),
            onPressed: () { },
        ),
        body: SafeArea(                                --> SafeArea() to start after status bar, If there is AppBar no need to SafeArea().
            child : Text(
                'Hello World!',
            ),
        ),
        body: Container(),
        body: Column(),
        body: Row(),
    )
    body: SingleChildScrollView(
        scrollDirection: Axis.vertical,   // Default Axis.vertical,
        child: Container(
            color: Colors.teal,
            // height: double.infinity, == mainAxisSize: MainAxisSize.max,
            width: double.infinity,
            child: Column(    // child: Row(), --> Inverse of Column(),
                // Default -> mainAxisAlignment: MainAxisAlignment.start,
                // Default -> crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Container(
                        color: Colors.red,
                        child: const Text(
                            'First Text',
                            style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                            backgroundColor: Colors.lightGreen,
                            ),
                        ),
                    ),
                    const Image(
                        image: NetworkImage(
                            'https://townsquare.media/site/341/files/2013/04/FIGHT-CLUB.jpg',
                        ),
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                    ),
                ],
            ),
        ),
    ),

// Expanded(
//   flex: 2,
//   child: Container(
//     color: Colors.green,
//     child: const Text(
//       'Second Text',
//       style: TextStyle(
//         fontSize: 20.0,
//         color: Colors.white,
//         backgroundColor: Colors.green,
//       ),
//     ),
//   ),
// ),
// Expanded(
//   child: Container(
//     color: Colors.amber,
//     child: const Text(
//       'Third Text',
//       style: TextStyle(
//         fontSize: 20.0,
//         color: Colors.white,
//         backgroundColor: Colors.amber,
//       ),
//     ),
//   ),
// ),
// Expanded(
//   child: Container(
//     color: Colors.purple,
//     child: const Text(
//       'Fourth Text',
//       style: TextStyle(
//         fontSize: 20.0,
//         color: Colors.white,
//         backgroundColor: Colors.purple,
//       ),
//     ),
//   ),
// )