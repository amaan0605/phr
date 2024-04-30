import 'package:flutter/material.dart';
import 'package:phr_app/pages/Navbar/feed.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    super.key,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  List<String> name = [
    'Cardiology',
    'Skin care',
    'Mental Health',
    'Breathing Exercise',
    'Health',
    'car',
    'Skin ',
    'Mental ',
    'Breathing ',
    'Hea',
    'Cardi',
    'Mental Halth',
    'Breathig Exercise',
    'Heal',
  ];

  Future<List<String>>? _list;
  @override
  void initState() {
    _list = getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: _list,
        builder: (context, snapshot) {
          List<String> tempArray = snapshot.data ?? [];
          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 189, 227, 244),
              appBar: AppBar(
                  backgroundColor: const Color.fromARGB(255, 189, 227, 244),
                  title: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const feedpage()));
                        // Navigator.pop(context);
                      },
                      child: const Text("Sahasra.AI")),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.account_circle),
                      color: Colors.orange,
                      onPressed: () {},
                    )
                  ],
                  automaticallyImplyLeading: false,
                  elevation: 10,
                  leading: Container(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('images/logo.png'),
                  )),
              body: Center(
                  child: (Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    Expanded(
                        child: ListView.builder(
                            itemCount: name.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (tempArray
                                          .contains(name[index].toString())) {
                                        tempArray
                                            .remove(name[index].toString());
                                        removeList(name[index]);
                                      } else {
                                        tempArray.add(name[index].toString());
                                        addList(name[index]);
                                      }
                                    });
                                  },
                                  child: Card(
                                    child: ListTile(
                                      minLeadingWidth: 0,
                                      // leadingAndTrailingTextStyle: ,
                                      tileColor: const Color.fromARGB(
                                          255, 189, 227, 244),
                                      title: Text(name[index].toString()),
                                      leading: Container(
                                        height: 26,
                                        width: 26,
                                        decoration: BoxDecoration(
                                            color: tempArray.contains(
                                                    name[index].toString())
                                                ? const Color.fromARGB(
                                                    255, 1, 137, 248)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                color: Colors.black, width: 1)),
                                        child: Center(
                                          child: Text(tempArray.contains(
                                                  name[index].toString())
                                              ? ''
                                              : ''),
                                        ),
                                      ),
                                    ),
                                  ));
                            }))
                  ]))));
        });
  }

  void addList(String s) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> l = prefs.getStringList("editList") ?? [];
    l.add(s);
    prefs.setStringList("editList", l);
  }

  void removeList(String s) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> l = prefs.getStringList("editList") ?? [];
    l.remove(s);
    prefs.setStringList("editList", l);
  }

  Future<List<String>> getList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> temp = prefs.getStringList("editList")!.toList();
    return temp;
  }
}
