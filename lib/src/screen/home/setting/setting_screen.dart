import 'package:b_sims/src/config/const.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _tapEmail = false;
  bool _tapPassword = false;
  bool _tapNotifikasi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const CircleAvatar(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                    backgroundColor: primaryColor,
                    radius: 30,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Administrator Admin",
                    style: TextStyle(
                      color: darkColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "admin@gmail.com  ",
                    style: TextStyle(
                      color: darkColor.withOpacity(.4),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: _tapEmail
                                  ? TextFormField(
                                      initialValue: 'admin@gmail.com',
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 8.0,
                                          horizontal: 10,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    )
                                  : const Text("admin@gmail.com"),
                            ),
                          ),
                          IconButton(
                            onPressed: () => setState(() {
                              _tapEmail = !_tapEmail;
                            }),
                            icon: _tapEmail
                                ? const Icon(Icons.check)
                                : const Icon(
                                    Icons.edit,
                                  ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.vpn_key,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: _tapPassword
                                  ? TextFormField(
                                      initialValue: 'password',
                                      obscureText: true,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 8.0,
                                          horizontal: 10,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    )
                                  : const Text("password"),
                            ),
                          ),
                          IconButton(
                            onPressed: () => setState(() {
                              _tapPassword = !_tapPassword;
                            }),
                            icon: _tapPassword
                                ? const Icon(Icons.check)
                                : const Icon(
                                    Icons.edit,
                                  ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InkWell(
                        onTap: () => setState(() {
                          _tapNotifikasi = !_tapNotifikasi;
                        }),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.notifications,
                              ),
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text("Notifikasi"),
                              ),
                            ),
                            Switch(
                              value: _tapNotifikasi,
                              onChanged: (value) => setState(
                                () {
                                  _tapNotifikasi = value;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.public,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text("Adminisi@gmail.com"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.navigate_next),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (builder) {
                                return Container(
                                  // height: 350.0,
                                  color: Colors.transparent,
                                  child: Container(
                                    height: 200,
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0))),
                                    child: GridView.count(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 10.0,
                                      crossAxisSpacing: 10.0,
                                      childAspectRatio: 1.3,
                                      children: <Widget>[
                                        _iconBagikan(Icons.call, "Whatsapp"),
                                        _iconBagikan(
                                            Icons.folder, "Salin ke folder"),
                                        _iconBagikan(Icons.mail, "Pesan"),
                                        _iconBagikan(
                                            Icons.copy, "Salin ke papan clip"),
                                        _iconBagikan(
                                            Icons.facebook, "Facebook"),
                                        _iconBagikan(
                                            Icons.email_outlined, "Gmail"),
                                        _iconBagikan(
                                            Icons.bluetooth, "Bluetooth"),
                                        _iconBagikan(
                                            Icons.insert_drive_file, "Catatan"),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.help,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text("Bagikan App"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.navigate_next),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.favorite,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text("Rate App"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.navigate_next),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconBagikan(IconData icon, String title) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Icon(icon),
              const SizedBox(height: 5),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
