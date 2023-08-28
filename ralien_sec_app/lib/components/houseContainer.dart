import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

import "package:ralien_sec_app/main.dart";

class HouseContainer extends StatefulWidget {
  //Convertir en stateful widget
  final String houseId;
  Map<String, dynamic> house = {};

  HouseContainer({
    required this.houseId,
    required this.house,
    super.key,
  });

  @override
  State<HouseContainer> createState() => _HouseContainter();
}

class _HouseContainter extends State<HouseContainer> {
  List<Widget> imgOwnersList = [];
  int numberOfOwners = 1;

//Llam  ada a la api para obtener todos los valores del usuario
  /* void _callToAPI() async {
    final response =
        await http.get(Uri.parse("$getApiUrl()api/loginUserApi/?token=$token"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
 */
  /* if (data["success"] == true) {

          //Bucle para obtener las fotos de perfil de las personas que tienen acceso a la casa
          for(int i = 0; i < numberOfOwners; i++){
            final imageUrl = data['imgProfileUrl'+ i.toString()];
            final image = Image.network(imageUrl);
            setState(() {
            imgOwnersList.add(image);
            });    
          }
          

          
        } else {
          print('La clave "Success" no es verdadera en la respuesta JSON');
  /*       } */
    } else {
      print('Error en la solicitud');
    } //Si la soliticud es exitosa, analiza el JSON
  } */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
/*     _callToAPI(); */
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(30, 0),
          end: Offset(0, 0),
        )
      ],
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),

            border: Border.all(
              color: Colors.transparent,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.21,
                color: Colors.white,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(12),
                  image: DecorationImage(
                    image: AssetImage(
                        ''), //Hacer un get de la imagen o bien de la base de datos, o bien del local
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: Stack(
                        alignment: AlignmentDirectional(-1, 0),
                        children: <Widget>[
                          ListView.builder(
                            itemCount: numberOfOwners,
                            itemBuilder: (BuildContext context, int index) {
                              return imgOwnersList[index];
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
