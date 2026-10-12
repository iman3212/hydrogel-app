import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hydrogel/globalwidgets/connection/noInternet.dart';
import 'package:hydrogel/screens/history/content.dart';
import 'package:hydrogel/screens/history/chart.dart';
import 'package:hydrogel/screens/history/toolbar.dart';
import 'package:hydrogel/services/model/history_model.dart';
import 'package:hydrogel/services/network.dart';
import 'package:hydrogel/theme/colors.dart';

//............statefull historylist..............................

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final ScrollController scrollController = ScrollController();

  List<Results> phInformation = <Results>[];
  List<QcResults> qcInformation = <QcResults>[];
  List<ResultsContainer> allInformation = <ResultsContainer>[];

  bool isConnected = true; // Assume initially connected
  int? phLenght;
  int? qcLenght;
  int? allLenght;

  int currentPage = 1;
  bool isLoading = false;
  bool isFirstTime = true;
  int pageNumber = 10;
  bool isFetchingData = false;
  int choosIndex = 1;
  int len = 0;

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  Future<void> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      isConnected = connectivityResult != ConnectivityResult.none;
    });
    if (isConnected) {
      if (choosIndex == 0) {
        phHistory();
        scrollController.addListener(loadMoreData);
      } else if (choosIndex == 1) {
        QcHistory();
        scrollController.addListener(loadMoreData);
      } else if (choosIndex == 2) {
        allHistory();
        scrollController.addListener(loadMoreData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: isConnected
            ? buildContent()
            : NoInternetScreen(
                onRetry: () {
                  checkInternetConnection();
                },
              ),
      ),
    );
  }

  Widget buildContent() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 0, 31, 97)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "History page",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Collection of your activity",
                      style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const Text(
                      "sorted based on time and date",
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 2, 71, 186),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "chart analyze",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      VerticalDivider(
                        endIndent: 2,
                        thickness: 2,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          Text(
                            "history card",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                height: MediaQuery.of(context).size.height * 0.84,
                width: MediaQuery.of(context).size.width,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Testpage(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ToolbarItem(
                            index: 1,
                            color: const Color.fromARGB(255, 2, 71, 186),
                            headline: 'All',
                            onSelect: selectIndex,
                            image: "assets/img/all.png",
                            choosIndex: choosIndex,
                          ),
                          ToolbarItem(
                            index: 0,
                            color: LightThemeColor.primaryColor,
                            headline: 'PH',
                            onSelect: selectIndex,
                            image: "assets/img/ph.png",
                            choosIndex: choosIndex,
                          ),
                          ToolbarItem(
                            index: 2,
                            color: const Color.fromARGB(255, 11, 142, 255),
                            headline: 'QC',
                            onSelect: selectIndex,
                            image: "assets/img/qc.png",
                            choosIndex: choosIndex,
                          ),
                        ],
                      ),
                      if (len == 1)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "You dont have a active history yet",
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "start your first activity",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              Image.asset("assets/img/history.jpg"),
                            ],
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 15),
                          child: Expanded(
                            child: choosIndex == 0
                                ? ContentStack(
                                    info: phInformation,
                                    isLoading: isLoading,
                                    isFirstTime: isFirstTime,
                                    phinfo: phInformation,
                                    length: phLenght,
                                  )
                                : ContentStack(
                                    info: qcInformation,
                                    isLoading: isLoading,
                                    isFirstTime: isFirstTime,
                                    phinfo: phInformation,
                                    length: qcLenght,
                                  ),
                          ),
                        )
                    ],
                  ),
                ))
          ],
        ),
      ],
    );
  }



  void loadMoreData() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        currentPage <= pageNumber) {
      if (choosIndex == 0) {
        phHistory();
      } else if (choosIndex == 1) {
        QcHistory();
      }
    }
  }

  Future<void> phHistory() async {
    try {
      if (isFetchingData) {
        return; // Return early if data fetching is already in progress
      }
      isFetchingData = true;

      setState(() {
        isLoading = true;
      });

      final response = await NetworkService()
          .get("history/api/ph/history/list?page=$currentPage");
      if (response?.statusCode == 200 && response != null) {
        final data = PhHistoryParsing.fromJson(response.data);
        final newItems = data.results;
        final count = data.count!;
        pageNumber = (count + 1) ~/ 2;
        currentPage = currentPage + 1;
        setState(() {
          isFirstTime = false;
          isLoading = false;
          phInformation.addAll(newItems);
          phLenght = phInformation.length;
        });
      }
    } catch (e) {
      print(e);
    } finally {
      isFetchingData = false; // Reset the flag after data fetching is complete
    }
  }

  Future<void> QcHistory() async {
    try {
      if (isFetchingData) {
        return;
      }
      isFetchingData = true;

      setState(() {
        isLoading = true;
      });

      final response = await NetworkService()
          .get("history/api/quality/history/list?page=$currentPage");
      if (response?.statusCode == 200 && response != null) {
        final data = QcHistoryParsing.fromJson(response.data);
        final newItems = data.results;
        final count = data.count!;
        pageNumber = (count + 1) ~/ 2;
        currentPage = currentPage + 1;

        setState(() {
          isFirstTime = false;
          isLoading = false;
          qcInformation.addAll(newItems);
          //important
          //I change qclenght and it should be qcInformation.length
          qcLenght = qcInformation.length;
        });
      }
    } catch (e) {
      print(e);
    } finally {
      isFetchingData = false;
    }
  }

  void selectIndex(int index) {
    setState(() {
      choosIndex = index;
      currentPage = 1;
      if (index == 0) {
        phHistory();
      } else if (index == 1) {
        QcHistory();
      } else if (index == 2) {}
    });
  }

  Future<void> allHistory() async {
    try {
      if (isFetchingData) {
        return; // Return early if data fetching is already in progress
      }
      isFetchingData = true;

      setState(() {
        isLoading = true;
      });

      final response = await NetworkService()
          .get("history/api/all/history/list?page=$currentPage");
      if (response?.statusCode == 200 && response != null) {
        final data = AllHistoryParsing.fromJson(response.data);
        final newItems = data.results;
        final count = data.count!;
        pageNumber = (count + 1) ~/ 2;
        currentPage = currentPage + 1;
        setState(() {
          isFirstTime = false;
          isLoading = false;
          // allInformation.addAll(newItems);
          allLenght = allInformation.length;
        });
      }
    } catch (e) {
      print(e);
    } finally {
      isFetchingData = false; // Reset the flag after data fetching is complete
    }
  }
}

//.............................................................
