import 'package:chat_flutter_firebase/chat/page/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSalaPage extends StatefulWidget {
  const LoginSalaPage({super.key});

  @override
  State<LoginSalaPage> createState() => _LoginSalaPageState();
}

class _LoginSalaPageState extends State<LoginSalaPage> {
  var list = <String>['Tecnologia', 'Esporte', 'Politica', 'Games'];
  var _nameController = TextEditingController();
  late SharedPreferences prefs;

  String? _salaController;
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    carregaDados();
  }

  carregaDados() async {
    prefs = await SharedPreferences.getInstance();
    var userName = prefs.getString('user_name');
    if (userName != null) {
      setState(() {
        _nameController = TextEditingController(text: userName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Bem vindo aos chats",
            style: TextStyle(color: Colors.blue.shade800, fontSize: 15),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(hintText: 'Escolha seu Nick.'),
            controller: _nameController,
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: DropdownButtonFormField<String>(
            value: _salaController,
            hint: const Text("Escolha uma Sala"),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.solid),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _salaController = value;
              });
            },
            items: list
                .map((sala) => DropdownMenuItem(value: sala, child: Text(sala)))
                .toList(),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () async {
              if ((_nameController.text != '') &&
                  (_salaController != '' && _salaController != null)) {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatPage(
                        nickName: _nameController.text, sala: _salaController!),
                  ),
                );
                await prefs.setString('user_name', _nameController.text);
              } else {
                Navigator.pop(context);
                Navigator.pop(context);
                const SnackBar snackBar = SnackBar(
                  content: Text('Nome e Sala são obrigatórios'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                throw Exception();
              }
            },
            child: const Text("Entrar"),
          ),
        ),
      ],
    );
  }
}
