import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final DatabaseReference _userRef = FirebaseDatabase.instance
      .refFromURL("https://vemjunto-f9f4d-default-rtdb.firebaseio.com/");

  @observable
  bool logado = false;

  @observable
  String nome = "";

  @observable
  String celular = "";

  @observable
  String matricula = "";

  @observable
  String email = "";

  @observable
  String senha = "";

  @action
  void setNome(String value) => nome = value;

  @action
  void setCelular(String value) => celular = value;

  @action
  void setMatricula(String value) => matricula = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setSenha(String value) => senha = value;

  @action
  void login(String value) {
    logado = true;
    email = value;
  }

  @action
  void logout() {
    logado = false;
    email = "";
  }

  @action
  Future<void> saveUser() async {
    // Criar um novo nó para o usuário
    final newUserRef = _userRef.push();

    // Definir os dados do usuário
    await newUserRef.set({
      'nome': nome,
      'celular': celular,
      'matricula': matricula,
      'email': email,
      'senha': senha,
    });
  }
}
