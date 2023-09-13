import 'package:aprendendo_flutter/modules/cachorro/models/cachorro_model.dart';
import 'package:aprendendo_flutter/theme/my_colors.dart';
import 'package:aprendendo_flutter/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CachorroListPage extends StatefulWidget {
  const CachorroListPage({super.key});

  @override
  State<CachorroListPage> createState() => _CachorroListPageState();
}

class _CachorroListPageState extends State<CachorroListPage> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _idadeController = TextEditingController();

  List<Cachorro> cachorros = [
    Cachorro(
      id: 1,
      nome: 'Pitu',
      descricao: 'Preto com manchas brancas',
      idade: 2,
    ),
    Cachorro(
      id: 2,
      nome: 'Carote',
      descricao: 'Branco',
      idade: 5,
    ),
    Cachorro(
      id: 3,
      nome: 'Jamel',
      descricao: 'Caramelo',
      idade: 6,
    ),
  ];

  List<Widget> _buildCachorros() {
    List<Widget> widgets = [];
    for (var element in cachorros) {
      widgets.add(ListTile(
        title: Text(element.nome ?? '-'),
        subtitle: Text(element.descricao ?? '-'),
      ));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Listagem de Cachorros",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _nomeController.clear();
          _descricaoController.clear();
          _idadeController.clear();

          var alert = AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Novo Cachorro"),
              ],
            ),
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    autofocus: true,
                    controller: _nomeController,
                    decoration: InputDecoration(hintText: 'Nome'),
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (_) => _save(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo Obrigatorio';
                      } else if (value.length < 3) {
                        return 'Minimo 3 Caracteres';
                      }
                      //retorna null se passar nas validações
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descricaoController,
                    decoration: InputDecoration(hintText: 'Descrição'),
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (_) => _save(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo Obrigatorio';
                      } else if (value.length < 3) {
                        return 'Minimo 5 Caracteres';
                      }
                      //retorna null se passar nas validações
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _idadeController,
                    decoration: InputDecoration(hintText: 'Idade'),
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (_) => _save(),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo Obrigatorio';
                      }
                      //retorna null se passar nas validações
                      return null;
                    },
                  ),
                ],
              ),
            ),
          );

          showDialog(
            context: context,
            builder: (context) => alert,
          );
        },
        // onPressed: () {
        //   var cachorro = Cachorro(
        //     nome: 'Catuaba',
        //     descricao: 'Preto',
        //     idade: 10,
        //   );

        //   setState(() {
        //     cachorros.add(cachorro);
        //   });
        // },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: cachorros.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(cachorros[index].nome ?? '-'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cachorros[index].descricao ?? '-'),
                Text('${cachorros[index].idade} Anos'),
              ],
            ),
          );
        },
      ),

      // body: ListView(
      //   children: _buildCachorros(),
      // ),

      // body: SingleChildScrollView(
      //   child: Column(
      //     children: _buildCachorros(),
      //     // children: [
      //     //   // for(int i=0; i<cachorros.length; i++)
      //     //   // ListTile(
      //     //   //   title: Text(cachorros[i].nome ?? '-'),
      //     //   //   subtitle: Text(cachorros[i].descricao ?? '-'),
      //     //   // ),

      //     // ],
      //   ),
      // ),
    );
  }

  void _save() {
    if (_formKey.currentState?.validate() ?? false) {
      var cachorro = Cachorro(
        nome: _nomeController.text,
        descricao: _descricaoController.text,
        idade: int.parse(_idadeController.text),
      );

      setState(() {
        cachorros.add(cachorro);
      });
      Navigator.of(context).pop();
    }
  }
}
