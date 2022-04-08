import 'package:flutter/material.dart';
import 'package:infinity_coin/pages//currency.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double input = 0.0;
  List<Currency> data = [];
  Map passedArgs = {};

  @override
  Widget build(BuildContext context) {
    passedArgs = ModalRoute.of(context)!.settings.arguments as Map;
    data = passedArgs['data'] as List<Currency>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Infinity Coin",style: TextStyle(color: Colors.amber),),
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              cursorColor: Colors.amber,
              autofocus: true,
              style: const TextStyle(
                  backgroundColor: Colors.black,
                  color: Colors.amber
              ),
              decoration: const InputDecoration(
                labelText: "Currency Amount",
                labelStyle: TextStyle(
                  backgroundColor: Colors.black,
                  color: Colors.amber,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)
                ),
              ),
              keyboardType: const TextInputType.numberWithOptions(),
              onChanged: ((value) {
                setState(() {
                  try {
                    input = double.parse(value);
                  } catch (e) {
                    input = 0.0;
                  }
                });
              }),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black, width: 2)),
                      onTap: () => Navigator.pushNamed(context, '/currency_detail',
                          arguments: data[index]),
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data[index].symbol),
                      ),
                      title: Text(
                          (input / double.parse(data[index].price)).toStringAsFixed(2),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      tileColor: Colors.white,
                    ),
                  );
                },
                itemCount: data.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}