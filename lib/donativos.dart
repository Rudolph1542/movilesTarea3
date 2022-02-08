import 'dart:html';

import 'package:flutter/material.dart';

class Donativos extends StatefulWidget {
  final donativos;
  Donativos({Key? key, required this.donativos}) : super(key: key);

  @override
  State<Donativos> createState() => _DonativosState();
}

class _DonativosState extends State<Donativos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Donativos obtenidos'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Column(
            children: [
              ListTile(
                leading: Image.asset('assets/paypal.png'),
                trailing: Text(
                  '${widget.donativos['paypal'] ?? 0.0}',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ListTile(
                leading: Image.asset('assets/tarjetas_de_credito.png'),
                trailing: Text(
                  '${widget.donativos['tarjeta'] ?? 0.0}',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(
                  Icons.attach_money,
                  size: 52,
                ),
                trailing: Text(
                  '${widget.donativos['total'] ?? 0.0}',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              Container(
                  alignment: Alignment.center, child: widget.donativos['img'])
            ],
          ),
        ));
  }
}
