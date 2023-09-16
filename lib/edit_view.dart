// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cv_appication_s2/widget/button.dart';
import 'package:cv_appication_s2/widget/textfoeld.dart';

class EditView extends StatefulWidget {
   late final CVdata? initialData;
  EditView({
    Key? key,
     this.initialData,
  }) : super(key: key);

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  final TextEditingController fullNameControl = TextEditingController();
  final TextEditingController slackNameControl = TextEditingController();
  final TextEditingController githubNameControl = TextEditingController();
  final TextEditingController personalBioControl = TextEditingController();

@override
void initState() {
  super.initState();
  if (widget.initialData != null) {
    fullNameControl.text = widget.initialData!.fullN ?? '';
    slackNameControl.text = widget.initialData!.slackN ?? '';
    githubNameControl.text = widget.initialData!.gitN ?? '';
    personalBioControl.text = widget.initialData!.desc ?? '';
  }
}


  void submitData() {
    final data = CVdata(
      fullN: fullNameControl.text,
      slackN: slackNameControl.text,
      gitN: githubNameControl.text,
      desc: personalBioControl.text,
    );
    Navigator.pop(context, data);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: Text(
          'Edit CV',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: const Color.fromARGB(255, 88, 70, 14)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            RTextFieldWidget(
              label: 'Full name',
              textEditingController: fullNameControl,
              // onChanged: (val) {
              //   updateName(val);
              // },
            ),
            const SizedBox(
              height: 20,
            ),
            RTextFieldWidget(
              label: 'Slack Username',
              textEditingController: slackNameControl,
            ),
            const SizedBox(
              height: 20,
            ),
            RTextFieldWidget(
              label: 'Github Handle',
              textEditingController: githubNameControl,
            ),
            const SizedBox(
              height: 20,
            ),
            RTextFieldWidget(
              label: 'Personal Edit',
              textEditingController: personalBioControl,
            ),
            const SizedBox(
              height: 40,
            ),
            RButtonWidget(
                onTap: () {
                   setState(() {
                     submitData();
                   });
                  
                
                },
                label: 'Submit')
          ],
        ),
      ),
    );
  }
}

class CVdata {
  String? fullN;
  String? slackN;
  String? gitN;
  String? desc;
  CVdata({
     this.fullN,
     this.slackN,
     this.gitN,
     this.desc,
  });
}
