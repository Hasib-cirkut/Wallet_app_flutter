import 'package:accountant_app/constants.dart';
import 'package:flutter/material.dart';

List<String> pillButtonList = [
  'Grocery',
  'Food',
  'Grocery',
  'Food',
  'Grocery',
  'Food',
  'Grocery',
  'Food',
];

List<bool> selectedList = [true, false, false, false];

int selectedItem = 0;

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
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
                    width: double.infinity,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            child: PillButton(
                              label: 'Grocery',
                              ic: Icons.local_grocery_store,
                              selected: selectedList[0],
                            ),
                            onTap: () {
                              toggleSelected(0);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: PillButton(
                              label: 'Food',
                              ic: Icons.fastfood,
                              selected: selectedList[1],
                            ),
                            onTap: () {
                              toggleSelected(1);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: PillButton(
                              label: 'Taxi',
                              ic: Icons.local_taxi,
                              selected: selectedList[2],
                            ),
                            onTap: () {
                              toggleSelected(2);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: PillButton(
                              label: 'Misc',
                              ic: Icons.devices_other,
                              selected: selectedList[3],
                            ),
                            onTap: () {
                              toggleSelected(3);
                            },
                          ),
                        ),
                      ],
                    ))),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.green,
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
        child: Container(
      height: 40,
      decoration: BoxDecoration(
        color: selected ? Colors.orange[700] : Colors.orange,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 5),
              color: selected ? Colors.black54 : Colors.black12,
              spreadRadius: 1.0)
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Icon(ic),
          ),
          Expanded(
            flex: 2,
            child: Text('$label'),
          )
        ],
      ),
    ));
  }
}
