import 'package:flutter/material.dart';
import 'package:mvp/src/styles/colors.dart';
import 'package:mvp/src/widgets/mascotasForm.dart';
class SwipeList extends StatefulWidget {
  SwipeList({Key? key}) : super(key: key);

  @override
  State<SwipeList> createState() => _SwipeListState();
}

class _SwipeListState extends State<SwipeList> {
  List items = getDummyList();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return  GestureDetector(
              onTap: () {
                print('si entra');
              },
          child: Card(
            
            elevation: 5,
            child: Container(
              height: 100.0,
              child: Row(
                children: <Widget>[
                  
                  Container(
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Mascota: ${items[index]}",
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                            child: Row(
                              children: [
                                Container(
                              width: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(color: ColorsSelect.paginatorNext),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: const Text(
                                "Tipo:",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              child: Text(
                                " tipo${items[index]}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                              ],
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                            child: Container(
                              width: 260,
                              child: Text(
                                "Lorem",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 48, 48, 54)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return i + 1;
    });
    return list;
  }
}
