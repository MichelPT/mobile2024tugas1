import 'package:flutter/material.dart';
import 'package:tugas_teori/halamanUtama.dart';

void main() => runApp(KelompokScreen());

class Kelompok {
  final String nama;
  final String nim;

  Kelompok({required this.nama, required this.nim});
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class KelompokScreen extends StatelessWidget {
  KelompokScreen({super.key});
  final List<Kelompok> _kelompokList = [
    Kelompok(nama: 'Pramana Abhyasa Wicaksana', nim: '123210103')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Center(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Nama Anggota')),
            DataColumn(label: Text('NIM Anggota')),
          ],
          rows: _kelompokList
              .map(
                (kelompok) => DataRow(
                  cells: [
                    DataCell(Text(kelompok.nama)),
                    DataCell(Text(kelompok.nim)),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Input Data Kelompok',
    //   theme: ThemeData(primarySwatch: Colors.blue),
    //   home: InputDataKelompok(),
    // );
  }
}

// class InputDataKelompok extends StatefulWidget {
//   @override
//   _InputDataKelompokState createState() => _InputDataKelompokState();
// }

// class _InputDataKelompokState extends State<InputDataKelompok> {
//   final _formKey = GlobalKey<FormState>();
//   final _namaController = TextEditingController();
//   final _nimController = TextEditingController();
//   final List<Kelompok> _kelompokList = [];

//   void _tambahKelompok(Kelompok kelompok) {
//     setState(() {
//       _kelompokList.add(kelompok);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text('Input Data Kelompok'),
//           backgroundColor: Colors.blue,
//           actions: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.logout),
//               onPressed: () {
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) {
//                     return HalamanUtama();
//                   }),
//                   (route) => false,
//                 );
//               },
//             ),
//           ]),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextFormField(
//                       controller: _namaController,
//                       decoration: InputDecoration(labelText: 'Nama Anggota'),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Nama Anggota tidak boleh kosong';
//                         }
//                         return null;
//                       },
//                     ),
//                     TextFormField(
//                       controller: _nimController,
//                       decoration: InputDecoration(labelText: 'NIM Anggota'),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'NIM Anggota tidak boleh kosong';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 16.0),
//                     ElevatedButton(
//                       // color: Colors.green, // background
//                       // textColor: Colors.black, // foreground
//                       child: Text('Tambah'),
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           final kelompok = Kelompok(
//                             nama: _namaController.text,
//                             anggota: _nimController.text.split(','),
//                           );
//                           _tambahKelompok(kelompok);
//                           _namaController.clear();
//                           _nimController.clear();
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             _kelompokList.isNotEmpty
//                 ? DataTable(
//                     columns: [
//                       DataColumn(label: Text('Nama Anggota')),
//                       DataColumn(label: Text('NIM Anggota')),
//                     ],
//                     rows: _kelompokList
//                         .map(
//                           (kelompok) => DataRow(
//                             cells: [
//                               DataCell(Text(kelompok.nama)),
//                               DataCell(Text(kelompok.anggota.join(', '))),
//                             ],
//                           ),
//                         )
//                         .toList(),
//                   )
//                 : Center(
//                     child: Text('Belum ada data kelompok yang di input'),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }
