import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'home_viewmodel.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, model, __) {
      return BottomNavigationBar(
        currentIndex: model.currentIdx,
        onTap: context.read<HomeViewModel>().updateTabIdx,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'World Clock',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.stopwatch),
            label: 'Stopwatch',
          ),
        ],
      );
    });
  }
}
