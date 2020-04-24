import 'package:accountant_app/constants.dart';
import 'package:flutter/material.dart';

List<bool> selectedList = [true, false, false, false];

int selectedItem = 0;
String selectedItemName = 'Grocery';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  List<Widget> pillButtonList = [];

  void toggleSelected(int index) {
    setState(() {
      if (index != selectedItem && selectedItem != -1) {
        //if we select other ones than the selected

        //Deselect the prev one
        selectedList[selectedItem] = false;
      }

      if (selectedList[index] == true) {
        //Deselct it
        selectedList[index] = false;
        selectedItem = -1;
      } else {
        //select it
        selectedList[index] = true;
        selectedItem = index;
      }

      if (selectedItem == 0) {
        selectedItemName = 'Grocery';
      } else if (selectedItem == 1) {
        selectedItemName = 'Food';
      } else if (selectedItem == 2) {
        selectedItemName = 'Taxi';
      } else if (selectedItem == 3) {
        selectedItemName = 'Misc';
      } else {
        selectedItemName = 'None';
      }
    });

    print(selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon:
                            Icon(Icons.close, size: 30, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .08),
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            toggleSelected(0);
                          },
                          child: PillButton(
                            label: 'Grocery',
                            ic: Icons.local_grocery_store,
                            selected: selectedList[0],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            toggleSelected(1);
                          },
                          child: PillButton(
                            label: 'Food',
                            ic: Icons.fastfood,
                            selected: selectedList[1],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            toggleSelected(2);
                          },
                          child: PillButton(
                            label: 'Taxi',
                            ic: Icons.local_taxi,
                            selected: selectedList[2],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            toggleSelected(3);
                          },
                          child: PillButton(
                            label: 'Misc',
                            ic: Icons.devices_other,
                            selected: selectedList[3],
                          ),
                        ),
                      ],
                    ))),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text('You selected $selectedItemName'),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PillButton extends StatelessWidget {
  final String label;
  final IconData ic;
  final bool selected;

  PillButton({@required this.label, @required this.ic, this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                spreadRadius: 2.0,
                blurRadius: 5,
                color: selected ? Colors.black38 : Colors.black12),
          ],
        ),

        //height: 10.0,
        width: 200,
        child: Container(
          padding: EdgeInsets.only(left: 30),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: Icon(
                  ic,
                  size: 40,
                  color: selected ? Colors.black87 : Colors.black38,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  '$label',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: selected ? Colors.black87 : Colors.black38,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
