import 'package:flutter/material.dart';

//UTILS
import '../../utils/responsive-manager.dart';
//WIDGETS
import '../../widgets/responsive_layout.dart';
import '../NavigationBar/navigation_bar.dart';

import '../../widgets/project_widget.dart';

import 'package:go_router/go_router.dart';
import 'package:portfolio/models/Project_model.dart';
import 'project_detail.dart';

class ProjectDetail_Mobile extends ProjectDetail {
  ProjectDetail_Mobile({super.key, required super.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: MyNavigationBar.getAppBarMobile(),
      drawer: MyNavigationBar.getDrawer(context),
      body: Container(
          color: Colors.deepOrange[600], child: Project(model: detail)),
    );
  }
}
