import 'package:covid_app/data/label_list.dart';
import 'package:covid_app/presentation/blocs/region_bloc/region_bloc.dart';
import 'package:covid_app/presentation/features/charts/graphs_list.dart';
import 'package:covid_app/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

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
        title: Text(
          widget.region,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacement(
              PageTransition(child: BeforeHomePage(), type: PageTransitionType.leftToRight)
          ),
        ),
      ),
      body: BlocBuilder<RegionBloc, RegionState>(
        builder: (context, state) {
          if (state is RegionDataLoadSuccess) {
            return _buildPage(state.data);
          } else if (state is RegionDataLoadErorr) {
            return _buildError();
          } else {
            return _buildProgress();
          }
        },
      ),
      //backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Widget _buildPage(Map<String, Map<DateTime, int>> convertedData) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _middleSection(convertedData),
            const SizedBox(height: 16),
            _graphicSection(convertedData),
          ],
        ),
      ),
    );
  }

  Widget _middleSection(Map<String, Map<DateTime, int>> convertedData) {

    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (List<String> l in LabelLists.card_labels) Column(
              children: <Widget>[
                Text(
                  "Totale ${l[0]}: ${convertedData[l[1]].values.last.toString()}",
                ),
                const SizedBox(height: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _graphicSection(Map<String, Map<DateTime, int>> convertedData) {
    return GraphsList(
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
