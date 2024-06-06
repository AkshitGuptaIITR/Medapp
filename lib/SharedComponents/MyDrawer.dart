import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medapp/Redux/AuthState/AuthStateActions.dart';
import 'package:medapp/Redux/AuthState/AuthStateReducer.dart';
import 'package:medapp/utils/Common.dart';

class MyDrawer extends StatefulWidget {
  final Function closeDrawer;
  MyDrawer({Key? key, required this.closeDrawer}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Future<void> handleDrawerClick(dynamic data) async {
    if (data == "Log Out") {
      final storage = FlutterSecureStorage();
      await storage.delete(key: "token");
      final store = StoreProvider.of<AuthState>(context);
      store.dispatch(LogoutAction());
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: ShapeDecoration(
          color: Color(0xFF007F77),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0)),
          ),
        ),
        child: Column(children: [
          Container(
            height: 150,
            decoration: ShapeDecoration(
              color: Color(0xFF00726B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  // bottomRight: Radius.circular(38),
                ),
              ),
            ),
            padding: EdgeInsets.only(top: 56),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 36),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4.0, // adjust the border width as needed
                      ),
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      widget.closeDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 34),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  )
                ]),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 75,
            height: MediaQuery.of(context).size.height * 0.75,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: drawerRowItems.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          bottom: BorderSide(color: Colors.white, width: 1))),
                  child: ListTile(
                    onTap: () {
                      handleDrawerClick(drawerRowItems[index].name);
                    },
                    leading: Container(
                      decoration: ShapeDecoration(
                        color: Color(0xFF00726B),
                        shape: OvalBorder(),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        drawerRowItems[index].icon,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      drawerRowItems[index].name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
