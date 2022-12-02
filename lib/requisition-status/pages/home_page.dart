import 'package:flutter/material.dart';
import 'package:looping_requizition/requisition-status/controllers/controller.dart';

class HomePage extends StatefulWidget {
  final ControllerStatusCode controller;

  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String labelButton = 'Iniciar Fluxo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Status Code  ',
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Text('Status code : ', style: TextStyle(fontSize: 20)),
                ValueListenableBuilder(
                  valueListenable: widget.controller.result,
                  builder: ((context, value, child) => Text(
                        value,
                        style: const TextStyle(fontSize: 20),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Numero de requisições : ',
                    style: TextStyle(fontSize: 20)),
                ValueListenableBuilder(
                  valueListenable: widget.controller.numberRequisition,
                  builder: ((context, value, child) => Text(
                        '$value',
                        style: const TextStyle(fontSize: 30),
                      )),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  if (widget.controller.numberRequisition.value == 0) {
                    await widget.controller.showStatus();
                    setState(() {
                      labelButton = "Parar Fluxo";
                    });
                  } else {
                    widget.controller.timer.cancel;
                    await widget.controller.stopStatus();
                    setState(() {
                      labelButton = "Iniciar Fluxo";
                    });
                  }
                },
                child: Text(labelButton))
          ],
        ),
      ),
    );
  }
}
