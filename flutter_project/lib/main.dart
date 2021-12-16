import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyStatelessWidget(),
      ),
    );
  }
}



class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey
      ),
      home: Scaffold(

        body: Stack(

          children:<Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(20,50,20,0),
                child:  Image.asset('images/marvel.png')),
            const SizedBox(
              width: 800,
              height: 300,

              child: Padding(
                padding: EdgeInsets.fromLTRB(95,150,0,0),
                child: Text("Choose your hero",style: TextStyle(color: Colors.red, fontSize: 30),),),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 200, 10, 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        'images/Black cat.jpg',

                        fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.center,
                      ),

                      const Padding(
                        padding: EdgeInsets.fromLTRB(165, 420, 20, 0),
                        child: Text(
                          "Black cat",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      ),
                    ],
                  ), //Black cat

                  Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        'images/spiderman.jpg',
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                        alignment: Alignment.center,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 420, 20, 0),
                        child: Text(
                          "Spider Man",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        'images/Psylocke.jpg',
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                        alignment: Alignment.center,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(2, 10, 20, 0),
                        child: Text(
                          "Psylocke",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        'images/X23.jpeg',
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                        alignment: Alignment.center,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 415, 20, 0),
                        child: Text(
                          "X-23",
                          style: TextStyle(color: Colors.black, fontSize: 50),
                        ),
                      ),
                    ],
                  ),
                ],
              ),


            ),
            ),
          ],
        ),
      ),
    );
  }
}
