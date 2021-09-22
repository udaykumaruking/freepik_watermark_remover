import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class FreepikWatermarkRemover extends StatefulWidget {
  const FreepikWatermarkRemover({Key? key}) : super(key: key);

  @override
  State<FreepikWatermarkRemover> createState() =>
      _FreepikWatermarkRemoverState();
}

class _FreepikWatermarkRemoverState extends State<FreepikWatermarkRemover> {
  TextEditingController nameController = TextEditingController();
  String url = '';
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                'Freepik Watermark Remover',
                textAlign: TextAlign.center,
                style: GoogleFonts.jost(
                  textStyle: const TextStyle(
                    color: kBlue,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                'Enter the URL of the image',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 25,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'URL',
                    // helperText: ,
                    helperText:
                        'For Example: https://image.freepik.com/free-vector/hand-drawn-flat-teachers-day-illustration_52683-70735.jpg'),
                onChanged: (text) {
                  setState(() {
                    url = text;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  // labelText: 'Downalod',
                  label: const Text(
                    'Remove Watermark',
                    style: TextStyle(fontSize: 18),
                  ),
                  icon: const Icon(
                    Icons.download,
                    size: 20,
                  ),
                  // icon: FaIcon(FontAwesomeIcons.paypal),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue[600],
                      padding: const EdgeInsets.all(20)),
                  onPressed: () {
                    String abc = url.replaceFirst('a', '');
                    url = abc.replaceFirst('e', '');
                    if (url != "") {
                      setState(() {
                        show = true;
                      });
                    }
                    nameController.clear();
                    // ignore: avoid_print
                    print(url);
                  }),
              const SizedBox(
                height: 50,
              ),
              Container(
                child: showImage(show),
              )
            ],
          ),
        ),
      ),
      persistentFooterButtons: const [
        Center(
          child: Text(
            'Developed By Uday Kumar Madarapu',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kBlue,
            ),
          ),
        )
      ],
    );
  }

  showImage(show) {
    if (show == false) {
      return null;
    } else {
      return Image.network(url);
    }
  }
}
