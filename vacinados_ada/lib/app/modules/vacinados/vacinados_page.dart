import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  late Size _size;

  @override
  void initState() {
    super.initState();
    store.getMorningCount();
    store.getAfternoonCount();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Column(
          children: [
            _buildTitle(),
            _buildTotals(),
            Expanded(
              child: _buildList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: FaIcon(FontAwesomeIcons.plus),
        onPressed: () => Modular.to.navigate('/vacinados/addUser'),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Expanded(
        child: AutoSizeText(
          'Lista dos vacinados',
          maxLines: 1,
          style: GoogleFonts.acme(fontSize: 50, color: Colors.purple),
          minFontSize: 18,
        ),
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
            padding: const EdgeInsets.symmetric(vertical: 10),
            shrinkWrap: true,
            itemCount: snapData.length,
            itemBuilder: (_, index) {
              var item = VacinadoModel.fromJson(snapData[index].data());
              item.id = (snapData[index] as QueryDocumentSnapshot).id;

              return _buildListItem(item);
            },
          );
        }

        return Center(child: CircularProgressIndicator(color: Colors.purple));
      },
    );
  }

  Widget _buildTotals() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _size.width * .05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text('Manhã: '),
                  Observer(builder: (_) {
                    return Text('${store.morningCount}');
                  }),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text('Tarde: '),
                  Observer(builder: (_) {
                    return Text('${store.afternoonCount}');
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(VacinadoModel item) {
    double _width = 30;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: _size.width * .05),
      child: Dismissible(
        key: Key(item.id!),
        onDismissed: (direction) {
          store.deleteUser(item.id!);
          store.getMorningCount();
          store.getAfternoonCount();

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${item.name} deletado')));
        },
        background: Container(
          alignment: Alignment.centerRight,
          child: FaIcon(FontAwesomeIcons.trash),
        ),
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
                Expanded(
                  child: Center(
                    child: Text(
                      item.vacina ?? '',
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
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
      ),
    );
  }
}
