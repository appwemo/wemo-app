import 'package:etiocart/constants/theme_data.dart';
import 'package:etiocart/mobile/model/ad_companies_model.dart';
import 'package:etiocart/repository/advertizement_co_servics.dart';
import 'package:flutter/material.dart';

class CopyMomentsPage extends StatelessWidget {
  const CopyMomentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<List<AdvertizementCompanies>> _fetchAd =
        AdCompanieServics().fetchAd();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: StylingData.bgColor,
        foregroundColor: StylingData.frColor,
      ),
      body: FutureBuilder<List<AdvertizementCompanies>>(
          future: _fetchAd,
          builder: (context, snpashot) {
            if (snpashot.hasData) {
              return Container(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snpashot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.grey[300],
                          height: 200,
                          width: 300,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    color: Colors.grey[100],
                                    height: 100,
                                    width: 180,
                                    child: Center(
                                        child: Text(
                                            "This is test Ad Companies, not Ad"))),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("${snpashot.data![index].name}")
                              ]),
                        ),
                      );
                    }),
              );
            }
            if (snpashot.hasError) {
              return Center(
                child: Text('some error ${snpashot.error}'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
