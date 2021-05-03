import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:animations/animations.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
          child: Text('Dashboard',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
        backgroundColor: Colors.black,
      ),

body: Column(
  children:<Widget>[
    Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        child:Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                child: Text('Night Football Club Dwarka',style:TextStyle(fontSize: 20,)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children:<Widget> [
                    Container(
                       decoration: BoxDecoration(
                         color:Colors.grey[200],borderRadius: BorderRadius.all(Radius.circular(5))
                       ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text('0',style: TextStyle(fontSize: 16),),
                        )),
                    SizedBox(width: 3,),
                    Text('Players',style: TextStyle(fontSize: 16,color: Colors.grey)),
                    SizedBox(width:22),
                    Container(
                        decoration: BoxDecoration(
                            color:Colors.grey[200],borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text('0',style: TextStyle(fontSize: 16),),
                        )),
                    SizedBox(width: 3,),
                    Text('Coaches', style:TextStyle(fontSize: 16,color: Colors.grey)),
                    SizedBox(width:22),


                    Text('Football',style:TextStyle(fontWeight: FontWeight.bold,),)


                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,140,0),
                child: Text('Center:Head Marco Reus',style:TextStyle(fontSize: 12,color:Colors.grey)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                child: Text('Location:BBPS,Plot-14,Sector-12,Dwarka New Delhi',style:TextStyle(fontSize: 12,color:Colors.grey)),
              )
            ],
          ),
        )
      ),
    )
  ]
),
floatingActionButton:OpenContainer(closedBuilder: (context,openWidget){
  return FloatingActionButton(onPressed: openWidget,backgroundColor: Colors.black,child:Icon(Icons.add));
} ,openBuilder: (context,closedWidget){
  return Destination();
}
) ,

bottomNavigationBar:FancyBottomNavigation(

  tabs:[
    TabData(iconData:Icons.home_outlined,title:"Home" ,),
    TabData(iconData:Icons.sports,title:"Coach"),
    TabData(iconData:Icons.notification_important_outlined,title:"Notification"),
    TabData(iconData:Icons.person_outline,title:"Profile"),
  ],

  textColor: Colors.black,

  circleColor: Colors.black,inactiveIconColor:Colors.black ,
  onTabChangedListener: (position){
    setState(() {
      print("currentIndex $position");

    });

  },

)
    );
  }
}
class Destination extends StatefulWidget {
  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  List _myActivities;
  String _myActivitiesResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _myActivitiesResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivitiesResult = _myActivities.toString();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: Text('Dashboard',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          backgroundColor: Colors.black,
        ),

        body:Scrollbar(
          isAlwaysShown: true,
          //controller: _scrollController,
          child: ListView(
              children:<Widget>[
            Center(
              child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    child: MultiSelectFormField(
                      autovalidate: false,
                      title: Text('Sport Categories',style:TextStyle(fontSize: 15,color:Colors.grey[600])),
                      validator: (value) {
                        if (value == null || value.length == 0) {
                          return 'Please select one or more options';
                        }
                      },
                      dataSource: [
                        {
                          "display": "Basketball",
                          "value": "Basketball",
                        },
                        {
                          "display": "Football",
                          "value": "Football",
                        },
                        {
                          "display": "Tennis",
                          "value": "Tennis",
                        },
                        {
                          "display": "Fencing",
                          "value": "Fencing",
                        },
                        {
                          "display": "Swimming ",
                          "value": "Swimming",
                        },
                        {
                          "display": "Soccer",
                          "value": "Soccer",
                        },
                        {
                          "display": "Karate",
                          "value": "Karate",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCEL',
                      // required: true,
                      hintWidget: Text('Please choose one or more'),
                      initialValue: _myActivities,
                      onSaved: (value) {
                        if (value == null) return;
                        setState(() {
                          _myActivities = value;
                        });
                      },
                    ),
                  ),
               /*   Container(
                    padding: EdgeInsets.all(8),
                    child: RaisedButton(
                      child: Text('Save'),
                      onPressed: _saveForm,
                    ),
                  ),

                */
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(_myActivitiesResult),
                  )
                ],
              ),
          ),
            ),


                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0,18,18,0),
                  child: Card(
                      child:Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                              child: Text('Nike Football Club Dwarka',style:TextStyle(fontSize: 20,)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children:<Widget> [
                                  Container(
                                      decoration: BoxDecoration(
                                          color:Colors.grey[200],borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text('87',style: TextStyle(fontSize: 16),),
                                      )),
                                  SizedBox(width: 3,),
                                  Text('Players',style: TextStyle(fontSize: 16,color: Colors.grey)),
                                  SizedBox(width:22),
                                  Container(
                                      decoration: BoxDecoration(
                                          color:Colors.grey[200],borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text('12',style: TextStyle(fontSize: 16),),
                                      )),
                                  SizedBox(width: 3,),
                                  Text('Coaches', style:TextStyle(fontSize: 16,color: Colors.grey)),
                                  SizedBox(width:22),


                                  Text('Football',style:TextStyle(fontWeight: FontWeight.bold,),)


                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,140,0),
                              child: Text('Center:Head Marco Reus',style:TextStyle(fontSize: 12,color:Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                              child: Text('Location:BBPS,Plot-14,Sector-12,Dwarka New Delhi',style:TextStyle(fontSize: 12,color:Colors.grey)),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0,18,18,18),
                  child: Card(
                      child:Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(3, 0, 10, 0),
                              child: Text('Nike BasketBall Club Janakpur',style:TextStyle(fontSize: 20,)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children:<Widget> [
                                  Container(
                                      decoration: BoxDecoration(
                                          color:Colors.grey[200],borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text('87',style: TextStyle(fontSize: 16),),
                                      )),
                                  SizedBox(width: 3,),
                                  Text('Players',style: TextStyle(fontSize: 16,color: Colors.grey)),
                                  SizedBox(width:22),
                                  Container(
                                      decoration: BoxDecoration(
                                          color:Colors.grey[200],borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text('12',style: TextStyle(fontSize: 16),),
                                      )),
                                  SizedBox(width: 3,),
                                  Text('Coaches', style:TextStyle(fontSize: 16,color: Colors.grey)),
                                  SizedBox(width:22),


                                  Text('Football',style:TextStyle(fontWeight: FontWeight.bold,),)


                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,140,0),
                              child: Text('Center:Head Marco Reus',style:TextStyle(fontSize: 12,color:Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                              child: Text('Location:BBPS,Plot-14,Sector-12,Dwarka New Delhi',style:TextStyle(fontSize: 12,color:Colors.grey)),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                  Align(
                    alignment:Alignment.bottomRight,
                    child: FlatButton.icon(
                        onPressed: (){
                          _saveForm();
                          print('button clicked');
                        },
                      label:Text('Add Me',style:TextStyle(color:Colors.black)),
                      icon: Icon(Icons.add),
                    ),
                  )

              ]
          ),
        ),

        bottomNavigationBar:FancyBottomNavigation(

          tabs:[
            TabData(iconData:Icons.home_outlined,title:"Home" ,),
            TabData(iconData:Icons.sports,title:"Coach"),
            TabData(iconData:Icons.notification_important_outlined,title:"Notification"),
            TabData(iconData:Icons.person_outline,title:"Profile"),
          ],

          textColor: Colors.black,

          circleColor: Colors.black,inactiveIconColor:Colors.black ,
          onTabChangedListener: (position){
            setState(() {
              print("currentIndex $position");

            });

          },

        )
    );
  }
}


