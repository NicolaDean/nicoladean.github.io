import 'package:flutter/material.dart';
import 'package:portfolio/models/Project_model.dart';
import 'package:portfolio/screens/ProjectDetail/project_detail.dart';

import '../constants/projects.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';

class Project extends StatelessWidget {
  final Project_model model;

  const Project({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    Image my_image = Image(
      image: AssetImage(model.img_path),
      width: 300,
      height: 200,
    );

    return GestureDetector(
        onTap: () => navigate_2(context), //
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_drop_down_circle),
                title: SelectableText(model.name),
                subtitle: SelectableText(
                  model.tags,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              my_image,
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SelectableText(
                  model.short_explanation,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              ElevatedButton(
                  onPressed: () => navigate_2(context),
                  child: Text("Learn More"))
            ],
          ),
        ));
  }

  //context.goNamed('project', extra: model),
  void navigate(BuildContext context, Project_model project) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProjectDetail(id: project.id),
        ));
  }

  void navigate_2(BuildContext context) {
    print("BANANA");
    context.go("/project/" + model.id.toString());
    //context.go(Uri(path: '/project', queryParameters: {'project_id': model.id}).toString());
  }
}

class ProjectContainer extends StatelessWidget {
  const ProjectContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            autoPlay: true,
          ),
          items: projects.map((p) {
            return Builder(builder: (BuildContext context) {
              return Project(model: p);
            });
          }).toList(),
        ));
  }
}
