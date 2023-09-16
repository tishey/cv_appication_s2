
import 'package:flutter/material.dart';

class RDataWidget extends StatelessWidget {
 final  String leading;
 final String title;
 const RDataWidget({
    Key? key,
    required this.leading,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(2, 9),
                blurRadius: 12,
                spreadRadius: 1)
          ]),
      child: ListTile(
        leading: Text(leading),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
    );
  }
}
