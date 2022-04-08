import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:infinity_coin/pages//currency.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void delayload() async {
    try {
      Response res =
      await get(Uri.http('api.nomics.com', '/v1/currencies/ticker', {
        'key': '2be3ed7b28712e15387aef34bda4c8a9fffe14ab',
        'convert': 'INR',
        'ids': 'BTC,ETH,BNB,USDC,DOGE,SHIB,LTC,ICP,HOT,BAT',
      }));
      print(jsonDecode(res.body));
      List<Currency> data = List<Currency>.from(
          jsonDecode(res.body).map((e) => Currency.fromJson(e)));
      print(data);
      await Future.delayed(const Duration(milliseconds: 3000));
      Navigator.pushReplacementNamed(context, '/home',
          arguments: {"data": data,});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    delayload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 150.0,
        ),
      ),
    );
  }
}
