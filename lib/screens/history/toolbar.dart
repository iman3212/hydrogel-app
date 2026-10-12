import 'package:flutter/material.dart';

class ToolbarItem extends StatelessWidget {
  final int index;
  final Color color;
  final String headline;
  final String image;
  final Function(int) onSelect;
  final int choosIndex;

  const ToolbarItem({
    super.key,
    required this.index,
    required this.color,
    required this.headline,
    required this.image,
    required this.onSelect,
    required this.choosIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect(index);
      },
      child: Column(
        children: [
          Container(
            width: 110,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color:choosIndex==index? const Color.fromARGB(255, 2, 71, 186):Colors.white,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    width: 35,
                    height: 35,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    headline,
                    style: TextStyle(
                      color: choosIndex == index ? color : Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
