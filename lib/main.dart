import 'package:data_structure_and_algorithm/pages/sorting_array/sorting_page.dart';
import 'package:flutter/material.dart';

import 'pages/swap_animation/swap_animation_page.dart';

void main() {
  print("main");
  const baseVaultUrl = String.fromEnvironment('VAULT_URL');
  const vaultUserName = String.fromEnvironment('VAULT_USERNAME');
  const vaultPassword = String.fromEnvironment('VAULT_PASSWORD');

  print(baseVaultUrl);
  print(vaultUserName);
  print(vaultPassword);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            body: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SortingPage();
                      }));
                    },
                    child: Text("Sorting Array Algorithm")),
                ElevatedButton(
                    onPressed: () {}, child: Text("Graph Algorithm")),

                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SwapAnimationPage();
                      }));
                    }, child: Text("Swap Animation")),
              ],
            ),
          );
        },
      ),
    );
  }
}
