import 'package:flutter/cupertino.dart';
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
  var turnTextController = TextEditingController();
  var vacinaTextController = TextEditingController();
  bool firstDose = false;
  bool secondDose = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.pink[50],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
      child: Text(
        'Lista dos vacinados',
        style: GoogleFonts.acme(fontSize: 50, color: Colors.purple),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 300),
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
    return CupertinoTextField(
      placeholder: 'Nome',
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
      placeholderStyle: TextStyle(color: Colors.black),
      style: TextStyle(color: Colors.black),
      controller: nameTextController,
    );
  }

  Widget _buildTurn() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: CupertinoTextField(
        placeholder: 'Turno',
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
        placeholderStyle: TextStyle(color: Colors.black),
        style: TextStyle(color: Colors.black),
        controller: turnTextController,
      ),
    );
  }

  Widget _buildVacina() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CupertinoTextField(
        placeholder: 'Qual vacina?',
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
        placeholderStyle: TextStyle(color: Colors.black),
        style: TextStyle(color: Colors.black),
        controller: vacinaTextController,
      ),
    );
  }

  Widget _buildFisrtDose() {
    return CheckboxListTile(
      title: const Text('Tomou 1ª dose?'),
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
      title: const Text('Tomou 2ª dose?'),
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
            turn: turnTextController.text,
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
