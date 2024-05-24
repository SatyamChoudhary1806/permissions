import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permissions/utils.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
         title: Text(widget.title),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.mic),),
            title: const Text("Microphone Permission"),
            subtitle: const Text("Click to get Microphone Permission"),
            onTap: () => reqper(permission: Permission.microphone),
          ),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.camera_alt_rounded),),
            title: const Text("Camera Permission"),
            subtitle: const Text("Click to get Camera Permission"),
            onTap: () => reqper(permission: Permission.camera),
          ),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.photo),),
            title: const Text("gallery Permission"),
            subtitle: const Text("Click to get gallery Permission"),
            onTap: () => reqper(permission: Platform.isAndroid?Permission.storage:Permission.photos),
          ),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.location_on),),
            title: const Text("Location Permission"),
            subtitle: const Text("Click to get Location Permission"),
            onTap: () => reqper(permission: Permission.locationWhenInUse),
          ),
          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.settings),),
            title: Text("Settings Permission"),
            subtitle: Text("Click to get Settings Permission"),
            onTap: requestPermissionSetting,
          ),
          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.apps),),
            title: Text("Request Multiple Permissions Permission"),
            subtitle: Text("Click to Request Multiple Permissions Permission"),
            onTap: Allpermissions,
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
