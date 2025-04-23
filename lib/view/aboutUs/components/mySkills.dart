import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatelessWidget {
  // List of skills with icons
  final List<Map<String, dynamic>> skills = [
    {'name': 'Flutter', 'icon': Icons.code},
    {'name': 'Dart', 'icon': Icons.developer_mode},
    {'name': 'Firebase', 'icon': Icons.cloud},
    {'name': 'REST APIs', 'icon': Icons.api},
    {'name': 'Provider', 'icon': Icons.widgets},
    {'name': 'GetX', 'icon': Icons.widgets},
    {'name': 'Git & GitHub', 'icon': Icons.gite_sharp},
    {'name': 'UI/UX Design', 'icon': Icons.design_services},
    {'name': 'Play Store', 'icon': Icons.shop},
    {'name': 'SQL Lite', 'icon': Icons.storage},
    {'name': 'Dio', 'icon': Icons.http},
    {'name': 'Google Map', 'icon': Icons.map},
    {'name': 'Localization', 'icon': Icons.translate},
    {'name': 'Remote Config', 'icon': Icons.settings_remote},

  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
       padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 15 : 20,
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
                     Responsive.isDesktop(context)||Responsive.isExtraLargeScreen(context)?

           Text(
              "My Skills",
              style: GoogleFonts.poppins(
                fontSize: Responsive.isMobile(context) ? 20 : 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ):Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  "My Skills",
                  style: GoogleFonts.poppins(
                    fontSize: Responsive.isMobile(context) ? 20 : 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
            padding:  EdgeInsets.only(right: Responsive.isMobile(context) ?30: 200),
              child: SelectableText(
                "Expert in building responsive and intuitive mobile applications, with a strong command of tools like Flutter and Firebase to create engaging and seamless cross-platform experiences. Skilled in GitHub for version control, ClickUp for project management, and Postman for API testing and integration. Proficient in state management, RESTful API integration, Google Maps integration, and implementing secure payment gateways like Stripe.",
                 style: GoogleFonts.poppins(
                fontSize: Responsive.isMobile(context) ? 16 : 18,
                color: Colors.grey,
              ),
              textAlign:          Responsive.isDesktop(context)||Responsive.isExtraLargeScreen(context)?
              TextAlign.left:TextAlign.center,
                      
              ),
            ),
            const SizedBox(height: 40),
                // Skills Grid
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: skills.map((skill) {
                return Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Colors.pinkAccent, Colors.blue],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.pink,
                      offset: Offset(-2, 0),
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Colors.blue,
                      offset: Offset(2, 0),
                      blurRadius: 10,
                    ),
                  ],
                ),
                  child: Chip(
                    backgroundColor: Colors.black,
                    label: Text(
                      skill['name'],
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    avatar: Icon(
                      skill['icon'],
                      color: Colors.blue,
                    ),
                  ),
                );
              }).toList(),
            ),
         const SizedBox(height: 40)
        
          ],
        ),
      ),
    );
  }
}