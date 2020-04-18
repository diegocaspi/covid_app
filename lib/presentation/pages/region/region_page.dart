import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/presentation/blocs/region_bloc/region_bloc.dart';
import 'package:covid_app/presentation/pages/region/region_graphs_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionPage extends StatefulWidget {
  //the region that we have to see data
  final String region;

  //constructor
  RegionPage({
    @required this.region,
  });

  @override
  _RegionPageState createState() => _RegionPageState();
}

class _RegionPageState extends State<RegionPage> {
  @override
  void initState() {
    BlocProvider.of<RegionBloc>(context)
        .add(GetRegionData(region: widget.region));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.region),
      ),
      body: BlocBuilder<RegionBloc, RegionState>(
        builder: (context, state) {
          if (state is RegionDataLoadSuccess) {
            return _buildPage(state.data, state.dataList);
          } else if (state is RegionDataLoadErorr) {
            return _buildError();
          } else {
            return _buildProgress();
          }
        },
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildPage(Map<DateTime, List<CovidData>> map, List<CovidData> data) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _middleSection(data),
            SizedBox(
              height: 16,
            ),
            _graphicSection(map),
          ],
        ),
      ),
    );
  }

  Widget _middleSection(List<CovidData> datas) {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Totale deceduti: " +
                  datas.elementAt(datas.length - 1).deceduti.toString(),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Totale attualmente positivi: " +
                  datas.elementAt(datas.length - 1).totPositivi.toString(),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Totale dimessi: " +
                  datas.elementAt(datas.length - 1).dimessiGuariti.toString(),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Totale terapia intensiva: " +
                  datas.elementAt(datas.length - 1).terapiaIntensiva.toString(),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Totale nuovi contagiati di oggi: " +
                  datas.elementAt(datas.length - 1).nuoviPositivi.toString(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _graphicSection(Map<DateTime, List<CovidData>> convertedData) {
    return RegionGraphsList(
      convertedData: convertedData,
    );
  }

  Widget _buildProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError() {
    return Center(
      child: Icon(Icons.error),
    );
  }
}
