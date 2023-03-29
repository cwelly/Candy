import 'package:flutter/material.dart';

import 'package:candy/api/beer_api_service.dart';
import 'package:candy/models/beer/all_beer_list_model.dart';
import 'package:candy/widgets/my_page/beer_encyclopedia/beer_encyclopedia.dart';

class BeerGetList extends StatelessWidget {
  const BeerGetList({super.key});

  Future<List<AllBeerListModel>> beerlist() async {
    return await BeerApiService.getAllBeerList(email: 'ac@naver.com');
  }

  checkpercent(allbeer) {
    return 0.3;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: beerlist(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BeerEncyclopedia(
              beerlist: snapshot.data!,
              beerpercent: checkpercent(snapshot.data!),
            );
          }
          return const SizedBox();
        });
  }
}
