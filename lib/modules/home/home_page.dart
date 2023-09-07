import 'package:aprendendo_flutter/modules/cachorro/pages/cachorro_list_page.dart';
import 'package:aprendendo_flutter/utils/app_routes.dart';

import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(

        title: const Text('HomePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            child: InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRoutes.CACHORRO_LIST_PAGE),
              child: const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pets,
                        size: 50,
                      ),
                      Text('Listagem de Cachorros'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {}, 
            child: const Text("Botão")
          ),
        ],
      ),
    );
  }
}
