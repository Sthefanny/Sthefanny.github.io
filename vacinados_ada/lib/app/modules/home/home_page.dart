import 'package:auto_size_text/auto_size_text.dart';
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
      margin: EdgeInsets.only(top: 100, bottom: 300, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: AutoSizeText(
              'Vacin',
              textAlign: TextAlign.right,
              maxLines: 1,
              style: GoogleFonts.acme(fontSize: 100, color: Colors.purple, fontWeight: FontWeight.bold),
              minFontSize: 18,
            ),
          ),
          Expanded(
            child: AutoSizeText(
              'ADA',
              maxLines: 1,
              style: GoogleFonts.acme(fontSize: 100, color: Colors.blue, fontWeight: FontWeight.bold),
              minFontSize: 18,
            ),
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
