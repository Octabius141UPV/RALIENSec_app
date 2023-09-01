import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
        imgOwnersList.add(
          Text(imgOwnersString[l]),
        );
      }

      int numOwners = houses[i]["userprofiles"].length;

      contendores.add(Animate(
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
          padding: const EdgeInsetsDirectional.fromSTEB(12, 15, 12, 12),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              // ignore: prefer_const_constructors
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x34090F13),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.21,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
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
                        height: 28,
                        child: Stack(
                          alignment: const AlignmentDirectional(-1, 0),
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            ListView.builder(
                              // primary: true,
                              scrollDirection: Axis.vertical,
                              itemCount: imgOwnersList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: 28,
                                  height: 28,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(imgOwnersString[index],
                                      fit: BoxFit.fitHeight),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: Text(
                          houses[i]["name"].toString(),
                          style: const TextStyle(
                            fontFamily: 'REM',
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 0, 0, 0),
                            child: Text(
                              '$numOwners usuarios',
                              style: const TextStyle(
                                fontFamily: 'REM',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 8, 0),
                            child: Text(
                              houses[i]["address"].toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF57636C),
                                fontFamily: 'REM',
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
      if (i == houses.length - 1)
        const SizedBox(
          height: 100,
        );
    }
    return contendores;
  }
}
