import 'dart:ui' as ui;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/theme/button.dart';
import 'package:hydrogel/theme/colors.dart';
import 'controller.dart';

class Gcode extends StatefulWidget {
  const Gcode({super.key});

  @override
  State<Gcode> createState() => _GcodeState();
}

class _GcodeState extends State<Gcode> {
  GcodeController controller = Get.put(GcodeController());

  PlatformFile? file;
  FileType myfiletype = FileType.any;
  TextEditingController textcontroller = TextEditingController(text: 'gcode');
  List<String> extensiontype = ['gcode'];

  Future<void> pickSingleFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: myfiletype,
    );
    if (result != null) {
      String? pickedExtension = result.files.first.extension;
      if (pickedExtension != null && pickedExtension.toLowerCase() == 'gcode') {
        // The selected file has the correct extension

        setState(() {
          file = result.files.first;
        });
      } else {
        setState(() {
          Get.snackbar(
            "Warning",
            "Unsupported file type. Please select a .gcode format file.",
            colorText: Colors.white,
            icon: const Icon(
              Icons.warning,
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please upload your Gcode file ",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                  Text(
                    "upload from manager",
                    style: TextStyle(
                        color: LightThemeColor.primaryColor, fontSize: 14),
                  ),
                  const Text(
                    "Do not worry your data will stay safe and private",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Image.asset("assets/img/upload.jpg"),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const ui.Color.fromARGB(255, 245, 244, 244),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: LightThemeColor.primaryColor, width: 3)),
                child: file != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.picture_as_pdf),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Selected file',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(file!.name)
                        ],
                      )
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_outlined,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Select file",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
              ),

              //  const Spacer(),
              Column(
                children: [
                  Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 11, 142, 255),
                          Color.fromARGB(255, 2, 71, 186),
                          Color.fromARGB(255, 0, 31, 97),
                        ])),
                    child: ElevatedButton(
                      onPressed: () {
                        pickSingleFile();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "File Manager",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        print(file);
                        print(file is String);
                        controller.gcode(file);
                      },
                      style: ButtonStyles().thirdButton,
                      child: Text(
                        "Upload",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: LightThemeColor.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
