import 'package:flutter/material.dart';
import 'package:p4/donativos.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String metodo = 'Paypal';
  double paypal = 0.0;
  double tarjeta = 0.0;
  double total = 0.0;
  double barvalue = 0.0;
  Image img = Image.asset('assets/null.png');

  String adonar = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donaciones'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Es para una buena causa'),
            subtitle: Text('Elije modo de donativo'),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Image.asset('assets/paypal.png'),
                    title: Text('PayPal'),
                    trailing: Radio(
                        value: 'Paypal',
                        groupValue: metodo,
                        onChanged: (value) {
                          metodo = (value).toString();
                          setState(() {});
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Image.asset('assets/tarjetas_de_credito.png'),
                    title: Text('Tarjeta'),
                    trailing: Radio(
                        value: 'Tarjeta',
                        groupValue: metodo,
                        onChanged: (val) {
                          metodo = (val).toString();
                          setState(() {});
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Cantidad a donar:'),
              trailing: DropdownButton(
                  value: adonar,
                  items: <String>['0', '100', '350', '850', '1050', '9999']
                      .map((String value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                  onChanged: (n) {
                    adonar = n.toString();
                    setState(() {});
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50.0, left: 50.0),
            child: LinearProgressIndicator(
              minHeight: 15,
              value: barvalue,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text('${(barvalue * 100).toStringAsPrecision(4)}%'),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              if (metodo == 'Paypal') {
                paypal += double.parse(adonar);
                total += double.parse(adonar);
                if (total < 10000) {
                  barvalue = total / 10000;
                } else {
                  barvalue = 1;
                  img = Image.asset(
                    'assets/gra.png',
                    height: 350,
                  );
                }
              } else {
                tarjeta += double.parse(adonar);
                total += double.parse(adonar);
                if (total < 10000) {
                  barvalue = total / 10000;
                } else {
                  barvalue = 1;
                  img = Image.asset(
                    'assets/gra.png',
                    height: 350,
                  );
                }
              }
              setState(() {});
            },
            child: Text('Donar'),
            style: TextButton.styleFrom(
                backgroundColor: Colors.purple, primary: Colors.white),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Donativos(
                donativos: {
                  'paypal': paypal,
                  'tarjeta': tarjeta,
                  'total': total,
                  'img': img
                },
              ),
            ),
          );
        },
        child: Icon(Icons.donut_small_sharp),
      ),
    );
  }
}
