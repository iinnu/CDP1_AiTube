import 'package:cdp1_aitube/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FindPage extends StatelessWidget {
  void openSettings(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(FindPage.routeName);
  }

  static const routeName = '/find';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find_page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // When we click the button, something~~
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //1_child
                        Container(
                          child: Text(
                            "Find ID",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        //2_child
                        SizedBox(height: 20, width: 200),
                        //3_child
                        //4_child
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'E-mail',
                          ),
                        ),
                        //5_child
                        SizedBox(height: 5, width: 200),
                        //6_child
                        Container(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            child: Text(
                              "Find",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            onPressed: () {
                              //Press button, then ~~
                            },
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        SizedBox(height: 20, width: 100),
                        //7_child
                        Divider(
                          height: 35,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 20, width: 100),
                        //8_child
                        Container(
                          child: Text(
                            "Find Password",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        //9_child
                        SizedBox(height: 20, width: 200),
                        //10_child
                        //11_child
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'E-mail',
                          ),
                        ),
                        //12_child
                        SizedBox(height: 10, width: 200),
                        //13_child
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'ID',
                          ),
                        ),
                        //14_child
                        SizedBox(height: 5, width: 200),
                        //15_child
                        Container(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            child: Text(
                              "Find",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            onPressed: () {
                              //Press button, then ~~
                            },
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
