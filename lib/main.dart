import 'package:accountant_app/constants.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'AddItem.dart';

void main() => runApp(MyApp());

List<Widget> wList = [
  TransactionCard(
    topbarTitle: 'Grocery',
    topBarIcon: Icons.local_grocery_store,
    pillData: pillListGrocery,
  ),
  TransactionCard(
    topbarTitle: 'Food',
    topBarIcon: Icons.fastfood,
    pillData: pillListFood,
  ),
  TransactionCard(
    topbarTitle: 'Taxi',
    topBarIcon: Icons.local_taxi,
    pillData: pillListTaxi,
  ),
  TransactionCard(
    topbarTitle: 'Misc',
    topBarIcon: Icons.devices_other,
    pillData: pillListMisc,
  ),
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Accountant App',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Color(0xFFF4F4F4),
        appBarTheme: AppBarTheme(
            brightness: Brightness.light,
            color: Color(0xFFF4F4F4),
            elevation: 0.0),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.home,
          color: Colors.blueGrey[500],
        ),
        title: Icon(
          Icons.account_balance_wallet,
          color: Colors.black87,
          size: 35,
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              icon: Icon(
                Icons.add_circle,
                color: Colors.blueGrey[500],
                size: 25,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddItem()),
                );
              },
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Current Balance',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          '4520',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Text(
                          '৳',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 7,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: wList,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  TransactionCard(
      {@required this.topbarTitle,
      @required this.topBarIcon,
      @required this.pillData});

  final String topbarTitle;
  final IconData topBarIcon;
  final List pillData;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 20),
                spreadRadius: 5.0,
                blurRadius: 5,
                color: Colors.black12),
          ],
        ),
        height: 10,
        width: MediaQuery.of(context).size.width - 40,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: TransactionTopCard(
                title: topbarTitle,
                topIcon: topBarIcon,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 3,
              child: TransactionBottomCard(
                pillData: pillData,
                leftIcon: topBarIcon,
              ),
            )
          ],
        ));
  }
}

class TransactionTopCard extends StatelessWidget {
  TransactionTopCard({@required this.title, @required this.topIcon});

  final String title;
  final IconData topIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .20,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedIcon(
              icon: topIcon,
              bgColor: Colors.orangeAccent,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                '$title',
                style: kPrimaryTextStyle.copyWith(
                    fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionBottomCard extends StatelessWidget {
  TransactionBottomCard({@required this.pillData, @required this.leftIcon});

  final List pillData;
  final IconData leftIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .20,
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 0),
        height: MediaQuery.of(context).size.height * .20,
        child: ListView.builder(
          reverse: false,
          itemCount: pillData.length,
          itemBuilder: (BuildContext context, int index) {
            String gName = pillData[index]['gName'];
            String gPrice = pillData[index]['gPrice'];

            return Pill(
              groceryName: '$gName',
              groceryPrice: '$gPrice',
              leftIcon: leftIcon,
            );
          },
        ),
      ),
    );
  }
}

class Pill extends StatelessWidget {
  Pill(
      {@required this.groceryName,
      @required this.groceryPrice,
      @required this.leftIcon});

  final String groceryName;
  final String groceryPrice;
  final IconData leftIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * .009, horizontal: 4),
      padding: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * .10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 04),
              spreadRadius: 1.5,
              blurRadius: 5,
              color: Colors.black12),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundedIcon(
                bgColor: Colors.orange[300],
                icon: leftIcon,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '$groceryName',
              style: kPrimaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: <Widget>[
                  Text(
                    '$groceryPrice',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text('৳')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedIcon extends StatelessWidget {
  RoundedIcon({@required this.icon, @required this.bgColor});

  final IconData icon;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(10),
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
