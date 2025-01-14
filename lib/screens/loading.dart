import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 10 saniye sonra home sayfasına yönlendirme
    Future.delayed(const Duration(seconds: 4), () { //4 Saniye Sonra home ekranına geçer
      context.go("/home");
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227,119,174),
      body: SizedBox.expand(
        child: Column(
          children: [
            // Logo bölümü
            Expanded(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(
                  'assets/images/logo.webp',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            
            InkWell(
              child: SizedBox(
                width: 150,
                child: Opacity(
                  opacity: 0.9,
                
                  child: DotLottieLoader.fromAsset("assets/motions/loadingAnim.lottie",
                  frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(dotlottie.animations.values.single);
                    } else {
                      return Container();
                    }
                  })
                  ),
              ),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
