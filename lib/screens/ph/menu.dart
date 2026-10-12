import 'package:flutter/material.dart';

class PhMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              children: [
                Text(
                  "Select your Item",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                    "choose your item lsfnkjsdnfsdvldsjfdslj dskfjlsdnksj ;ksmlvjdsnkvbrso lvj;ndjv dj ksfjsd kf ksj f ksf s;fksksfjksfkjsn ojafkjeasfkknfn jn ojano "),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 160,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/img/auto.png",
                          width: 140,
                          height: 140,
                        ),
                      ),
                      const Text("Auto"),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 160,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/img/mic.png",
                          width: 140,
                          height: 140,
                        ),
                      ),
                      const Text("Manual"),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Text(
                "sljnsdjlnvdsl lvsldj  lf l lvsl n lm flssljnsdjlnvdsl lvsldj  lf l lvsl n lm flssljnsdjlnvdsl lvsldj  lf l lvsl n lm flssljnsdjlnvdsl lvsldj  lf l lvsl n lm fls"),
            ElevatedButton(onPressed: () {}, child: const Text("Next")),
            const Text("lsf l nkjl l jlfd l kjf")
          ],
        ),
      ),
    );
  }
}
