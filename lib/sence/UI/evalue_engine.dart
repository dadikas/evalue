import 'package:evalue/sence/UI/component/custom_text.dart';
import 'package:flutter/material.dart';

class EvalueEngine extends StatefulWidget {
  const EvalueEngine({super.key});

  @override
  State<EvalueEngine> createState() => _EvalueEngineState();
}

class _EvalueEngineState extends State<EvalueEngine> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(              
              children: [
                CustomText(text: 'File'),
                SizedBox(width: 10,),
                CustomText(text: 'Edit'),
                SizedBox(width: 10,),
                CustomText(text: 'Node'),
                SizedBox(width: 10,),
                CustomText(text: 'Project'),
                SizedBox(width: 10,),
                CustomText(text: 'Panel',),
                SizedBox(width: 10,),
                CustomText(text: 'Extensions'),
                SizedBox(width: 10,),
                CustomText(text: 'Developer'),
                SizedBox(width: 10,),
                CustomText(text: 'Help'),
              ],
            )
          ],
        ),
      ),
    );
  }
}