
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RTextFieldWidget extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final String? initialValue;
  final Function()? onTap;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Function? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final TextInputFormatter? formatter;
  final bool? isEnabled;
  final int? maxLength;
  const RTextFieldWidget({
    Key? key,
    required this.label,
    this.prefixIcon,
    this.maxLength,
    this.initialValue,
    this.onTap,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.onChanged,
    this.formatter,
    this.validator,
    this.textEditingController,
    this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w900,
              
        ),),
       const SizedBox(height: 2.0),
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: SizedBox(
       
            child: Material(
              elevation: 0,
              shadowColor: Colors.black.withOpacity(0.4),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: TextFormField(
                initialValue: initialValue,
                autovalidateMode: AutovalidateMode.always,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                enabled: isEnabled,
                onTap: onTap,
                // maxLength: maxLength,
                controller: textEditingController!,
                cursorColor: Colors.amber,
                cursorWidth: 0.7,
                keyboardType: keyboardType,
                obscureText: obscureText ?? false,
                onChanged: (text) {
                  if (onChanged != null) onChanged!(text);
                },
                validator: validator,
                inputFormatters: [
                  formatter ?? FilteringTextInputFormatter.singleLineFormatter
                ],
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                    hintText: hintText,
                    contentPadding: const EdgeInsets.only(
                      left: 15.0,
                      top: 19.0,
                    ),
                
                    suffixIcon: suffixIcon,
                    disabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.amber, width: 0.8),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.8),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.amber, width: 0.8),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.amber, width: 0.8),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)))),
              ),
            ),
          ),
        )
      ],
    );
  }
}