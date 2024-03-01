import 'package:flutter/material.dart';
import 'package:tugas_teori/calculator.dart';
import 'package:tugas_teori/loginPage.dart';
import 'package:tugas_teori/dataKelompok.dart';


class HalamanUtama extends StatefulWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Utama"),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.logout), onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }), (route) => false,
            );
          },),
        ],
      ),

      body: Center(
        child: Column(
            children: [
              buttonData(context),
              buttonCalculator(context),
              buttonGanjilGenap(context),
            ]
        ),
      ),
    );
  }

  Widget buttonData(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 280, vertical: 80),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) { return KelompokScreen(); }));
        }, child: const Text('Data Kelompok'),
      ),
    );
  }

  Widget buttonCalculator(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 280, vertical: 0),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) { return const calculatorPage(); }));
        }, child: const Text('Calculator'),
      ),
    );
  }
  
  Widget buttonGanjilGenap(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 280, vertical: 0),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) { return const calculatorPage(); }));
        }, child: const Text('Ganjil Genap'),
      ),
    );
  }
}


