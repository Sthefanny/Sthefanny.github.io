import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/vacinado_model.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            _buildTitle(),
            _buildList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: FaIcon(FontAwesomeIcons.plus),
        onPressed: () => _showDialog,
      ),
    );
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
    return FutureBuilder<List<QueryDocumentSnapshot>>(
      future: store.load(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          var snapData = snapshot.data;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapData.length,
            itemBuilder: (_, index) {
              var item = VacinadoModel.fromJson(snapData[index].data());
              return _buildListItem(item);
            },
          );
        }

        return Text("loading");
      },
    );
  }

  Widget _buildListItem(VacinadoModel item) {
    double _width = 30;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 300),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name),
                  Text(item.turn),
                ],
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.syringe,
                    size: _width,
                    color: item.firstDoseTaken ? Colors.green : Colors.grey,
                  ),
                  FaIcon(
                    FontAwesomeIcons.syringe,
                    size: _width,
                    color: item.secondDoseTaken ? Colors.green : Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
