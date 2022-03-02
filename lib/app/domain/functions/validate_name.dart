String? validateName(String name) {
  if (name.length > 3) {
    return null;
  } else {
    return 'Digite um nome válido';
  }
}
