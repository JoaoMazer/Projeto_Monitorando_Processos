import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'menu.dart';

class Protocolo {
  String protocolo;
  String data;

  Protocolo(this.protocolo, this.data);
}

class ReceberView extends StatefulWidget {
  @override
  _ReceberViewState createState() => _ReceberViewState();
}

class _ReceberViewState extends State<ReceberView> {
  final _formKey = GlobalKey<FormState>();
  final _protocoloController = TextEditingController();
  List<Protocolo> _protocolos = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF3C5A99),
          title: Text('Receber Processos'),
        ),
        body: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _protocoloController,
                    maxLength: 20,
                    decoration: InputDecoration(
                      labelText: 'Protocolo - use o leitor ou digite',
                    ),
                  ),
                  SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          final now = DateTime.now();
                          final formatter = DateFormat('dd/MM/yyyy');
                          final data = formatter.format(now);
                          final protocolo =
                              Protocolo(_protocoloController.text, data);
                          _protocolos.add(protocolo);
                          _protocoloController.clear();
                        });
                      }
                    },
                    child: Text('Empilhar'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _protocolos.length,
                itemBuilder: (context, index) {
                  final protocolo = _protocolos[index];
                  return ListTile(
                    title: Text(protocolo.protocolo),
                    subtitle: Text(protocolo.data),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 40,
                child: TextButton(
                  child: Text(
                    "Voltar ao Menu",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuView(),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
