import 'package:b_sims/src/config/const.dart';
import 'package:b_sims/src/config/getx/auth_getx.dart';
import 'package:b_sims/src/config/getx/onboarding_getx.dart';
import 'package:b_sims/src/screen/home/company/company_screen.dart';
import 'package:b_sims/src/screen/home/contact/contact_screen.dart';
import 'package:b_sims/src/screen/home/document/document_screen.dart';
import 'package:b_sims/src/screen/home/document/jasa/jasa_screen.dart';
import 'package:b_sims/src/screen/home/document/kedatangan/kedatangan_screen.dart';
import 'package:b_sims/src/screen/home/setting/setting_screen.dart';
import 'package:b_sims/src/widget/custom_card.dart';
import 'package:b_sims/src/widget/home_carousel.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final OnBoardingController onBoardingController = Get.find();
  final AuthController authController = Get.find();
  int _currentIndex = 0;

  final List<Widget> _listScreen = const [
    Home(),
    DocumentScreen(),
    ContactScreen(),
    SettingScreen(),
  ];

  List<Widget> _listItems() {
    return [
      Icon(
        _currentIndex == 0 ? Icons.home : Icons.home_outlined,
        color: _currentIndex == 0 ? Colors.white : primaryColor,
      ),
      Icon(
        _currentIndex == 1 ? Icons.file_copy : Icons.file_copy_outlined,
        color: _currentIndex == 1 ? Colors.white : primaryColor,
      ),
      Icon(
        _currentIndex == 2 ? Icons.call : Icons.call_outlined,
        color: _currentIndex == 2 ? Colors.white : primaryColor,
      ),
      Icon(
        _currentIndex == 3 ? Icons.settings : Icons.settings_outlined,
        color: _currentIndex == 3 ? Colors.white : primaryColor,
      ),
    ];
  }

  String _titleAppBar() {
    switch (_currentIndex) {
      case 0:
        return "";
      case 1:
        return "Daftar Dokumen";
      case 2:
        return "Kontak kami";
      case 3:
        return "Settings";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_titleAppBar()),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Notifications"),
                    content: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: List<Widget>.generate(
                                10,
                                (int id) => Material(
                                      type: MaterialType.transparency,
                                      child: ListTile(
                                        onTap: () {},
                                        leading: const Icon(Icons.person),
                                        title: const Text(
                                            "Notifikasi status nota :"),
                                        subtitle: const Text(
                                            "2022015398 Telah Dilakukan Verifikasi Oleh GM Komersil 2022015398"),
                                      ),
                                    )).toList(),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBar(
                  automaticallyImplyLeading: false,
                  title: const Text("Menu"),
                ),
                ListTile(
                  onTap: () => Navigator.pop(context),
                  leading: const Icon(Icons.home),
                  title: const Text("Beranda"),
                ),
                ListTile(
                  onTap: () => Get.to(const KedatanganScreen()),
                  leading: const Icon(Icons.file_copy),
                  title: const Text("Daftar Permohonan PKK"),
                ),
                ListTile(
                  onTap: () => Get.to(const Document()),
                  leading: const Icon(Icons.file_copy),
                  title: const Text("Dokumen kepelabuhan"),
                ),
              ],
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Konfirmasi keluar"),
                      content: const Text("Apakah kamu yakin ingin keluar ?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Kembali"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            authController.logOut();
                            Navigator.pop(context);
                          },
                          child: const Text("Keluar"),
                        ),
                      ],
                    );
                  },
                );
              },
              leading: const Icon(Icons.logout),
              title: const Text("Keluar"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: _listItems(),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: primaryColor,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _listScreen[_currentIndex],
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _back(),
          SizedBox.expand(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                return false;
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        "SISTEM INFORMASI KEPELABUHAN ONLINE",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CarouselHome(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Merupakan Sistem Informasi Kepelabuhan Online dimana Pengajuan Permohonan Izin Kepelabuhan di Layani Secara Online di Lingkungan Badan Pengusahaan Batam ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CustomCard(
                                'Perusahaan',
                                icon: Icons.account_balance_outlined,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CompanyScreen(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomCard(
                                'Dokumen Kepelabuhan',
                                icon: Icons.directions_boat,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Document(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              CustomCard(
                                'Pengajuan kedatangan kapal',
                                icon: Icons.anchor_outlined,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const KedatanganScreen(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomCard(
                                'Pengajuan jasa kepelabuhan',
                                icon: Icons.anchor_outlined,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const JasaScreen(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _back() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 100,
        color: primaryColor,
      ),
    );
  }
}
