import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart 'as http;

class ApiWrk1 extends StatefulWidget {
  const ApiWrk1({super.key});

  @override
  State<ApiWrk1> createState() => _ApiWrk1State();
}

class _ApiWrk1State extends State<ApiWrk1> {
  dynamic userdata;

  Future<dynamic> fetchuser() async {
    final url="https://dog.ceo/api/breeds/image/random";
    final uri=Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200){
      final json = jsonDecode(response.body);
      setState(() {
        userdata = json;
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (userdata == null)Text("press the button"),
          if (userdata !=null)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      child: Image.network(userdata['message']) ,
                    )
                  ],
                ),
                Text("firstname : ${userdata['status']}")
              ],
            ),
          ElevatedButton(onPressed: () {
            setState(() {
              fetchuser();
            });
          }, child: Text("click here")),
        ],),

    );
  }
}