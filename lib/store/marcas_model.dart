enum Marca {
  volkswagenGol,
  fiatUno,
  fordKa,
  citroenC3,
  toyotaEtios,
}

extension MarcaExtension on Marca {
  String get formattedString {
    String name = toString().split('.').last;
    String formattedName = name[0].toUpperCase() + name.substring(1).replaceAllMapped(
        RegExp(r'([A-Z])'),
        (match) => ' ${match.group(0)}');
    return formattedName;
  }
}