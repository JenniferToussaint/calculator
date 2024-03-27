import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int _counter = 0;
  int _startcounter = 0;
  bool _hasClicked = false;

  void _incrementCounter() {
    setState(() {
      _hasClicked = true;
      _counter += 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    int resultat = _startcounter + _counter;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _startcounter = int.tryParse(value) ?? 0;

                  if (_startcounter == 0) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Alerte'),
                          content: 
                          const Text('La valeur de l\'incrément ne peut pas être égale à 0.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    _startcounter = 1;
                  }
                });
              },
            ),
            if (_hasClicked)
              Text('Vous avez cliqué $_counter fois.')
            else
              Text(
                'Cliquez sur le bouton "+2".',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            Text(
              '$_startcounter + $_counter = $resultat',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Text("+2"),
      ),
    );
  }
}
