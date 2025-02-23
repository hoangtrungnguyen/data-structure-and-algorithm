void main() {
  print("main");
  const baseVaultUrl = String.fromEnvironment('VAULT_URL');
  const vaultUserName = String.fromEnvironment('VAULT_USERNAME');
  const vaultPassword = String.fromEnvironment('VAULT_PASSWORD');

  print(baseVaultUrl);
  print(vaultUserName);
  print(vaultPassword);
  // runApp(
  //
  // )
}

