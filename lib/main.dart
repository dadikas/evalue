import 'package:flutter/material.dart';
import 'package:evalue/impeller_glfw_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ImpellerGlfwPlugin _glfwPlugin = ImpellerGlfwPlugin();

  @override
  void initState() {
    super.initState();
    _glfwPlugin.initializeGLFW();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Tree Widget with GLFW')),
        body: Column(
          children: [
            Expanded(child: TreeWidget()),
            ElevatedButton(
              onPressed: () {
                _glfwPlugin.createWindow();
              },
              child: Text('Create GLFW Window'),
            ),
          ],
        ),
      ),
    );
  }
}

class TreeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ExpansionTile(
          title: Text("Parent 1"),
          children: <Widget>[
            ListTile(title: Text("Child 1")),
            ListTile(title: Text("Child 2")),
          ],
        ),
        ExpansionTile(
          title: Text("Parent 2"),
          children: <Widget>[
            ListTile(title: Text("Child 3")),
            ListTile(title: Text("Child 4")),
          ],
        ),
      ],
    );
  }
}
