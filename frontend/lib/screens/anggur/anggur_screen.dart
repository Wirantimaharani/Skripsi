import 'package:flutter/material.dart';

import '../../utilities/colors.dart';

class AnggurScreen extends StatelessWidget {
  const AnggurScreen({super.key});

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
        actions: [
          GestureDetector(
            onTap: () {},
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
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 3,
          ),
          child: SingleChildScrollView(
            child: Center(
                child: Column(
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/image/Logo2.png",
                      width: size.width * 0.7,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Text(
                      '''Selamat datang OrisGrape aplikasi deteksi buah anggur berdasarkan tekstur dan warna! Aplikasi inovatif ini hadir untuk membantu Anda dalam mengidentifikasi kelayakan buah anggur dengan lebih akurat dan efisien."
                      
Buah anggur memiliki keberagaman varietas, dan kualitasnya sangat dipengaruhi oleh faktor seperti tekstur dan warna kulitnya. Namun, dalam proses pemilihan buah yang layak, seringkali terjadi kesulitan dalam menentukan kematangan yang optimal secara visual. Dalam mengatasi masalah ini, aplikasi deteksi buah anggur kami menggunakan teknologi canggih untuk menganalisis tekstur dan warna kulit buah. Dengan menggunakan algoritma yang teruji dan terpercaya, aplikasi ini dapat mengenali ciri-ciri kematangan yang diinginkan secara lebih objektif.

Keunggulan aplikasi ini tidak hanya terletak pada akurasi, tetapi juga pada kemudahan penggunaannya. Cukup dengan mengambil gambar buah anggur menggunakan kamera smartphone Anda, aplikasi ini akan memberikan hasil deteksi kelayakan buah dengan cepat dan praktis. Dengan aplikasi deteksi buah anggur berbasis tekstur dan warna ini, diharapkan para petani, pengepul, serta konsumen dapat memperoleh buah anggur yang berkualitas tinggi, mengurangi pemborosan, dan meningkatkan efisiensi dalam pengelolaan produk buah anggur.

Terima kasih telah bergabung dengan kami dalam memperkenalkan solusi baru untuk deteksi kelayakan buah anggur. Mari kita bersama-sama mengoptimalkan penggunaan teknologi demi meningkatkan kualitas dan kesejahteraan dalam industri buah anggur''',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: KBlackTxtClr),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Image.asset(
                      "assets/image/Logo0.png",
                      width: size.width * 0.3,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const Text(
                      '''Logo yang kami ciptakan menggambarkan esensi dan karakteristik utama dari aplikasi kami dengan simbol yang kuat dan menarik.

Oris Grape adalah singkatan dari Online Recognition System for Grape yang berarti Sistem Pengenalan Online untuk Buah Anggur. Konsep ini mewakili fitur utama dari aplikasi kami, yang memanfaatkan teknologi pengenalan citra dan pemrosesan data secara online untuk mendeteksi kelayakan buah anggur. 

Dalam aplikasi Oris Grape pengguna dapat memanfaatkan kemampuan pengenalan citra untuk memeriksa dan menganalisis karakteristik buah anggur dengan cepat dan efisien.''',
                      // maxLines: 30,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: KBlackTxtClr),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Image.asset(
                      "assets/image/Logo1.png",
                      width: size.width * 0.5,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const Text(
                      '''Logo kami menampilkan sebuah anggur yang berpadu dengan elemen teknologi modern. Bentuk anggur yang elegan dan detilnya yang halus merepresentasikan keindahan dan keberagaman varietas buah anggur. Di sisi lain, elemen teknologi yang terwujud dalam desain logo memberikan kesan inovatif dan futuristik. Warna hijau dalam logo menggambarkan kesegaran dan kesehatan. Ini mencerminkan sifat alami buah anggur yang segar dan memberikan asupan nutrisi yang baik bagi kesehatan. Logo ini menyiratkan bahwa aplikasi kami berfokus pada pemilihan buah anggur yang segar dan sehat.
                      
Logo aplikasi kami didesain untuk membangkitkan minat dan ketertarikan. Dengan kombinasi yang harmonis antara unsur tradisional dan modern, kami ingin menyampaikan pesan bahwa aplikasi kami memadukan kekayaan alam dengan kecanggihan teknologi untuk memberikan pengalaman terbaik kepada pengguna. Kami berharap logo ini dapat menjadi simbol yang mudah dikenali dan menggambarkan nilai-nilai utama dari aplikasi kami.
''',
                      // maxLines: 30,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: KBlackTxtClr),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
