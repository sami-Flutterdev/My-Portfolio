import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/widget.dart';
import 'package:flutter_portfolio/view%20model/getx_controllers/projects_controller.dart';
import 'package:flutter_portfolio/view/aboutUs/components/about_me.dart';
import 'package:flutter_portfolio/view/aboutUs/components/contact.dart';
import 'package:flutter_portfolio/view/aboutUs/components/experience.dart';
import 'package:flutter_portfolio/view/aboutUs/components/myEducation.dart';
import 'package:flutter_portfolio/view/aboutUs/components/mySkills.dart';
import 'package:get/get.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';

class AboutMainView extends StatelessWidget {
  final controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Responsive(
        mobile: MobileView(controller: controller),
        tablet: TabletView(controller: controller),
        desktop: DesktopView(controller: controller),
        webScreen: DesktopView(controller: controller),
      ),
    );
  }
}

class MobileView extends StatelessWidget {
  final ProjectController controller;

  const MobileView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavigationTabsColumn(controller: controller),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(16.0),
              child: controller.selectedWidget.value,
            ),
          ),
        ],
      ),
    );
  }
}

class TabletView extends StatelessWidget {
  final ProjectController controller;

  const TabletView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavigationTabsColumn(controller: controller),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(16.0),
              child: controller.selectedWidget.value,
            ),
          ),
        ],
      ),
    );
  }
}

class DesktopView extends StatelessWidget {
  final ProjectController controller;

  const DesktopView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: NavigationDrawer(controller: controller),
        ),
        Expanded(
          flex: 3,
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.all(16.0),
              child: controller.selectedWidget.value,
            ),
          ),
        ),
      ],
    );
  }
}

class NavigationTabsColumn extends StatelessWidget {
  final ProjectController controller;

  const NavigationTabsColumn({required this.controller});

  @override
  Widget build(BuildContext context) {
    final double fontSize = Responsive.isMobile(context) ? 14 : 16;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 16 : 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height:Responsive.isMobile(context) ? 30: 32,),
          _buildNavItem(context,"Experience", ExperienceSection(), fontSize, controller),
          _buildNavItem(context,"My Education", EducationSection(), fontSize, controller),
          _buildNavItem(context,"My Skills", SkillsSection(), fontSize, controller),
          _buildNavItem(context,"About Me", const AboutMeSection(), fontSize, controller),
          // _buildNavItem(context,"Contact", ContactSection(), fontSize, controller),
        ],
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  final ProjectController controller;

  const NavigationDrawer({required this.controller});

  @override
  Widget build(BuildContext context) {
    final double fontSize = Responsive.isDesktop(context) ? 18 : 16;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isDesktop(context) ? 40 : 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height:Responsive.isMobile(context) ? 20: 50,),
          _buildNavItem(context,"Experience", ExperienceSection(), fontSize, controller),
          _buildNavItem(context,"My Education", EducationSection(), fontSize, controller),
          _buildNavItem(context,"My Skills", SkillsSection(), fontSize, controller),
          _buildNavItem(context,"About Me", const AboutMeSection(), fontSize, controller),
          // _buildNavItem(context,"Contact", ContactSection(), fontSize, controller),
        ],
      ),
    );
  }
}

Widget _buildNavItem(context,
  String title,
  Widget contentWidget,
  double fontSize,
  ProjectController controller,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: InkWell(
      onTap: () => controller.updateContent(title, contentWidget),
      child: Obx(
        () {
          bool isActive = controller.selectedTitle.value == title;
          return GradientButton(
            width:  300,
            onPressed: () {
              controller.updateContent(title, contentWidget);
            },
            child: Text(
              title,
              style: TextStyle(
                color: isActive ? Colors.orange : Colors.white,
                fontSize: fontSize,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        },
      ),
    ),
  );
}