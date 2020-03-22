import 'package:corona/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final List<CountriesStat> list;
  SearchPage({Key key, this.list}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _titleController = new TextEditingController();
  bool isvisible;
  List<CountriesStat> searchResult=[];
  int max;
  void searchC(String val) {
    searchResult.clear();
    if (_titleController.text.isNotEmpty) {
      for (int i = 0; i < widget.list.length; i++) {
        if (widget.list[i].countryName.toLowerCase().contains(val.toLowerCase())) {
          searchResult.add(widget.list[i]);
        }
      }
    }
    print("object");
    print(searchResult);
    setState(() {});
  }

  @override
  void initState() {
    max = int.parse(widget.list[0].cases.replaceAll(RegExp(r','), "")) + 10000;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Container(
             // height: 100,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 9,
                  ),
                  Flexible(
                    child: CupertinoTextField(
                      controller: _titleController,
                      placeholder: "Search by Country",
                      clearButtonMode: OverlayVisibilityMode.editing,
                      maxLines: 1,
                      style: TextStyle(fontSize: 26),
                      onSubmitted: (value) {
                        //searchCountry(value);
                        searchC(value);
                        print(value);
                      },
                      onChanged:searchC,
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                ],
              ),
            ),
            Flexible(
              child: searchResult.length != 0
                  ? ListView.builder(
                      itemCount: searchResult.length,
                      itemBuilder: (context, index) => listBar(index, searchResult))
                  : Center(
                    child: Text("Nothing Found",style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget description(String title, String value) => Container(
        height: 35,
        child: Center(
            child: Text.rich(TextSpan(
                text: "$title  :  ",
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: "$value",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                      fontWeight: FontWeight.bold))
            ]))),
      );
  Widget listBar(int index, List<CountriesStat> worldStat) {
    double wpercent =
        int.parse(worldStat[index].cases.replaceAll(RegExp(r','), "")) / max;
    return ExpansionTile(
      title: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              left: 2,
              top: 1,
              bottom: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * wpercent,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(7)),
                // height: 30,
              ),
            ),
            Positioned(
                left: 10,
                top: 16,
                child: Text(
                  "${worldStat[index].countryName}: ${worldStat[index].cases}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
      children: <Widget>[
        description("Country", worldStat[index].countryName),
        description("Cases", worldStat[index].cases),
        description("Deaths", worldStat[index].deaths),
        description("Total Recovered", worldStat[index].totalRecovered),
        description("active Cases", worldStat[index].activeCases)
      ],
    );
  }
}
