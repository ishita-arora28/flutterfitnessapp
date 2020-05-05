import 'package:flutter/material.dart';
import 'package:myfirstapp/date_utils.dart';
import 'package:myfirstapp/home_page_bloc.dart';
import 'package:myfirstapp/radial_progress.dart';
import 'package:myfirstapp/sidebar.dart';


class  ActivityPage extends StatefulWidget{
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  HomePageBloc _homePageBloc;
  void initState() {
  _homePageBloc=HomePageBloc();

    super.initState();
  }
  @override
  void dispose() {
    _homePageBloc.dispose();
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(

        title: Text(
            "PiezeoSmartShoe",
            style: TextStyle(

                fontSize: 25.0
            )
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 50.0,
        brightness: Brightness.dark,
      ),
      drawer: Sidebar(),
      body: Stack(
        children: <Widget>[

          Stack(
            children: <Widget>[
              Positioned(
              top:60.0,
              left: 0.0,
              right: 0.0,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size:35.0
                    ),
                    onPressed: (){
                        _homePageBloc.subtractDate();
                    },
              ),
                  StreamBuilder(
                    stream: _homePageBloc.dateStream,
                    initialData: _homePageBloc.selectedDate,
                    builder: (context,snapshot){
                      return Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(formatterDayOfWeek.format(snapshot.data),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:24.0,
                                letterSpacing: 1.2,
                                color: Colors.black,
                                fontFamily: 'Times New Roman',
                              ),
                            ),
                            Text(
                              formatterDate.format(snapshot.data),
                              style: TextStyle(
                                  fontFamily: 'Times New Roman',
                                  fontSize:20.0,
                                  letterSpacing: 1.1,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Transform.rotate(
                    angle: 135.0,
                    child:IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color:Colors.black,
                        size:35.0
                      ),
                       onPressed: (){
                        _homePageBloc.addDate();
                       },
                    ),
                  )
                ],
              ),
              ),
            ],
          ),
          Positioned(
              right:110.0,
              bottom: 350.0,
              child:RadialProgress() ),
          Positioned(
            right:60.0,
            bottom: 100.0,
          child: MonthlyListing(),
          ),
        ],
      ),

      backgroundColor: Colors.white,


    );
  }

}
class MonthlyListing extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
          MonthlyStatusRow('March 2020 ', 'On going'),
      MonthlyStatusRow('February 2020 ', 'Failed'),
      MonthlyStatusRow('January 2020 ', 'Completed'),
           ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              MonthlyTargetRow(' Lose weight', '3.8 ktgt/7 kg'),
              MonthlyTargetRow(' Running per month', '15.3 km/20 km'),
              MonthlyTargetRow(' Avg steps Per day', '10000/10000'),
            ],
          ),

        ],
      ),
    );
  }

}
class MonthlyStatusRow extends StatelessWidget{
  final String monthYear,status;
  MonthlyStatusRow(this.monthYear,this.status);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            monthYear,
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          Text(
            status,
            style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

class MonthlyTargetRow extends StatelessWidget {
  final String target, targetAchieved;

  MonthlyTargetRow(this.target, this.targetAchieved);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            target,
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          Text(
            targetAchieved,
            style: TextStyle(color: Colors.grey, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}