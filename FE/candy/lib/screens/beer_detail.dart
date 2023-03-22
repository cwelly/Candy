import 'package:candy/widgets/app_bar/beer_detail_app_bar.dart';
import 'package:candy/widgets/beer/beer_info.dart';
import 'package:candy/widgets/review/slide_bar.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class BeerDetail extends StatefulWidget {
  const BeerDetail({super.key});

  @override
  State<BeerDetail> createState() => _BeerDetailState();
}

class _BeerDetailState extends State<BeerDetail> {
  late double feshNum;
  late double bodyNum;
  late double tasteNum;

  @override
  void initState() {
    super.initState();
    feshNum = 0;
    bodyNum = 0;
    tasteNum = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BeerDetailAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const BeerInfo(
                    beerName: {'korean': '카스 프레시', 'english': 'Cass Fresh'},
                    beerImgSrc:
                        'https://justliquor.com.au/2735/cass-fresh-beer-can-355ml.jpg',
                    country: '한국',
                    brandName: '하이트진로',
                    alcoholLevel: 4.2,
                    beerType: '밀맥주',
                  ),
                  const Margin(marginType: MarginType.height, size: 16),
                  Container(
                    child: Column(
                      children: [
                        const SlideBar(
                          sliderCategory: '청량감',
                          sliderValue: 0,
                          readOnly: true,
                        ),
                        const Margin(marginType: MarginType.height, size: 16),
                        SlideBar(
                          sliderCategory: '바디감',
                          sliderValue: bodyNum,
                          readOnly: true,
                        ),
                        const Margin(marginType: MarginType.height, size: 16),
                        SlideBar(
                          sliderCategory: '맛',
                          sliderValue: tasteNum,
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}