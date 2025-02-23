import 'package:flutter/material.dart';

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
      home: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {}, child: Text("Sorting Array Algorithm")),
            ElevatedButton(
                onPressed: () {}, child: Text("Graph Algorithm")),
          ],
        ),
      ),
    );
  }
}
