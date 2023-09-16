
import 'package:flutter/material.dart';

class RButtonWidget extends StatelessWidget {
 
 final VoidCallback onTap;
 final String label;
  const RButtonWidget({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        )),
      ),
    );
  }
}