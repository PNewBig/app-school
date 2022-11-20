import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        //part of the top which use to show the profile of user
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 1, 56, 122),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Container(
              margin: const EdgeInsets.only(top: 10, left: 20),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                    margin: const EdgeInsets.all(10),
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/august.png"))),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: Text("Vanlakhan INSYXIENGMAI",
                        style: Theme.of(context).textTheme.bodyText1)),
              ])),
        ),

        //part of showing the classroom available
        Container(
            margin: const EdgeInsets.only(top: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Text("My Classes",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal))),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                     width: 400,
                      height: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [BoxClassroom("C programming"), BoxClassroom("Data mining")],
                      )))
            ])),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Text("Class Teacher",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal))),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                      height: 140,
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [BoxClassroom("Image processing"), BoxClassroom("Database")],
                      )))
            ])),
      ],
    ));
  }

  Widget BoxClassroom(String subject_name) {
    return Stack(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Center(child: Text(subject_name, style: Theme.of(context).textTheme.subtitle1)))),
          Positioned(
            top: 77,
            left: 50,
            right: 50,
            child: CircleAvatar(
                backgroundColor: Colors.black,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {},
                )),
          ),
        ],
        fit: StackFit.loose,
        clipBehavior: Clip.none,
      );
    
  }
}
