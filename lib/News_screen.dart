import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final String url =
      "http://ninanews.com/NinaNewsService/api/values/GetLastXBreakingNews?rowsToReturn=10";
   List news = [];

  @override
  void initState(){
    super.initState();
    this.getNews();
  }
  Future<String> getNews() async {
    var response = await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    print (response.body);

    setState(() {
      var newsJson = json.decode(response.body);
      print(newsJson);
       // news = newsJson['Data'];
    });
    return 'Success';
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
              flexibleSpace:Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin:Alignment.topLeft,
                    end:Alignment.bottomRight,
                    colors: <Color>[
                      Colors.brown.shade600,
                      Colors.brown.shade900,
                    ])),
              ),
          elevation: 5.0,

          leading:SizedBox(
            width: 60.0,
            child: InkWell(
              splashColor: Colors.white,

              onTap: () => runApp(MyApp()),
              child:Icon(
                Icons.web,
              )),
          ),
          actions: <Widget>[
            Padding(
              padding:const EdgeInsets.all(5.0),
             // child:Image.asset(''),
            ),
          ],
          title: Column(
            children: <Widget>[
              Text(
                'Lorem Ipsum',
                  textDirection:TextDirection.rtl,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.developer_mode,size:8.0),
                  Text(
                    'Developed by Andisi',
                    style: TextStyle(
                      fontSize: 8.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          centerTitle: true,
              ),
      body: ListView.builder(
          // ignore: unnecessary_null_comparison
          itemCount: news.length,
          itemBuilder:(context,index) {
            return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                      padding: const EdgeInsets.only(top:5.0,bottom:10.0),
                    child: ListTile(
                      onTap: () =>null,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Card(
                            elevation: 8.0,
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end:Alignment.bottomRight,
                                  colors: <Color>[
                                    Colors.brown.shade600,
                                    Colors.brown.shade900,
                                  ])),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                    size: 15.0,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    news[index]['Papered_Date']
                                        .toString()
                                        .substring(0,10),
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color:Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Card(
                            elevation: 6.0,
                            child: Image.network(
                            news[index]['Pic'],
                              fit:BoxFit.fitWidth,
                            ),
                          ),
                          Card(
                            elevation: 10.0,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                              child: Text(
                                news[index]['Papered_Title'],
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style:TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown.shade700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Card(
                            elevation: 4.0,
                            child: ListTile(
                              title: Text(
                                news[index]['Papered_Details'],
                                textDirection: TextDirection.rtl,
                                style:
                                TextStyle(color: Colors.black,fontSize:15.0 ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            );
          }
      ),
    );
  }

  }

