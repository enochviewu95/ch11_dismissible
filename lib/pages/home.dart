import 'package:flutter/material.dart';
import 'package:ch11_dismissible/classes/trip.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _trips = List<Trip>();

  void _markTripCompleted(){
    //Mark trip completed in database or web service
  }

  void _deleteTrip(){
    //Delete trip from database or web service
  }

  @override
  void initState() {
    super.initState();
    _trips..add(Trip(id: '0',tripName: 'Rome',tripLocation: 'Italy'))
      ..add(Trip(id: '1',tripName: 'Paris',tripLocation: 'France'))
      ..add(Trip(id: '2',tripName: 'New York',tripLocation: 'USA - New York'))
      ..add(Trip(id: '3',tripName: 'Cancun',tripLocation: 'Mexico'))
      ..add(Trip(id: '4',tripName: 'London',tripLocation: 'England'))
      ..add(Trip(id: '5',tripName: 'Sydney',tripLocation: 'Australia'))
      ..add(Trip(id: '6',tripName: 'Miami',tripLocation: 'USA - Florida'))
      ..add(Trip(id: '7',tripName: 'Rio de Janeiro',tripLocation: 'Brazil'))
      ..add(Trip(id: '8',tripName: 'Cusco',tripLocation: 'Peru'))
      ..add(Trip(id: '9',tripName: 'New Delhi',tripLocation: 'India'))
      ..add(Trip(id: '10',tripName: 'Tokyo',tripLocation: 'Japan'));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DismissibleApp'),
      ),
      body: ListView.builder(
        itemCount: _trips.length,
        itemBuilder: (BuildContext context, int index){
          return Dismissible(
            key: Key(_trips[index].id),
            child: _buildBuildListTile(index),
            background: _buildBuildCompleteTrip(),
            secondaryBackground: _buildBuildRemoveTrip(),
            onDismissed: (DismissDirection direction){
              direction == DismissDirection.startToEnd  ? _markTripCompleted() : _deleteTrip();
              //Remove item from list
              setState((){
                _trips.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }

  Container _buildBuildRemoveTrip(){
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      )
    );
  }

  Container _buildBuildCompleteTrip(){
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.done,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  ListTile _buildBuildListTile(int index){
    return ListTile(
      title: Text('${_trips[index].tripName}'),
      subtitle: Text(_trips[index].tripLocation),
      leading: Icon(Icons.flight),
      trailing: Icon(Icons.fastfood),
    );
  }
}
