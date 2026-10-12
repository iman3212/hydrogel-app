import 'package:flutter/material.dart';
import 'package:hydrogel/globalwidgets/dialog/quality-image-dialog.dart';

class ContentStack extends StatelessWidget {
  final int? length;
  final List<dynamic> info;
  final bool isFirstTime;
  final int? choosIndex;
  final List<dynamic> phinfo;
  bool isLoading;

   ContentStack({
    super.key,
   required this.length,
    required this.info,
    required this.isLoading,
    required this.isFirstTime,
    this.choosIndex, required this.phinfo,
  });
  final String baseUrl = 'http://ai-server.hitechprojects.ir:8000';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isFirstTime && length == null)
          Center(
            child: CircularProgressIndicator(
              color: Colors.blue, // Adjust color as needed
            ),
          ),
        if (length != null)
          ListView.builder(
            itemCount: length,
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.all(1.5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      "$baseUrl${info[index].image}",
                                      height: 80,
                                      width:
                                          80, // Set the same height as the container
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => ImageDialog(
                                      pic: info[index].image!.path,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Icon(Icons.lock_clock,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Time: ${info[index].date.toString().split(":").first}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ],
                                  ),
                                  if (info == phinfo)
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.numbers_rounded,
                                              color: Colors
                                                  .blue, // Adjust color as needed
                                            ),
                                            const Text("ph number : "),
                                            Text("${info[index].phResult}")
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.ad_units,
                                            ),
                                            Text(
                                                "acidic : 0 <ph < 3  , alicily : 4 < ph < 7"),
                                          ],
                                        )
                                      ],
                                    )
                                  else
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "continuity  ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Text(
                                              "${info[index].continuityResult}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("wavy  ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall),
                                            Text(
                                                "${info[index].distortionResult}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("length  ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall),
                                            Text(
                                              "${info[index].width}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: Colors
                                                          .blue), // Adjust color as needed
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("height  ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall),
                                            Text(
                                              "${info[index].height}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: Colors
                                                          .blue), // Adjust color as needed
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (index == length! - 1 && isLoading)
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CircularProgressIndicator(
                        color: Colors.blue, // Adjust color as needed
                      ),
                    ),
                ],
              );
            },
          ),
      ],
    );
  }
}

// Stack content(lenght, info) {
//     return Stack(children: [
//       if (isFirstTime && lenght == null)
//         const SpinKitThreeBounce(
//           color: LightThemeColor.primaryColor,
//           size: 40,
//         ),
//       if (lenght != null)
//         ListView.builder(
//            controller: scrollController,
//           // padding: const EdgeInsets.all(6),
//           itemCount: lenght,
//           shrinkWrap: true,
//           physics: const AlwaysScrollableScrollPhysics(),
//           scrollDirection: Axis.vertical,
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 InkWell(
//                     onTap: () {},
//                     child: Container(
//                         clipBehavior: Clip.hardEdge,
//                         margin: const EdgeInsets.symmetric(vertical: 6),
//                         height: 140,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.grey.shade100,
//                           // boxShadow: [
//                           //   BoxShadow(
//                           //     color: Colors.grey.shade300,
//                           //     blurRadius: 4,
//                           //   ),
//                           // ],
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 4, horizontal: 8),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(20)),
//                                   child: GestureDetector(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(1.5),
//                                       child: ClipRRect(
//                                         borderRadius: BorderRadius.circular(15),
//                                         child: Image.network(
//                                           "$baseUrl${info[index].image}",
//                                           height: 80,
//                                           width:
//                                               80, // Set the same height as the container
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),
//                                     onTap: () {
//                                       showDialog(
//                                         context: context,
//                                         builder: (_) => ImageDialog(
//                                           pic: info[index].image!.path,
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 30,
//                                 ),
//                                 Expanded(
//                                   flex: 2,
//                                   child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Container(
//                                                 decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             20),
//                                                     color:
//                                                         Colors.grey.shade200),
//                                                 child: const Padding(
//                                                   padding: EdgeInsets.all(8),
//                                                   child: Icon(Icons.lock_clock,
//                                                       color: Colors.grey),
//                                                 )),
//                                             const SizedBox(
//                                               width: 5,
//                                             ),
//                                             Text(
//                                               "Time: ${info[index].date.toString().split(":").first}",
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .titleMedium,
//                                             ),
//                                           ],
//                                         ),
//                                         info == phInformation
//                                             ? Column(
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       const Icon(
//                                                         Icons.numbers_rounded,
//                                                         color: LightThemeColor
//                                                             .primaryColor,
//                                                       ),
//                                                       const Text(
//                                                           "ph number : "),
//                                                       Text(
//                                                           "${info[index].phResult}")
//                                                     ],
//                                                   ),
//                                                   const Row(
//                                                     children: [
//                                                       Icon(
//                                                         Icons.ad_units,
//                                                       ),
//                                                       Text(
//                                                           "acidic : 0 <ph < 3  , alicily : 4 < ph < 7"),
//                                                     ],
//                                                   )
//                                                 ],
//                                               )
//                                             : Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Text(
//                                                           "continuity  ",
//                                                           style:
//                                                               Theme.of(context)
//                                                                   .textTheme
//                                                                   .titleSmall,
//                                                         ),
//                                                         Text(
//                                                             "${info[index].continuityResult}",
//                                                             style: Theme.of(
//                                                                     context)
//                                                                 .textTheme
//                                                                 .titleSmall),
//                                                       ],
//                                                     ),
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Text("wavy  ",
//                                                             style: Theme.of(
//                                                                     context)
//                                                                 .textTheme
//                                                                 .titleSmall),
//                                                         Text(
//                                                             "${info[index].distortionResult}",
//                                                             style: Theme.of(
//                                                                     context)
//                                                                 .textTheme
//                                                                 .titleSmall),
//                                                       ],
//                                                     ),
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Text("length  ",
//                                                             style: Theme.of(
//                                                                     context)
//                                                                 .textTheme
//                                                                 .titleSmall),
//                                                         Text(
//                                                             "${info[index].width}",
//                                                             style: Theme.of(
//                                                                     context)
//                                                                 .textTheme
//                                                                 .titleSmall!
//                                                                 .copyWith(
//                                                                     color: LightThemeColor
//                                                                         .primaryColor)),
//                                                       ],
//                                                     ),
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Text("height  ",
//                                                             style: Theme.of(
//                                                                     context)
//                                                                 .textTheme
//                                                                 .titleSmall),
//                                                         Text(
//                                                             "${info[index].height}",
//                                                             style: Theme.of(
//                                                                     context)
//                                                                 .textTheme
//                                                                 .titleSmall!
//                                                                 .copyWith(
//                                                                     color: LightThemeColor
//                                                                         .primaryColor)),
//                                                       ],
//                                                     ),
//                                                     const SizedBox(
//                                                       height: 10,
//                                                     ),
//                                                   ])
//                                       ]),
//                                 ),
//                                 const SizedBox(
//                                   width: 8,
//                                 ),
//                               ]),
//                         ))),
//                 if (index == lenght! - 1 && isLoading)
//                   const Padding(
//                     padding: EdgeInsets.all(10.0),
//                     child: SpinKitThreeBounce(
//                       color: LightThemeColor.primaryColor,
//                       size: 40,
//                     ),
//                   )
//               ],
//             );
//           },
//         ),
//     ]);
//   }