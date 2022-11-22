import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:httpp/provider/http_provider.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatefulWidget {
  HomeProvider({Key? key}) : super(key: key);
  @override
  State<HomeProvider> createState() => _HomeProviderState();
}

class _HomeProviderState extends State<HomeProvider> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HttpProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("provider"),
        ),
        body: Center(
          child: Column(
            children: [
              Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                    (value.data['id'] == null)
                        ? "Belum Adaa Dataa"
                        : "ID : ${value.data['id']}"),
              ),
              Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                    (value.data['email'] == null)
                        ? "Belum Adaa Dataa"
                        : "Email : ${value.data['email']}"),
              ),
              Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                    (value.data['first_name'] == null &&
                            value.data['last_name'] == null)
                        ? "Belum Adaa Dataa"
                        : "Name : ${value.data['first_name']}" +
                            "" +
                            "${value.data['last_name']}"),
              ),
              OutlinedButton(
                  onPressed: () {
                    dataProvider
                        .connectAPI((1 + Random().nextInt(10)).toString());
                  },
                  child: Text("Get Api"))
            ],
          ),
        ));
  }
}
