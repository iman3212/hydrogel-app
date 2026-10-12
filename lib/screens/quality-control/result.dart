import 'dart:io';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hydrogel/constant/padding.dart';
import 'package:hydrogel/globalwidgets/cards/control-result/control-result.dart';
import 'package:hydrogel/globalwidgets/dialog/quality-image-dialog.dart';
import 'package:hydrogel/screens/quality-control/controller.dart';
import 'package:hydrogel/theme/colors.dart';
import 'package:mrx_charts/mrx_charts.dart';

class PricePoint {
  final double x;
  final double y;

  PricePoint({required this.x, required this.y});
}

class QualityControlResult extends StatefulWidget {
  const QualityControlResult({
    super.key,
    required this.points,
  });

  final List<PricePoint> points;

  @override
  State<QualityControlResult> createState() => _BarChartWidgetState(points);
}

class _BarChartWidgetState extends State<QualityControlResult> {
  final List<PricePoint> points;
  final QcController controller = Get.put(QcController());

  _BarChartWidgetState(this.points);

  File? resultImage;
  Size size = Get.size;

  @override
  void initState() {
    resultImage = Get.arguments[0] as File;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
        future: controller.setResult(resultImage),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SpinKitThreeBounce(
              color: LightThemeColor.primaryColor,
              size: 40,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: ConstVariable.appSymmetricPadding,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                               
                                
                                Text(
                                  "AI base analysis results",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SearchBar(
                            leading: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search_rounded,
                                color: Color.fromARGB(255, 117, 116, 116),
                              ),
                            ),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey.shade100),
                            overlayColor: const MaterialStatePropertyAll(
                                Color.fromARGB(255, 201, 239, 241)),
                            constraints: const BoxConstraints(
                                minWidth: 325.0,
                                maxWidth: 370.0,
                                minHeight: 30.0,
                                maxHeight: 43),
                            elevation: const MaterialStatePropertyAll(0),
                            hintText: 'search',
                            hintStyle: MaterialStateProperty.all(
                                TextStyle(color: Colors.grey.shade600)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Here you can see features \nof Bio Ink as determined \nby artificial intelligence",
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (resultImage != null) {
                                    await showDialog(
                                      context: context,
                                      builder: (_) => ImageDialog(
                                        pic: resultImage!.path,
                                      ),
                                    );
                                  }
                                },
                                child: resultImage != null
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.file(
                                            resultImage!,
                                            width: 141,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          "assets/img/jel.jpg",
                                          width: 80,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              ControlResult(
                                pic: 'assets/img/wavy.png',
                                title: 'Wavy',
                                text: 'bioink wavy',
                                result: controller.wave ?? "",
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ControlResult(
                                pic: 'assets/img/height.png',
                                title: 'Height',
                                text: 'height of ink',
                                result: controller.height!.toStringAsFixed(2),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              ControlResult(
                                pic: 'assets/img/width.png',
                                title: 'Width',
                                text: 'width of ink',
                                result: controller.width!.toStringAsFixed(2),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ControlResult(
                                  pic: "assets/img/continuity.png",
                                  title: "Continuity",
                                  text: "fragment",
                                  result: controller.continuity ?? "")
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "OverView",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                          Icon(Icons.download)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: SizedBox(
                        width: 350,
                        height: 250,
                        child: Chart(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 12.0),
                          layers: [
                            ChartAxisLayer(
                              settings: ChartAxisSettings(
                                x: ChartAxisSettingsAxis(
                                  frequency: 1.0,
                                  max: 13.0,
                                  min: 7.0,
                                  textStyle: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 10.0,
                                  ),
                                ),
                                y: ChartAxisSettingsAxis(
                                  frequency: 100.0,
                                  max: 300.0,
                                  min: 0.0,
                                  textStyle: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                              labelX: (value) => value.toInt().toString(),
                              labelY: (value) => value.toInt().toString(),
                            ),
                            ChartBarLayer(
                              items: List.generate(
                                13 - 7 + 1,
                                (index) => ChartBarDataItem(
                                  color: const Color(0xFF4157FF),
                                  value: Random().nextInt(280) + 20,
                                  x: index.toDouble() + 7,
                                ),
                              ),
                              settings: const ChartBarSettings(
                                thickness: 10.0,
                                radius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            );
          }
        },
      )),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    return points
        .map((point) => BarChartGroupData(
            x: point.x.toInt(), barRods: [BarChartRodData(toY: point.y)]))
        .toList();
  }
}
