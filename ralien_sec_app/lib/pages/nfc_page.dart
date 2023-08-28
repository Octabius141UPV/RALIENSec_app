// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import "package:nfc_manager/nfc_manager.dart";

class NFCPage extends StatefulWidget {
  @override
  _NFCPageState createState() => _NFCPageState();
}

class _NFCPageState extends State<NFCPage> {
  String _nfcData = 'Esperando lectura NFC';

  @override
  void initState() {
    super.initState();
    scanNfcTags();
  }

  Future<void> scanNfcTags() async {
    bool available = await NfcManager.instance.isAvailable();
    if (available) {
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) {
        print('NFC tag discovered!');
        throw ("");
        // do something with the discovered tag here
      });
    }
  }

  Future<void> _stopNFC() async {
    await NfcManager.instance.stopSession();
  }

  @override
  void dispose() {
    _stopNFC();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Página NFC'),
          backgroundColor: Color.fromARGB(255, 85, 19, 161)),
      body: Container(
        color: Colors.grey[300],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _nfcData,
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Acciones a realizar cuando se presiona el botón
                },
                child: Text('Realizar acción'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
