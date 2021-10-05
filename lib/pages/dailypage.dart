import 'package:expenses_budget/json/dailyjson.dart';
import 'package:expenses_budget/json/day_month.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
class DailyPage extends StatefulWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int _activeDay = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: TheBody(),
    );
  }

  //This is the function of the body
  Widget TheBody(){
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
          children: [
            //Child1
            Container(
              decoration: BoxDecoration(
                  color: white,// Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.01),
                      spreadRadius: 10,
                      blurRadius: 3,
                    ),
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top:60, right: 20, left: 20, bottom: 25
                ),
                child: Column(
                  children:[
                    //Child1
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Child1
                          Text(
                            "Daily Expenses",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: black
                            ),
                          ),
                          //Child2

                          Icon(Icons.search,)

                        ]
                    ),
                    SizedBox(height: 25,),

                    //Child2
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(days.length, (index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              _activeDay = index;
                            });
                          },
                          child: Container(
                            width: (size.width -40)/7,
                            child: Column(
                              children: [
                                Text(
                                  days[index]["label"],
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: _activeDay==index ? primary:Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _activeDay==index ? primary:black.withOpacity(0.1)
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      days[index]["day"],
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: _activeDay==index ? white:black
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),

                  ],
                ),
              ),
            ),

            SizedBox(height: 30,),

            //Child2
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                children: List.generate(daily.length, (index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Container(
                            width: (size.width -40) * 0.7,
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: grey.withOpacity(0.1),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      daily[index]['icon'],
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                ),

                                SizedBox(width: 15,),

                                Container(
                                  width:(size.width -90) * 0.5 ,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        daily[index]['name'],
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        daily[index]['date'],
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: black.withOpacity(0.5),
                                            fontWeight: FontWeight.w400
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),

                          Container(
                            width: (size.width -40) * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  daily[index]['price'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 65,
                          top: 8,
                        ),
                        child: Divider(
                          thickness: 0.8,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only( right: 80),
                    child: Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black.withOpacity(0.4),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only( right: 80),
                    child: Text(
                      "\€2000",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black.withOpacity(0.4),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                  )
                ],
              ),
            ),
          ],
        ),
      );


  }
}
