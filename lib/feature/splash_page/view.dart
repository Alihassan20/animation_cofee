import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget  {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {

  AnimationController? _caffeController;

  bool animatrdCaffe = false;

  @override
  void initState() {
    _caffeController = AnimationController(vsync: this);
    _caffeController!.addListener(() {
      if(_caffeController!.value>0.9){
        _caffeController!.stop();
        animatrdCaffe = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _caffeController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var hight= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:animatrdCaffe?Color(0xff632B13):Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              height:animatrdCaffe?hight/1.9:hight ,
              decoration: const BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight:Radius.circular(20) )
              ),
              child: Column(
                children: [
                  Visibility(
                    visible: !animatrdCaffe
                    ,child: Lottie.network("https://assets10.lottiefiles.com/packages/lf20_R3aEEI.json",
                      height: 400,
                      width: double.infinity,
                    controller: _caffeController,
                      onLoaded: (composition){
                      _caffeController!..duration = composition.duration..forward();
                      }
                    ),
                  ),
                  Visibility(
                    visible: animatrdCaffe,
                      child: Image.asset("assets/cofee.png",
                        height: 400,
                        width: double.infinity,
                      )),
                  Visibility(
                    visible: animatrdCaffe,
                    child: const Center(
                      child: Text("C A F É",style:  TextStyle(fontWeight: FontWeight.w700,color: Color.fromRGBO(208, 181, 101, 1),fontSize: 25),),
                    ),
                  )            ],
              ),
            ),
            Visibility(
              visible: animatrdCaffe,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Find The Best Coffee for You',
                        style: TextStyle(
                            fontSize: 27.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),

                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        'Lorem ipsum dolor sit amet, adipiscing elit. '
                            'Nullam pulvinar dolor sed enim eleifend efficitur.',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white.withOpacity(0.8),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 50.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 85.0,
                          width: 85.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2.0),
                          ),
                          child: const Icon(
                            Icons.chevron_right,
                            size: 50.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50.0),
                    ],
                  ),
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}
