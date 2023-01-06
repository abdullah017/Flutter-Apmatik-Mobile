import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/view/troubles/detail_troubles/detail_troubles_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class DetailTroublesView extends BaseView<DetailTroublesController> {
  DetailTroublesView({Key? key}) : super(key: key, appBarHide: false);

  @override
  Widget vBuilder() {
    List<_TimelineStatus> data = [
      _TimelineStatus.done,
      _TimelineStatus.inProgress,
      _TimelineStatus.inProgress,
      _TimelineStatus.todo
    ];
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Timeline.tileBuilder(
              physics: const NeverScrollableScrollPhysics(),
              theme: TimelineThemeData(
                nodePosition: 0.050,
                connectorTheme: const ConnectorThemeData(
                  thickness: 3.0,
                  color: Color(0xffd3d3d3),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              builder: TimelineTileBuilder.connected(
                contentsBuilder: (_, __) => Container(
                    // margin: const EdgeInsets.only(left: 1.0),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(2.0),
                    //   color: const Color(0xffe6e7e9),
                    // ),
                    child: ListTile(
                  dense: true,
                  title: Text('Arıza Oluşturuldu'),
                  subtitle: Text('12/02/2022'),
                )),
                connectorBuilder: (_, index, __) {
                  return const SolidLineConnector(
                    color: Colors.orange,
                    thickness: 0.5,
                  );
                  // if (index == 0) {
                  //   return SolidLineConnector(color: Color(0xff6ad192));
                  // } else {
                  //   return SolidLineConnector();
                  // }
                },
                indicatorBuilder: (_, index) {
                  switch (data[index]) {
                    case _TimelineStatus.done:
                      return buildContainerIndicator(index);
                    case _TimelineStatus.sync:
                      return buildContainerIndicator(index);

                    case _TimelineStatus.inProgress:
                      return buildContainerIndicator(index);
                    case _TimelineStatus.todo:
                    default:
                      return buildContainerIndicator(index);
                  }
                },
                itemExtentBuilder: (_, __) => 50,
                itemCount: data.length,
              ),
            ),
          ),
          CustomElevatedButton(
            width: 350,
            height: 40,
            onPressed: () {},
            child: const Text(
              'Tamamlandı',
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Arızayı İptal Et',
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.RED),
              ),
            ),
          )
        ],
      )),
    );
  }

  ContainerIndicator buildContainerIndicator(index) {
    return ContainerIndicator(
      child: Container(
        width: 25,
        height: 25,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(5)),
        child: Text(
          index.toString(),
          style: appTextStyle.getSfProDisplayRegular_H5(
            AppColors.WHITE,
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBoxHeight10() {
    return const SizedBox(
      height: 10,
    );
  }
}

class _EmptyContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      height: 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: const Color(0xffe6e7e9),
      ),
    );
  }
}

enum _TimelineStatus {
  done,
  sync,
  inProgress,
  todo,
}

extension on _TimelineStatus {
  bool get isInProgress => this == _TimelineStatus.inProgress;
}
