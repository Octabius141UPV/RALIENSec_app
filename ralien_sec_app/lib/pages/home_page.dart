import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:ralien_sec_app/components/houseContainer.dart';
import 'package:ralien_sec_app/main.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  String userPhotoString =
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.okchicas.com%2Fwp-content%2Fuploads%2F2018%2F01%2FPoses-para-una-buena-foto-de-perfil-15-1-701x700.jpg&f=1&nofb=1&ipt=0da5b458681f6c4b01134f21ef9574a8a5eba5f113b0d5c1f7711f4310399437&ipo=images";
  bool isVisible = true;

  late final ScrollController scrollController = ScrollController()
    ..addListener(() {
      isVisible = scrollController.position.userScrollDirection ==
          ScrollDirection.reverse;

      setState(() {});
    });

  final TextEditingController _controllerBuscador = TextEditingController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F5F8),
        body: SingleChildScrollView(
          controller: scrollController,
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 50, 16, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFF3D235E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              userPhotoString,
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.09,
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Silvia Lopez",
                      style: TextStyle(
                        fontFamily: "REM",
                        color: Color(0xFF0F1113),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7C8B94),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: const AlignmentDirectional(0, 0),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: TextFormField(
                        controller: _controllerBuscador,
                        obscureText: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFFFFFFF),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          labelText: "Encuentra una casa",
                          labelStyle: const TextStyle(
                            fontFamily: 'REM',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF57636C),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF1F5F8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF3D235E),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              24, 12, 12, 12),
                          prefixIcon: const Icon(
                            Icons.search_sharp,
                            color: Color(0xFF57636C),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: "REM",
                          color: Color(0xFF0F1113),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 1,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: Color(0x1B090F13),
                              offset: Offset(0, -2),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFFFFF),
                            ),
                            alignment: const AlignmentDirectional(0, -1),
                            child: SingleChildScrollView(
                              child: Column(
                                children: HouseContainer.crearContainer(
                                    context, getJsonHouses()),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
