import 'package:caronapp/const.dart';
import 'package:caronapp/services/user_service.dart';
import 'package:caronapp/widgets/addresstile.dart';
import 'package:flutter/material.dart';
import '../store/address_store.dart';
import '../widgets/bottonnav.dart';
import '../store/user_store.dart';
import 'destino.dart';

class PedirCarona extends StatefulWidget {
  const PedirCarona({super.key});

  @override
  State<PedirCarona> createState() => _PedirCaronaState();
}

class _PedirCaronaState extends State<PedirCarona> {
  final _form = GlobalKey<FormState>();

  final userStore = UserStore();
  final addressStore = AddressStore();
  final TextEditingController _destinoController = TextEditingController();
  bool isRuaEmpty = true;
  String? name;

  @override
  void initState() {
    super.initState();
    pegarNomeUser();
  }

  pegarNomeUser() async {
    UserService userService = UserService();

    // var userData = await userService.getUserData();
    Map<String, dynamic>? userCustomData =
        await userService.getCurrentUserCustomData();

    var userData = await userService.getUserData();

    setState(() {
      name = userData!.displayName!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Form(
        key: _form,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TITULO
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                  child: Text(
                    "Olá, $name",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      color: redIdColor,
                    ),
                  ),
                ),
              ),
              //CAMPO ENDERECO
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(8, 0, 8, 24.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: const Icon(
                              Icons.search,
                              size: 22,
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _destinoController,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Qual seu destino?',
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  isRuaEmpty = value.isEmpty;
                                });
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(8, 1, 1, 1),
                            child: GestureDetector(
                              child: Icon(
                                isRuaEmpty
                                    ? Icons.arrow_forward_outlined
                                    : Icons.arrow_forward,
                                size: 22,
                                color: isRuaEmpty ? Colors.grey : greenIdColor,
                              ),
                              onTap: () {
                                if (_destinoController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Por favor, insira o endereço de destino.'),
                                    ),
                                  );
                                } else {
                                  addressStore.setRua(_destinoController.text);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Destino(
                                          destinoController:
                                              _destinoController),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //ENDERECOS RECENTES
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 24.0, left: 56.0, right: 40.0, bottom: 24.0),
                  child: Text(
                    'Endereços recentes',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: addresses.length,
                  itemBuilder: (context, index) {
                    final address = addresses[index];
                    return GestureDetector(
                      child: AddressTile(
                        apelido: address.address,
                        rua: address.rua,
                        numero: address.numero,
                        iconAsset: const Icon(Icons.hail_outlined, size: 30),
                      ),
                      onTap: () {
                        _destinoController.text = address.rua;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(selectedIndex: 0),
    );
  }
}
