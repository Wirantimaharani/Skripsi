import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:frontend/screens/anggur/anggur_screen.dart';
import 'package:frontend/screens/result/result_screen.dart';
import 'package:frontend/utilities/colors.dart';

import '../home/home_screen.dart';

class PreviewScreen extends StatefulWidget {
  final File? image;
  const PreviewScreen({
    super.key,
    required this.image,
  });

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  int? result;

  Future<void> sendData() async {
    final url = Uri.parse('http://192.168.43.4:5000/klasifikasi');
    final request = http.MultipartRequest('POST', url);
    final ImageBytes = await widget.image!.readAsBytes();

    final multipartFile = http.MultipartFile.fromBytes(
      'image',
      ImageBytes,
      filename: 'my-image.jpg',
    );
    request.files.add(multipartFile);

    final response = await request.send();
    final jsonResponse = jsonDecode(await response.stream.bytesToString());

    if (response.statusCode == 200) {
      final prediction = jsonResponse['Label'];
      setState(() {
        result = prediction;
      });
    } else {
      setState(() {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: KBlackTxtClr,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "Tampilan",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: KBlackTxtClr,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnggurScreen(),
                ),
              );
            },
            child: Image.asset(
              "assets/image/Logo3.png",
              width: size.width * 0.15,
              scale: size.height * 0.035,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: KBlackTxtClr.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      widget.image!,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
                ElevatedButton(
                  onPressed: () {
                    // await sendData();
                    //ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            image: widget.image,
                            result: 2,
                          ),
                        ),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KButtonClr,
                    minimumSize: Size(size.width, 50),
                    shadowColor: Colors.grey,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Deteksi",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: KBlackTxtClr,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
