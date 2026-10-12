import 'package:hydrogel/exports/ex.-core.dart';

class ControllButton extends StatelessWidget {
  ControllButton(
      {super.key, required this.direction, required this.onTap, this.color});
  void Function()? onTap;
  IconData direction;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            //boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)],
            color: color ?? Colors.black,
            borderRadius: BorderRadius.circular(30)),
        child: Icon(
          direction,
          color: Colors.white,
        ),
      ),
    );
  }
}