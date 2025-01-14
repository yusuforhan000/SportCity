import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreen createState() => _ProfileScreen();
}  


class _ProfileScreen extends State<ProfileScreen>{
    bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('Profilim'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.moon),
            onPressed: () {
              setState(() {
                // Arka plan rengini değiştirmek için durumu güncelle
                _isDarkMode = !_isDarkMode;
              });
            },
          ),
        ],
      ),


      // Drawer (Yan Menü)
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: [
            // Drawer Header
            Container(
              height: 200,
              color: Colors.blue,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kullanıcı Adı',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            // Menü öğeleri
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                context.go("/settings");
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.cart),
              title: const Text('Sepetim'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Ana içerik
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Profil içeriği',
                style: TextStyle(
                  color: _isDarkMode ? Colors.white : Colors.black, // Yazı rengini değiştir
                ),
              ),
            ),
          ),
        ],
      ),

      // Alt navigasyon çubuğu
      bottomNavigationBar: AltMenu(),

      backgroundColor: _isDarkMode ? Colors.grey[850] : Colors.white,
      // Arka plan rengini Scaffold içinde ayarlıyoruz
    );
  }
}

class AltMenu extends StatelessWidget {
  const AltMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () {context.go("/home");}, icon: const Icon(CupertinoIcons.home)),
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.search)),
          IconButton(onPressed: () {/*context.go("/profile");*/ }, icon: const Icon(CupertinoIcons.person)),
        ],
        
      ),
      );
  }
}