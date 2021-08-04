import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Column(
        children: [
          _buildTitle(),
          _buildListButton(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: 100, bottom: 300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Vacin',
            style: GoogleFonts.acme(fontSize: 100, color: Colors.purple, fontWeight: FontWeight.bold),
          ),
          Text(
            'ADA',
            style: GoogleFonts.acme(fontSize: 100, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildListButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
      ),
      child: Text(
        'Entrar',
        style: GoogleFonts.acme(fontSize: 50),
      ),
      onPressed: () => Modular.to.navigate('/vacinados'),
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
