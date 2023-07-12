import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/utilities/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../anggur/anggur_screen.dart';
import '../home/home_screen.dart';

class ResultScreen extends StatefulWidget {
  final File? image;
  final int? result;
  const ResultScreen({
    super.key,
    required this.image,
    required this.result,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final PanelController _panelController = PanelController();

  @override
  void initState() {
    super.initState();
  }

  void togglePanel() => _panelController.isPanelOpen
      ? _panelController.close()
      : _panelController.open();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.home,
            color: KBlackTxtClr,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false);
          },
        ),
        centerTitle: true,
        title: const Text(
          "Hasil Prediksi",
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
      body: SlidingUpPanel(
        controller: _panelController,
        parallaxEnabled: true,
        maxHeight: size.height * 0.5,
        minHeight: size.height * 0.125,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    widget.image!,
                    width: size.width,
                  ),
                ),
              ],
            ),
          ),
        ),
        panelBuilder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: togglePanel,
                    child: Container(
                      margin: const EdgeInsets.only(top: 15),
                      height: 10,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  const Text(
                    "Hasil Prediksi",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  if (widget.result == 1)
                    Column(
                      children: [
                        Text(
                          "Layak Makan",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            background: Paint()
                              ..strokeWidth = 21
                              ..color = KhighlightTxtClr
                              ..style = PaintingStyle.stroke
                              ..strokeJoin = StrokeJoin.bevel,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        const Text(
                          "Anggur Layak Makan: Buah anggur layak makan jika kulit buahnya tidak terlihat terlalu kusam atau berkerut, memiliki warna yang cerah dan menarik, serta aroma yang segar dan manis. Saat dipetik atau diambil dari rak toko, buah anggur yang layak makan biasanya terlihat utuh dan tidak lembek atau pecah-pecah. Selain itu, biji buah anggur pada tahap ini juga mudah lepas dari daging buahnya",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  if (widget.result == 2)
                    Column(
                      children: [
                        Text(
                          "Tidak Layak Makan",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            background: Paint()
                              ..strokeWidth = 22
                              ..color = KhighlightTxtClr
                              ..style = PaintingStyle.stroke
                              ..strokeJoin = StrokeJoin.bevel,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        const Text(
                          "Anggur Tidak Layak Makan: Buah anggur tidak layak makan jika kulit buahnya terlihat sangat kusam atau berkerut, memiliki warna yang tidak menarik atau berubah warna menjadi coklat atau hitam, serta aroma yang tidak segar atau terasa busuk. Jika buah anggur terlihat lembek atau pecah-pecah, atau biji buah anggur masih terikat dengan erat pada daging buahnya, maka buah tersebut juga tidak layak makan.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
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
                      "Kembali ke Beranda",
                      style: TextStyle(
                        color: KBlackTxtClr,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                ],
              ),
            ),
          );
        },
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
    );
  }
}
