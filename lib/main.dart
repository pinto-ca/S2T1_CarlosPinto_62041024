import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcular Operaciones Aritmeticas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(secondary: Colors.blue),
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyPage(title: 'Resolucion de Operaciones'),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyPage createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  String dropdownItem = "Suma";
  double res = 0;

  void calcular(String num1, String num2) {
    double value1 = double.tryParse(num1) ?? 0;
    double value2 = double.tryParse(num2) ?? 0;

    setState(() {
      if (dropdownItem == "Suma") {
        res = value1 + value2;
      } else if (dropdownItem == "Resta") {
        res = value1 - value2;
      } else if (dropdownItem == "Multiplicacion") {
        res = value1 * value2;
      } else if (dropdownItem == "Division") {
        res = value1 / value2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController num1_ = TextEditingController();
    TextEditingController num2_ = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20.0),
            TextFormField(
              controller: num1_,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Primer Valor',
                icon: Icon(Icons.numbers_sharp),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: num2_,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Segundo Valor',
                icon: Icon(Icons.numbers_sharp),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: DropdownButton<String>(
                  value: dropdownItem,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownItem = newValue!;
                    });
                  },
                  items: <String>['Suma', 'Resta', 'Multiplicacion', 'Division']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Resultado: ${res.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          calcular(num1_.text, num2_.text);
        },
        backgroundColor: const Color.fromARGB(255, 14, 71, 118),
        child: const Icon(Icons.play_circle),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
