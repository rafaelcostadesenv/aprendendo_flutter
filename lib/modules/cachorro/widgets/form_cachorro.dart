import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class formCachorro extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nomeController;
  final TextEditingController descricaoController;
  final TextEditingController idadeController;
  final void Function(String)? onFieldSubmitted;
  const formCachorro({
    super.key,
    required this.formKey,
    required this.nomeController,
    required this.descricaoController,
    required this.idadeController,
    required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            autofocus: true,
            controller: nomeController,
            decoration: InputDecoration(hintText: 'Nome'),
            keyboardType: TextInputType.text,
            onFieldSubmitted: onFieldSubmitted,
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
            controller: descricaoController,
            decoration: InputDecoration(hintText: 'Descrição'),
            keyboardType: TextInputType.text,
            onFieldSubmitted: onFieldSubmitted,
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
            controller: idadeController,
            decoration: InputDecoration(hintText: 'Idade'),
            keyboardType: TextInputType.number,
            onFieldSubmitted: onFieldSubmitted,
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
    );
  }
}
