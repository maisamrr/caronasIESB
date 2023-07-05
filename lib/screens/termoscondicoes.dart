import 'package:caronapp/const.dart';
import 'package:caronapp/screens/cadastrousuario.dart';
import 'package:flutter/material.dart';

class TermosCondicoes extends StatelessWidget {
  const TermosCondicoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                  left: 40.0,
                ),
                child: GestureDetector(
                  child: const Icon(Icons.arrow_back,
                      size: 24, color: Colors.grey),
                  onTap: () => {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CadastroUsuario()))
                  },
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0, bottom: 32.0),
                  child: Text(
                    'Termos e Condições',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF5757),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: Text(
                  'Bem-vindo(a) ao nosso aplicativo de caronas! Antes de começar a usar o nosso serviço, é importante que você leia e concorde com os seguintes termos e condições. Ao utilizar o aplicativo, você está aceitando todos os termos aqui estabelecidos. Se você não concordar com algum desses termos, por favor, pare de usar o aplicativo imediatamente. \n\n1 - Uso do Aplicativo  \n\n1.1 - O aplicativo de caronas tem como objetivo conectar motoristas que oferecem caronas com passageiros que desejam compartilhar essas viagens. O aplicativo fornece uma plataforma para facilitar essa conexão, mas não se responsabiliza por qualquer incidente que possa ocorrer durante a carona. \n\n1.2 - Ao utilizar o aplicativo, você concorda em fornecer informações precisas e atualizadas sobre si mesmo, incluindo seu nome, número de telefone, foto de perfil e outras informações solicitadas. Você também concorda em fornecer informações precisas sobre suas viagens, incluindo a data, hora e local de partida e destino. \n\n1.3 - Você é responsável por todas as atividades realizadas por meio de sua conta no aplicativo. Mantenha suas informações de login seguras e não compartilhe sua conta com terceiros.\n\n1.4 - Você concorda em usar o aplicativo de caronas de forma responsável, respeitando as leis e regulamentos aplicáveis. Você não deve usar o aplicativo para qualquer atividade ilegal, fraudulenta, abusiva ou que viole os direitos de terceiros.',
                  style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 40.0, right: 40.0),
                child: Text(
                  '2 - Responsabilidades do Motorista \n\n2.1 - Ao se tornar um motorista no aplicativo de caronas, você declara possuir uma carteira de motorista válida, bem como um veículo em bom estado de funcionamento e devidamente registrado. \n\n2.2 - Como motorista, você tem a opção de oferecer caronas e aceitar passageiros de acordo com sua disponibilidade e preferência. No entanto, você é responsável por garantir a segurança dos passageiros durante a carona, respeitando as leis de trânsito e adotando uma condução segura. \n\n2.3 - Você concorda em fornecer informações precisas sobre sua identidade, veículo e seguro de automóvel. É sua responsabilidade manter todas essas informações atualizadas no aplicativo. \n\n2.4 - O pagamento das despesas relacionadas à carona, como combustível e pedágios, será acordado diretamente entre o motorista e o passageiro. O aplicativo não se responsabiliza por quaisquer pagamentos ou acordos financeiros entre as partes.',
                  style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
