import 'data.dart';
import 'package:flutter/material.dart';
import 'styles.dart';
import 'package:flutter/scheduler.dart';

class DetailPage extends StatefulWidget {
  final DecorationImage type;
  const DetailPage({Key key, this.type}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState(type: type);
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  AnimationController _containerController;
  Animation<double> width;
  Animation<double> heigth;
  DecorationImage type;
  _DetailPageState({this.type});
  List data = imageData;
  double _appBarHeight = 256.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  void initState() {
    _containerController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    super.initState();
    width = Tween<double>(
      begin: 200.0,
      end: 220.0,
    ).animate(
      CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    heigth = Tween<double>(
      begin: 400.0,
      end: 400.0,
    ).animate(
      CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    heigth.addListener(() {
      setState(() {
        if (heigth.isCompleted) {}
      });
    });
    _containerController.forward();
  }

  @override
  void dispose() {
    _containerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.7;
    int img = data.indexOf(type);
    //print("detail");
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color.fromRGBO(106, 94, 175, 1.0),
        platform: Theme.of(context).platform,
      ),
      child: Container(
        width: width.value,
        height: heigth.value,
        color: const Color.fromRGBO(106, 94, 175, 1.0),
        child: Hero(
          tag: "img",
          child: Card(
            color: Colors.transparent,
            child: Container(
              alignment: Alignment.center,
              width: width.value,
              height: heigth.value,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  CustomScrollView(
                    shrinkWrap: false,
                    slivers: <Widget>[
                      SliverAppBar(
                        elevation: 0.0,
                        forceElevated: true,
                        leading: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.cyan,
                            size: 30.0,
                          ),
                        ),
                        expandedHeight: _appBarHeight,
                        pinned: _appBarBehavior == AppBarBehavior.pinned,
                        floating: _appBarBehavior == AppBarBehavior.floating ||
                            _appBarBehavior == AppBarBehavior.snapping,
                        snap: _appBarBehavior == AppBarBehavior.snapping,
                        flexibleSpace: FlexibleSpaceBar(
                          title: Text("Skill"),
                          background: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Container(
                                width: width.value,
                                height: _appBarHeight,
                                decoration: BoxDecoration(
                                  image: data[img],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(<Widget>[
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(35.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(bottom: 20.0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.black12))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.trending_up,
                                              color: Colors.cyan,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Intermediate"),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.whatshot,
                                              color: Colors.cyan,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("HOT"),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, bottom: 8.0),
                                    child: Text(
                                      "ABOUT",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed lacinia vehicula iaculis. Ut tristique massa justo, at ultrices felis lobortis at. Quisque sed lacus luctus erat malesuada tristique rutrum a velit. Sed vestibulum ex turpis, a ornare nibh laoreet eu. Cras viverra massa sollicitudin laoreet consectetur. Curabitur blandit metus eu orci suscipit, sit amet interdum odio tristique. Mauris tempus luctus nulla, eget accumsan dolor egestas at. Pellentesque eget sem tempor, aliquam leo ac, fermentum sem. Phasellus sit amet tincidunt ipsum. Phasellus at vulputate lacus, et pulvinar dolor."),
                                  Container(
                                    margin: EdgeInsets.only(top: 25.0),
                                    padding: EdgeInsets.only(
                                        top: 5.0, bottom: 10.0),
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.black12))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "THE SMART ONES",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            CircleAvatar(
                                                backgroundImage: avatar1),
                                            CircleAvatar(
                                              backgroundImage: avatar2,
                                            ),
                                            CircleAvatar(
                                              backgroundImage: avatar3,
                                            ),
                                            CircleAvatar(
                                              backgroundImage: avatar4,
                                            ),
                                            CircleAvatar(
                                              backgroundImage: avatar5,
                                            ),
                                            CircleAvatar(
                                              backgroundImage: avatar6,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 100.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  Container(
                      width: 600.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(121, 114, 173, 1.0),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {},
                              child: Container(
                                height: 60.0,
                                width: 130.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(60.0),
                                ),
                                child: Text(
                                  "DUMB",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {},
                              child: Container(
                                height: 60.0,
                                width: 130.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(60.0),
                                ),
                                child: Text(
                                  "SMART",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}