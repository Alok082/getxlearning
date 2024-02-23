import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // can be used MaterialApp also here
    return GetMaterialApp(
        defaultTransition: Transition.zoom,
        debugShowCheckedModeBanner: false,
        title: 'use of getx',
        home: Scaffold(
          appBar: AppBar(
            title: Text("GetxExample"),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // on the click on the button a default dialog raised
                    Get.defaultDialog(
                        title: "Message", middleText: " Button Clicked");
                  },
                  child: Text(
                    "default Dialog",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      elevation: MaterialStatePropertyAll(8)),
                ),
                ElevatedButton(
                  onPressed: () {
                    //Get.bottomSheet is the feature of getx that raised a container
                    Get.bottomSheet(Container(
                      child: Wrap(children: [
                        ListTile(
                          leading: Icon(Icons.wb_sunny),
                          title: Text("dark Theme"),
                          onTap: () {
                            //this will change the theme into dark
                            Get.changeTheme(ThemeData.dark());
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.wb_sunny_outlined),
                          title: Text("light Theme"),
                          onTap: () {
                            // change theme into light
                            Get.changeTheme(ThemeData.light());
                          },
                        ),
                      ]),
                    ));
                  },
                  child: Text(
                    "Change theme",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      elevation: MaterialStatePropertyAll(8)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // on the click on the button a default dialog raised
                    Get.to(Secondpage(),
                        transition: Transition.leftToRight,
                        duration: Duration(milliseconds: 500));
                  },
                  child: Text(
                    "Navigate",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      elevation: MaterialStatePropertyAll(8)),
                ),
              ]),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // this will raised a snackbar
              Get.snackbar('Message', "button clicked",
                  snackPosition: SnackPosition.BOTTOM,
                  isDismissible: true,
                  dismissDirection: DismissDirection.horizontal,
                  onTap: (Value) {
                print("snackbar clicked");
              },
                  mainButton:
                      TextButton(onPressed: () {}, child: Text("Retry")));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}

class Secondpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Back"),
                    BackButtonIcon(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
