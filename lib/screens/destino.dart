import 'package:caronapp/widgets/bottonnav.dart';
import 'package:flutter/material.dart';
import '../const.dart';
import '../widgets/clearabletextfield.dart';
import '../widgets/custombutton.dart';

class Destino extends StatefulWidget {
  final TextEditingController destinoController;

  const Destino({super.key, required this.destinoController});

  @override
  State<Destino> createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController destinoController = widget.destinoController;
    TextEditingController partidaController = TextEditingController();

    void clearTextField(TextEditingController controller) {
      controller.clear();
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Form(
        key: _form,
        child: SingleChildScrollView(
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
                      'Destino',
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
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(8, 0, 8, 24.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: const Icon(
                                Icons.location_on_outlined,
                                size: 22,
                                color: Colors.grey,
                              ),
                            ),
                            Expanded(
                              child: ClearableTextField(
                                controller: partidaController,
                                labelText: 'Endereço de partida',
                                
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //CAMPO ENDERECO
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(8, 0, 8, 24.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: const Icon(
                                Icons.emoji_flags_outlined,
                                size: 22,
                                color: Colors.grey,
                              ),
                            ),
                            Expanded(
                              child: ClearableTextField(
                                controller: destinoController,
                                labelText: 'Endereço de destino',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 48.0, right: 48.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        'assets/images/imgmapa.png',
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 48.0),
                    child: CustomButton(
                      text: 'Confirmar',
                      onPressed: () {
                        //falta: método para iniciar carona
                        Navigator.of(context).pushNamed('/aguardandoinicio');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(selectedIndex: 0),
    );
  }
}
