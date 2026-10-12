import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hydrogel/screens/menu/controller.dart';
import 'package:hydrogel/theme/colors.dart';

class HistoryWidget extends StatelessWidget {
  final MenuPageController controller;

  const HistoryWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    const String baseUrl = 'http://ai-server.hitechprojects.ir:8000';

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Obx(() {
        if (controller.qcInformation.isEmpty) {
          return const Center(
            child: SpinKitThreeBounce(
              color: LightThemeColor.primaryColor,
              size: 25,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.qcInformation.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade200),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 3,
                              offset: const Offset(0, 2))
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    // margin: const EdgeInsets.only(bottom: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Quality Control Assurance",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "$baseUrl${controller.qcInformation[index].image}",
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit
                                      .cover, // Set the same height as the container
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.grey.shade200),
                                          child: const Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Icon(
                                              Icons.lock_clock,
                                              size: 20,
                                            ),
                                          )),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        " ${controller.qcInformation[index].date.toString().split(":").first}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Continuity  ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: Colors.grey.shade600,
                                            ),
                                      ),
                                      Text(
                                          "(${controller.qcInformation[index].continuityResult})",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: LightThemeColor
                                                      .primaryColor)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("wavy  ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: Colors.grey.shade600,
                                              )),
                                      Text(
                                          "(${controller.qcInformation[index].distortionResult})",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: LightThemeColor
                                                      .primaryColor)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Length  ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: Colors.grey.shade600,
                                              )),
                                      Text(
                                          "${controller.qcInformation[index].width}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: LightThemeColor
                                                      .primaryColor)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Height  ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: Colors.grey.shade600,
                                              )),
                                      Text(
                                          "${controller.qcInformation[index].height}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: LightThemeColor
                                                      .primaryColor)),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              );
            },
          );
        }
      }),
    );
  }
}
