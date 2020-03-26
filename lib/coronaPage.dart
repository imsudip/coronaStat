import 'package:corona/model.dart';
import 'package:corona/searchpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:corona/api.dart';
//import 'package:charts_flutter/flutter.dart' as charts;

class CoronaView extends StatefulWidget {
  @override
  _CoronaViewState createState() => _CoronaViewState();
}

WorldStat worldStat;
int max;
WorldStat currentStat;

class _CoronaViewState extends State<CoronaView> {
  bool isvisible = false;
  World world;
  loadWorld()async{
    world= await getWorldStat();
  }
  loadData() async {
    worldStat = await getStat();
    max = int.parse(
            worldStat.countriesStat[0].cases.replaceAll(RegExp(r','), "")) +
        22000;

    setState(() {
      currentStat = worldStat;
    });
  }

  @override
  void initState() {
    loadWorld();
    loadData();
    super.initState();
  }

//  void searchCountry(String country) {
//    searchResult.countriesStat.clear();
//    for(int i=0;i<currentStat.countriesStat.length;i++){
//      var data= currentStat.countriesStat[i];
//      if(data.countryName.toLowerCase().contains(country)){
//        searchResult.countriesStat.add(data);
//      }
//    }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f3f4),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              backgroundColor: Color(0xfff2f3f4),
              middle: Text("CoronaVirus World Statistics"),
              largeTitle: Text("Countries"),
              leading: IconButton(
                  icon: Icon(
                    CupertinoIcons.refresh_thick,
                    color: CupertinoColors.activeBlue,
                  ),
                  onPressed: () {
                    loadData();
                  }),
              trailing: IconButton(
                  icon: Icon(
                    CupertinoIcons.search,
                    color: CupertinoColors.activeBlue,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SearchPage(
                              list: worldStat.countriesStat,
                            )));
                  }),
            ),
           world!=null? SliverToBoxAdapter(
              child: ExpansionTile(
                title: Text(
                  "Last updated on",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("  " + worldStat.statisticTakenAt,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300,color: Colors.blueGrey)
                ),
                children: <Widget>[
                  description("Total cases", world.totalCases),
                  description("Total Deaths", world.totalDeaths),
                  description("Total Recovered", world.totalRecovered),

                ],
              ),
            ):SliverToBoxAdapter(),
            currentStat != null
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                    (context, index) => listBar(index, currentStat),
                    childCount: currentStat.countriesStat.length,
                  ))
                : SliverToBoxAdapter(
                    child: Center(child: CupertinoActivityIndicator())),

            // FutureBuilder(
            //     //future: getStat(),
            //     builder: (context, snapshot) {
            //   if (snapshot.hasData) {
            //     worldStat = snapshot.data;
            //     currentStat = worldStat;
            //     max = int.parse(worldStat.countriesStat[0].cases
            //             .replaceAll(RegExp(r','), "")) +
            //         10000;
            //     // createData();
            //     return SliverList(
            //         delegate: SliverChildBuilderDelegate(
            //       (context, index) => listBar(index, currentStat),
            //       childCount: currentStat.countriesStat.length,
            //     ));
            //     // ,) ListView.builder(
            //     //     shrinkWrap: true,
            //     //     itemCount: worldStat.countriesStat.length,
            //     //     itemBuilder: (context, index) => listBar(index));
            //   } else
            //     return SliverToBoxAdapter(
            //         child: Center(child: CupertinoActivityIndicator()));
            // })
          ],
        ),
      ),
    );
  }

  Widget description(String title, String value) => Container(
        color: Color(0xfff2f3f4),
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
  Widget listBar(int index, WorldStat worldStat) {
    double wpercent = int.parse(
            worldStat.countriesStat[index].cases.replaceAll(RegExp(r','), "")) /
        max;
    return ExpansionTile(
      backgroundColor: Color(0xfff2f3f4),
      title: Container(
        color: Color(0xfff2f3f4),
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
                  "${worldStat.countriesStat[index].countryName}: ${worldStat.countriesStat[index].cases}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
      children: <Widget>[
        description("Country", worldStat.countriesStat[index].countryName),
        description("Cases", worldStat.countriesStat[index].cases),
        description("Deaths", worldStat.countriesStat[index].deaths),
        description(
            "Total Recovered", worldStat.countriesStat[index].totalRecovered),
        description("active Cases", worldStat.countriesStat[index].activeCases)
      ],
    );
  }
}
