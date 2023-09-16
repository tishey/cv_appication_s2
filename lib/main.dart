import 'package:flutter/material.dart';

import 'package:cv_appication_s2/edit_view.dart';
import 'package:cv_appication_s2/widget/button.dart';

import 'widget/data_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CVview(),
    );
  }
}

class CVview extends StatefulWidget {
  late CVdata? cvData;

  CVview({
    Key? key,
    this.cvData,
  }) : super(key: key);

  @override
  State<CVview> createState() => _CVviewState();
}

class _CVviewState extends State<CVview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'CV Application',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: const Color.fromARGB(255, 88, 70, 14)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RDataWidget(
              leading: 'FULL NAME:',
              title: widget.cvData?.fullN ?? 'AMBALI SULAIMON OLAKUNLE',
            ),
            RDataWidget(
              leading: 'SLACK USERNAME:',
              title: widget.cvData?.slackN ?? 'olahimself',
            ),
            RDataWidget(
              leading: 'GITHUB HANDLE:',
              title: widget.cvData?.gitN ?? 'tishey',
            ),
            RDataWidget(
              leading: 'A BRIEF PERSONAL BIO:',
              title: widget.cvData?.desc ?? 'i love eating',
            ),
            const SizedBox(
              height: 120,
            ),
            RButtonWidget(
              label: 'Edit Data',
              onTap: () async {
                final updatedData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditView(initialData: widget.cvData),
                  ),
                );
                if (updatedData != null) {
                  setState(() {
                    widget.cvData = updatedData;
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
