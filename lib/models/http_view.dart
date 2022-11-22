import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:httpp/models/http_req.dart';

class HttpView extends StatefulWidget {
  const HttpView({Key? key}) : super(key: key);

  @override
  State<HttpView> createState() => _HttpViewState();
}

class _HttpViewState extends State<HttpView> {
  HttpStatefull dataResponse = HttpStatefull();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("http"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text((dataResponse.id == null)
                ? "Data Belum Ada "
                : "${dataResponse.id}"),
            Text((dataResponse.email == null)
                ? "Data Belum Ada "
                : "${dataResponse.email}"),
            Text((dataResponse.fullname == null )
                ? "Data Belum Ada "
                : "${dataResponse.fullname}"),
            OutlinedButton(
                onPressed: () {
                  HttpStatefull.connectAPI(
                          (1 + Random().nextInt(10)).toString())
                      .then((value) {
                    setState(() {
                      dataResponse = value;
                    });
                  });
                },
                child: Text("Api"))
          ],
        ),
      ),
    );
  }
}
