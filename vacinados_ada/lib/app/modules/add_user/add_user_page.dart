import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vacinados_ada/app/models/vacinado_model.dart';

import 'add_user_store.dart';

class AddUserPage extends StatefulWidget {
  final String title;
  const AddUserPage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends ModularState<AddUserPage, AddUserStore> {
  var nameTextController = TextEditingController();
  var vacinaTextController = TextEditingController();
  bool firstDose = false;
  bool secondDose = false;
  String? turn;
  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.pink[50],
        body: SafeArea(
          child: ListView(
            children: [
              _buildTitle(),
              _buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 50),
      child: AutoSizeText(
        'Adicionar na lista',
        maxLines: 1,
        style: GoogleFonts.acme(fontSize: 50, color: Colors.purple),
        minFontSize: 18,
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _size.width * .05),
      child: Column(
        children: [
          _buildName(),
          _buildTurn(),
          _buildVacina(),
          _buildFisrtDose(),
          _buildSecondDose(),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildName() {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        hintText: 'Nome',
        hintStyle: TextStyle(color: Colors.black),
        labelStyle: TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(5),
          ),
          borderSide: BorderSide(
            style: BorderStyle.none,
            width: 0,
          ),
        ),
      ),
      style: TextStyle(color: Colors.black),
      controller: nameTextController,
    );
  }

  Widget _buildTurn() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5),
              ),
              borderSide: BorderSide(
                style: BorderStyle.none,
                width: 0,
              ),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.black),
            hintText: 'Turno',
            fillColor: Colors.white),
        value: turn,
        onChanged: (String? value) {
          setState(() {
            turn = value;
          });
        },
        items: [
          DropdownMenuItem(
              value: 'Manhã',
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: FaIcon(FontAwesomeIcons.coffee),
                  ),
                  Text('Manhã'),
                ],
              )),
          DropdownMenuItem(
              value: 'Tarde',
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: FaIcon(FontAwesomeIcons.utensils),
                  ),
                  Text('Tarde'),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildVacina() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: 'Qual vacina?',
          hintStyle: TextStyle(color: Colors.black),
          labelStyle: TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(5),
            ),
            borderSide: BorderSide(
              style: BorderStyle.none,
              width: 0,
            ),
          ),
        ),
        style: TextStyle(color: Colors.black),
        controller: vacinaTextController,
      ),
    );
  }

  Widget _buildFisrtDose() {
    return CheckboxListTile(
      title: Center(child: const Text('Tomou 1ª dose?')),
      value: firstDose,
      onChanged: (bool? value) {
        setState(() {
          firstDose = value!;
        });
      },
      secondary: FaIcon(
        FontAwesomeIcons.syringe,
        color: firstDose ? Colors.green : Colors.grey,
      ),
    );
  }

  Widget _buildSecondDose() {
    return CheckboxListTile(
      title: Center(child: const Text('Tomou 2ª dose?')),
      value: secondDose,
      onChanged: (bool? value) {
        setState(() {
          secondDose = value!;
        });
      },
      secondary: FaIcon(
        FontAwesomeIcons.syringe,
        color: secondDose ? Colors.green : Colors.grey,
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: ElevatedButton(
        onPressed: () {
          var userModel = VacinadoModel(
            name: nameTextController.text,
            turn: turn!,
            vacina: vacinaTextController.text,
            firstDoseTaken: firstDose,
            secondDoseTaken: secondDose,
          );

          store.addUser(userModel).then((value) {
            Modular.to.popAndPushNamed('/vacinados');
          }).onError((error, stackTrace) {
            print('ERROR: $error');
          });
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.purple,
          padding: EdgeInsets.all(10),
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Salvar',
          ),
        ),
      ),
    );
  }
}
