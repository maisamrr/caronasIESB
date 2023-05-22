import 'package:caronapp/screens/cadastro.dart';
import 'package:caronapp/widgets/bottomnavigationbarwidget.dart';
import 'package:caronapp/widgets/customdivider.dart';
import 'package:flutter/material.dart';
import '../widgets/customfind.dart';
import '../widgets/customhistory.dart';
import 'cadastroveiculo.dart';

class TermosCondicoes extends StatelessWidget {
  const TermosCondicoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  child: const Icon(Icons.arrow_back, size: 24),
                  onTap: () => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Cadastro()))
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
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nibh eros, vulputate ac lacus scelerisque, sodales vulputate ipsum. Nam tristique feugiat ex sagittis laoreet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nam id iaculis metus, at mattis elit. Sed vel tortor metus. Suspendisse venenatis magna eu lacinia porttitor. Donec pulvinar, metus at hendrerit viverra, quam ante volutpat erat, sit amet ultricies lectus nisl in nisi.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 40.0, right: 40.0),
                child: Text(
                  'Curabitur vel quam id magna ultricies aliquam nec sit amet arcu. Aenean interdum accumsan lacus, id varius augue dapibus at. Pellentesque at ex mattis ex euismod rutrum id a libero. Praesent consequat sit amet nulla et congue. Suspendisse eget sapien et tortor malesuada lobortis. Pellentesque egestas blandit consectetur. Vivamus dignissim leo at dolor pellentesque, nec pulvinar nisi mollis. Sed pellentesque venenatis metus, id pellentesque ex maximus a.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 40.0, right: 40.0, bottom: 80.0),
                child: Text(
                  'Donec neque dui, eleifend sed odio ut, pretium auctor nunc. Sed in neque non turpis congue aliquam. Nam lorem turpis, tincidunt in neque eu, tempus tempor quam. Phasellus dolor est, aliquam id lorem sed, ultricies porttitor libero. Nam quis tincidunt odio, id congue odio. Praesent eget est a metus bibendum auctor vitae nec velit. Praesent ut nulla diam. Phasellus est mauris, commodo at facilisis sed, vulputate et arcu. Morbi tempor at magna id varius. Etiam vulputate dictum risus ultricies scelerisque. Vivamus suscipit ligula eget finibus maximus. Cras sed rhoncus metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse in quam a mauris condimentum malesuada. Nullam in magna non massa ultricies egestas at at erat. Ut pretium, felis ac varius placerat, sem nunc rhoncus nisl, quis porta ligula felis eu neque.',
                  style: TextStyle(
                    fontSize: 16.0,
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
