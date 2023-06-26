import 'package:caronapp/screens/aguardandoinicio.dart';
import 'package:caronapp/screens/atividades.dart';
import 'package:caronapp/screens/cadastrousuario.dart';
import 'package:caronapp/screens/cadastroveiculo.dart';
import 'package:caronapp/screens/contatosuporte.dart';
import 'package:caronapp/screens/destino.dart';
import 'package:caronapp/screens/detalhescarona.dart';
import 'package:caronapp/screens/escolherveiculo.dart';
import 'package:caronapp/screens/esquecisenha.dart';
import 'package:caronapp/screens/faq.dart';
import 'package:caronapp/screens/fimcarona.dart';
import 'package:caronapp/screens/detalhesdaviagem.dart';
import 'package:caronapp/screens/historicodecaronas.dart';
import 'package:caronapp/screens/login.dart';
import 'package:caronapp/screens/oferecercarona.dart';
import 'package:caronapp/screens/perfilusuario.dart';
import 'package:caronapp/screens/pedircarona.dart';
import 'package:caronapp/screens/termoscondicoes.dart';
import 'package:caronapp/store/address_store.dart';
import 'package:caronapp/store/car_store.dart';
import 'package:caronapp/store/user_store.dart';
import 'package:caronapp/store/viagem_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => UserStore(),
        ),
        Provider(
          create: (context) => AddressStore(),
        ),
        Provider(
          create: (context) => CarStore(),
        ),
        Provider(
          create: (context) => ViagemStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VemJunto',
        theme: ThemeData(
          fontFamily: 'Satochi',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Login(),
          '/esquecisenha': (context) => const EsqueciSenha(),
          '/cadastrousuario': (context) => const CadastroUsuario(),
          '/termosecondicoes': (context) => const TermosCondicoes(),
          '/pedircarona': (context) => const PedirCarona(),
          '/destino': (context) =>
              Destino(destinoController: TextEditingController()),
          '/detalhescarona': (context) => const DetalhesCarona(),
          '/aguardandoinicio': (context) => const AguardandoInicio(),
          '/fimcarona': (context) => const FimCarona(),
          '/oferecercarona': (context) => const OferecerCarona(),
          '/escolherveiculo': (context) => const EscolherVeiculo(),
          '/cadastroveiculo': (context) => const CadastroVeiculo(),
          '/atividades': (context) => const Atividades(),
          '/perfilusuario': (context) => const PerfilUsuario(),
          '/contatosuporte': (context) => const ContatoSuporte(),
          '/faq': (context) => Faq(),
          '/historicocaronas': (context) => const HistoricoDeCaronas(),
          '/detalhesviagem': (context) => const DetalhesDaViagem(),
        },
      ),
    );
  }
}
