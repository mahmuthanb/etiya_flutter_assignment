import 'package:etiya_flutter_assignment/data/constans_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(spaceXS),
            child: TextFormField(
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: "type to filter",
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Container(),
      ),
    );
  }
}
