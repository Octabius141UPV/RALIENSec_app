// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController1;
  late AnimationController _animationController2;
  late AnimationController _animationController3;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (_pageController.hasClients) {
          _pageController.nextPage(
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController1 = AnimationController(
      vsync: this,
      duration: 1600.ms,
    );
    _animationController2 = AnimationController(
      vsync: this,
      duration: 500.ms,
    );
    _animationController3 = AnimationController(
      vsync: this,
      duration: 600.ms,
    );
    _animationController1.repeat(
      reverse: true,
    );
    _animationController2.forward();
    _animationController3.forward();
  }

  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _animationController1.dispose();
    _animationController2.dispose();
    _animationController3.dispose();
    _pageController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: [
            ClipRRect(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.45,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Animate(
                        onPlay: (_animationController1) =>
                            _animationController1.repeat(reverse: true),
                        controller: _animationController1,
                        effects: [
                          MoveEffect(
                            curve: Curves.easeOut,
                            delay: 0.ms,
                            duration: 3200.ms,
                            begin: Offset(0, -80),
                            end: Offset(0, -30),
                          ),
                          MoveEffect(
                            curve: Curves.easeInOut,
                            delay: 3200.ms,
                            duration: 3200.ms,
                            begin: Offset(0, -30),
                            end: Offset(0, -80),
                          ),
                        ],
                        child: Container(
                          height: 900,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: MasonryGridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            itemCount: 11,
                            itemBuilder: (context, index) {
                              return [
                                () => ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(16),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(16),
                                      ),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW91bnRhaW5zfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                () => ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bW91bnRhaW5zfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                                        width: 120,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                () => ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(16),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(16),
                                      ),
                                      child: Image.network(
                                        'https://picsum.photos/seed/32/600',
                                        width: 100,
                                        height: 0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                () => ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(0),
                                      ),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1454496522488-7a8e488e8606?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bW91bnRhaW5zfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                                        width: 80,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                () => ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1434394354979-a235cd36269d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG1vdW50YWluc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60',
                                        width: 120,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                () => ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bW91bnRhaW5zfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                                        width: 120,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                () => ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(0),
                                      ),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1445363692815-ebcd599f7621?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fG1vdW50YWluc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60',
                                        width: 120,
                                        height: 190,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                () => ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1540390769625-2fc3f8b1d50c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fG1vdW50YWluc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60',
                                        width: 120,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                () => ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1443632864897-14973fa006cf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fG1vdW50YWluc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60',
                                        width: 120,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                () => ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(0),
                                      ),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1614597396930-cd6760b99f7c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fG1vdW50YWluc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60',
                                        width: 120,
                                        height: 190,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                () => ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        'https://picsum.photos/seed/32/600',
                                        width: 120,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                              ][index]();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 670,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 50),
                                  child: PageView(
                                    controller: _pageController,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            48, 0, 48, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Animate(
                                              controller: _animationController2,
                                              effects: [
                                                VisibilityEffect(
                                                    duration: 200.ms),
                                                FadeEffect(
                                                  curve: Curves.easeInOut,
                                                  delay: 200.ms,
                                                  duration: 300.ms,
                                                  begin: 0,
                                                  end: 1,
                                                ),
                                                MoveEffect(
                                                  curve: Curves.easeInOut,
                                                  delay: 200.ms,
                                                  duration: 300.ms,
                                                  begin: Offset(0, 20),
                                                  end: Offset(0, 0),
                                                ),
                                                ScaleEffect(
                                                  curve: Curves.easeInOut,
                                                  delay: 200.ms,
                                                  duration: 300.ms,
                                                  begin: Offset(0.9, 0.9),
                                                  end: Offset(1, 1),
                                                ),
                                              ],
                                              child: Text(
                                                'Controla tu casa desde donde quieras',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 34,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 12, 0, 0),
                                              child: Animate(
                                                controller:
                                                    _animationController3,
                                                effects: [
                                                  VisibilityEffect(
                                                      duration: 300.ms),
                                                  FadeEffect(
                                                    curve: Curves.easeInOut,
                                                    delay: 300.ms,
                                                    duration: 300.ms,
                                                    begin: 0,
                                                    end: 1,
                                                  ),
                                                  MoveEffect(
                                                    curve: Curves.easeInOut,
                                                    delay: 300.ms,
                                                    duration: 300.ms,
                                                    begin: Offset(0, 20),
                                                    end: Offset(0, 0),
                                                  ),
                                                  ScaleEffect(
                                                    curve: Curves.easeInOut,
                                                    delay: 200.ms,
                                                    duration: 300.ms,
                                                    begin: Offset(0.9, 0.9),
                                                    end: Offset(1, 1),
                                                  ),
                                                ],
                                                child: Text(
                                                  'Despreocupate de una vez',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color.fromARGB(
                                                        255, 87, 99, 108),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            48, 0, 48, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Animate(
                                              controller: _animationController2,
                                              effects: [
                                                VisibilityEffect(
                                                    duration: 200.ms),
                                                FadeEffect(
                                                  curve: Curves.easeInOut,
                                                  delay: 200.ms,
                                                  duration: 300.ms,
                                                  begin: 0,
                                                  end: 1,
                                                ),
                                                MoveEffect(
                                                  curve: Curves.easeInOut,
                                                  delay: 200.ms,
                                                  duration: 300.ms,
                                                  begin: Offset(0, 20),
                                                  end: Offset(0, 0),
                                                ),
                                                ScaleEffect(
                                                  curve: Curves.easeInOut,
                                                  delay: 200.ms,
                                                  duration: 300.ms,
                                                  begin: Offset(0.9, 0.9),
                                                  end: Offset(1, 1),
                                                ),
                                              ],
                                              child: Text(
                                                'De manera sencilla',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    fontSize: 34,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 16, 0, 0),
                                              child: Animate(
                                                controller:
                                                    _animationController3,
                                                effects: [
                                                  VisibilityEffect(
                                                      duration: 300.ms),
                                                  FadeEffect(
                                                    curve: Curves.easeInOut,
                                                    delay: 300.ms,
                                                    duration: 300.ms,
                                                    begin: 0,
                                                    end: 1,
                                                  ),
                                                  MoveEffect(
                                                    curve: Curves.easeInOut,
                                                    delay: 300.ms,
                                                    duration: 300.ms,
                                                    begin: Offset(0, 20),
                                                    end: Offset(0, 0),
                                                  ),
                                                  ScaleEffect(
                                                    curve: Curves.easeInOut,
                                                    delay: 200.ms,
                                                    duration: 300.ms,
                                                    begin: Offset(0.9, 0.9),
                                                    end: Offset(1, 1),
                                                  ),
                                                ],
                                                child: Text(
                                                  'Registra el dispositivo y gestiona las llaves como quieras',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 87, 99, 108),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                Align(
                                  alignment: AlignmentDirectional(0, 1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 20),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: _pageController,
                                      count: 2,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) async {
                                        await _pageController.animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      effect: smooth_page_indicator
                                          .ExpandingDotsEffect(
                                        expansionFactor: 3,
                                        spacing: 8,
                                        radius: 16,
                                        dotWidth: 8,
                                        dotHeight: 8,
                                        dotColor:
                                            Color.fromARGB(255, 224, 227, 231),
                                        activeDotColor: Colors.black,
                                        paintStyle: PaintingStyle.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 25, 16, 0),
                        child: ElevatedButton(
                          onPressed: () async {
                            await _pageController.nextPage(
                              duration: Duration(milliseconds: 800),
                              curve: Curves.ease,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                                255, 0, 0, 0), // Colores de fondo del botón
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              'Siguiente',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight
                                    .w500, // Color del texto del botón
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 5, 16, 25),
                        child: ElevatedButton(
                          onPressed: () {
                            print('Botón presionado...');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 255, 255,
                                255), // Colores de fondo del botón
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              'Salir',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
