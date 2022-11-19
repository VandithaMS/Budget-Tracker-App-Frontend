import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  //const Chart({Key? key, required this.title}) : super(key: key);

  @override
  State<Chart> createState() => _Chart();
}

class _Chart extends State<Chart> {
  late List<GDPData> _cd;
  @override
  void initState(){
    _cd=getchart(GDPData('', 0));
    super.initState();
  }
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: Legend(isVisible: true,overflowMode: LegendItemOverflowMode.wrap),
      series: <CircularSeries>[
        DoughnutSeries<GDPData,String>(//pieSeries
          dataSource: _cd,
          xValueMapper: (GDPData data,_)=>data.category,
          yValueMapper: (GDPData data,_)=>data.rs,
          //dataLabelSettings: DataLabelSettings(isVisible: true)
        )
      ],
    );
  }}

final list = <String>["Food", "Shopping", "House", "Vehicle", "Entertainment", "Investment", "Other"];
final amt = <double>[0,0,0,0,0,0,0];
List<GDPData> getchart(GDPData x){
  final List<GDPData> datas=[];

  list.contains(x.category)?amt[list.indexWhere((element) => element==x.category)]+=x.rs:amt[6]+=x.rs;

  for (int i=0;i<list.length;i++){
    datas.add(GDPData(list[i], amt[i]));
  }

  return datas;
}

class GDPData{
  GDPData(this.category,this.rs);
  final String category;
  double rs;
}
