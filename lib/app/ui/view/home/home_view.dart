import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:apmatik_app/app/core/constant/color_constants.dart';
import 'package:apmatik_app/app/ui/style/text_style.dart';
import 'package:apmatik_app/app/ui/widgets/custom_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'home_controller.dart';

class HomeView extends BaseView<HomeController> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget vBuilder() => SafeArea(
          child: Scaffold(
        appBar: CustomAppBar(),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Text(
              'Avantajlarımız',
              style: AppTextStyle().getSfProDisplayRegular_H6(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: CarouselSlider(
              items: imgList
                  .map((item) => Stack(
                        children: [
                          Container(
                            width: 122,
                            height: 200,
                            child: Card(
                              elevation: 15,
                              shadowColor: Colors.transparent,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: ShaderMask(
                                shaderCallback: (rect) {
                                  return LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.transparent, Colors.black],
                                  ).createShader(Rect.fromLTRB(
                                      0, 0, rect.width, rect.height));
                                },
                                blendMode: BlendMode.darken,
                                child: Image.network(
                                  item,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ListTile(
                              title: Transform.translate(
                                offset: Offset(0, 5),
                                child: Text(
                                  'Kış Masalı',
                                  style: AppTextStyle()
                                      .getSfProDisplayMedium_H6(
                                          AppColors.WHITE),
                                ),
                              ),
                              subtitle: Text(
                                'Her zaman daha uygun bir kış için',
                                style: AppTextStyle()
                                    .getSfProDisplayLight_H6(AppColors.WHITE),
                              ),
                            ),
                          )
                        ],
                      ))
                  .toList(),
              // Card(
              //   semanticContainer: true,
              //   clipBehavior: Clip.antiAliasWithSaveLayer,
              //   child: Image.network(
              //     'https://placeimg.com/640/480/any',
              //     fit: BoxFit.fill,
              //   ),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10.0),
              //   ),
              //   elevation: 5,
              //   margin: EdgeInsets.all(10),
              // ),
              carouselController: _controller,
              options: CarouselOptions(
                  padEnds: false,
                  scrollPhysics: BouncingScrollPhysics(),
                  initialPage: 0,
                  viewportFraction: 0.3,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    _current = index;
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
          Divider(
            height: 20,
            thickness: 2.2,
            color: Colors.blueGrey.shade100,
          )
        ]),
      ));
}
