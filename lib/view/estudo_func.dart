import 'package:first_app/models/user_model.dart';
import 'package:first_app/view/show_user.dart';
import 'package:flutter/material.dart';

class EstudoFuncScreen extends StatefulWidget {
  const EstudoFuncScreen({super.key});

  @override
  _EstudoFuncScreenState createState() => _EstudoFuncScreenState();
}

class _EstudoFuncScreenState extends State<EstudoFuncScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cellController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool _isMale = false;
  bool _isFemale = false;
  Gender generoDefinido=Gender.masculino;
  List<UserModel> users = [];

  void mostrarInfo() {
    users.add(UserModel(
      name: nameController.text,
      email: emailController.text,
      cellphone: int.tryParse(cellController.text) ?? 0,
      endereco: addressController.text,
      genero: generoDefinido,
    ));
    print(users.toString());
    print(users.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: cellController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your cellphone',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your Address',
              ),
            ),
          ),
          CheckboxListTile(
            title: Text('Masculino'),
            value: _isMale,
            onChanged: (bool? value) {
              setState(() {
                _isMale = value ?? false;
                if (_isMale) {
                   generoDefinido=Gender.masculino;
                  _isFemale = false;
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text('Feminino'),
            value: _isFemale,
            onChanged: (bool? value) {
              setState(() {
                _isFemale = value ?? false;
                if (_isFemale) {
                  generoDefinido=Gender.feminino;
                  _isMale = false; 
                  
                }
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  mostrarInfo();
                },
                child: Text('Salvar'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (users.isNotEmpty) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShowUserScreen(users: users),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Nenhum usuário salvo!'),
                      ),
                    );
                  }
                },
                child: Text('Ver'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
