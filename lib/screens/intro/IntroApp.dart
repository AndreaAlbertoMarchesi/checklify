import 'package:checklist_app/screens/home/Home.dart';
import 'package:checklist_app/screens/intro/widgets/TermAndCondsDialog.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    slides.add(
      new Slide(
        title: "HOME",
        styleTitle: TextStyle(
            color: Colors.blue,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "DESCRIZIONE APP",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/introScreen/screen1.png",
        backgroundImage: "images/introScreen/screen3.jpg",
        backgroundImageFit: BoxFit.fill,
      ),
    );
    slides.add(
      new Slide(
        title: "ADD TASK",
        styleTitle: TextStyle(
            color: Colors.blue,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "SPIEGARE COME SI AGGIUNGONO LE TASK",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/introScreen/screen1.png",
        backgroundImage: "images/introScreen/screen1.png",
      ),
    );
    slides.add(
      new Slide(
        title: "MOVE THEM EVERYWHERE",
        styleTitle: TextStyle(
            color: Colors.blue,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "SPIEGARE COME SI MUOVONO LE TASK",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/introScreen/screen1.png",
        backgroundImage: "images/introScreen/screen1.png",
      ),
    );
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.blue[800],
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.blue[800],
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.blue[800],
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(currentSlide.backgroundImage),
                fit: BoxFit.cover)),
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: i == 0
                    ? EdgeInsets.only(top: 80.0)
                    : EdgeInsets.only(top: 400.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    showTerms() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return TermAndCondsDialog();
        },
      );
    }

    void onDonePress() {
      if (/*settings.termsAndCondsAccepted && */settings.firstTime) {
        _closeFullScreen();
        _allowRotation();
        ///i comment for now the terms and conditions option
        settings.acceptTermsConditions();
        Navigator.push(
          context,
          MaterialPageRoute(maintainState: false, builder: (context) => HomeScreen()),
        );
      } else if (/*settings.termsAndCondsAccepted && */ !settings.firstTime) {
        _closeFullScreen();
        _allowRotation();
        ///i comment for now the terms and conditions option
        settings.acceptTermsConditions();
        Navigator.of(context).pop();
      }//else
        //showTerms();
    }

    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Colors.lightBlue[50],
      highlightColorSkipBtn: Colors.blue[100],

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: onDonePress,
      colorDoneBtn: Colors.lightBlue[50],
      highlightColorDoneBtn: Colors.blue[100],

      // Dot indicator
      colorDot: Colors.blue,
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },


      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }

  _allowRotation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  _closeFullScreen(){
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }
}
