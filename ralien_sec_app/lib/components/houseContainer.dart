import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ralien_sec_app/main.dart' as main;

class HouseContainer {
  static List<Animate> crearContainer(
      BuildContext context, List<dynamic> houses) {
    List<Animate> contendores = [];

    for (int i = 0; i < houses.length; i++) {
      List<String> imgOwnersString = [];
      List<Widget> imgOwnersList = [];
      for (int j = 0; j < houses[i]["userprofiles"].length; j++) {
        /* jsonHouses[i]["userprofiles"][j]["profile_image"] */
        imgOwnersString.add(houses[i]["userprofiles"][j]["profile_image"]);
      }
      for (int l = 0; imgOwnersString.length > l; l++) {
        imgOwnersList.add(Text(imgOwnersString[l]));
      }

      contendores.add(
        Animate(
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
                        image: NetworkImage(houses[i][
                            "photo"]), //Hacer un get de la imagen o bien de la base de datos, o bien del local
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
                            children: [
                              ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: imgOwnersList.length,
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
        ),
      );
    }
    return contendores;
  }
}
