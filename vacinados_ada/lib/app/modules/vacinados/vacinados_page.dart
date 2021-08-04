import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'vacinados_store.dart';

class VacinadosPage extends StatefulWidget {
  final String title;
  const VacinadosPage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _VacinadosPageState createState() => _VacinadosPageState();
}

class _VacinadosPageState extends ModularState<VacinadosPage, VacinadosStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Column(
        children: [
          _buildTitle(),
          _buildList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('+'),
        onPressed: store.save,
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
        'Lista dos vacinados',
        style: GoogleFonts.acme(fontSize: 50, color: Colors.purple),
      ),
    );
  }

  Widget _buildList() {
    return _buildCard();
  }

  Widget _buildCard() {
    return Padding(
      padding: const EdgeInsets.all(100),
      child: Card(
        child: ListTile(
          title: Text('Teste'),
        ),
      ),
    );
  }
}




// return Scaffold(
//       body: Observer(
//         builder: (context) => Text('${store.counter}'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           store.increment();
//         },
//         child: Icon(Icons.add),
//       ),
//     );
