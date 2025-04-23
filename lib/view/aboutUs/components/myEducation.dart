import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/education_model.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/view/aboutUs/components/experience.dart';
import 'package:flutter_portfolio/view/projects/components/projects_grid.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationSection extends StatelessWidget {
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
          children: [
            Responsive.isDesktop(context)||Responsive.isExtraLargeScreen(context)?
              Padding(
              padding: const EdgeInsets.only(top: 30),
               child: Text(
                  "My Education",
                  style: GoogleFonts.poppins(
                    fontSize: Responsive.isMobile(context) ? 20 : 24,fontWeight: FontWeight.w600,
                        color: Colors.white,),
                ),
             ):Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    "My Education",
                    style: GoogleFonts.poppins(
                      fontSize: Responsive.isMobile(context) ? 20 : 24,fontWeight: FontWeight.w600,
                          color: Colors.white,),
                  ),
                ),
              ),
             const SizedBox(height: 10),
              Padding(
              padding:  EdgeInsets.only(right: Responsive.isMobile(context) ?30: 200),
                child: SelectableText(
                  "Graduated from Kohat University of Science and Technology (KUST), Hangu Campus in 2023. Completed the Final Year Project (FYP): HouseHold, specializing in mobile app development using Flutter, Firebase, and modern UI/UX design. Developed scalable, user-centric applications and integrated advanced technologies, gaining expertise in cross-platform development and innovative problem-solving.",
                   style: GoogleFonts.poppins(
                  fontSize: Responsive.isMobile(context) ? 16 : 18,
                  color: Colors.grey,
                ),
                                    textAlign: Responsive.isDesktop(context)||Responsive.isExtraLargeScreen(context)?TextAlign.left:TextAlign.center,
                
                ),
              ),
SizedBox(
            height: Responsive.isMobile(context)
                ? 15
                : Responsive.isTablet(context)
                    ? 20
                    : 25,
          ),      Responsive(
              mobile: GradientContainer(
                crossAxisCount: 1,
                itemCount: educationModel.length,
                ratio: 1.9,
              ),
              largeMobile: GradientContainer(
                crossAxisCount: 1,
                itemCount: educationModel.length,
                ratio: 1.9,
              ),
              tablet: GradientContainer(
                crossAxisCount: 1,
                itemCount: educationModel.length,
                ratio: 3.5,
              ),
              desktop: GradientContainer(
                crossAxisCount: 2,
                itemCount: educationModel.length,
                ratio: 1.7,
              ),
              webScreen: GradientContainer(
                crossAxisCount: 2,
                itemCount: educationModel.length,
                ratio: 1.5,
              ),
            ),
         const SizedBox(height: 40)
       ],
        ),
      ),
    );
  }
}
class GradientContainer extends StatelessWidget {
  final int crossAxisCount;
  final int? itemCount;
  final double ratio;

  GradientContainer({
    required this.itemCount,
    this.crossAxisCount = 2,
    this.ratio = 1.8,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isDesktop = Responsive.isMobile(context);
    final double titleFontSize = isMobile ? 16.0 : 18.0;
    final double subtitleFontSize = isMobile ? 12.0 : 14.0;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: isMobile ? 10.0 :20.0),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: ratio,
      ),
      itemBuilder: (context, index) {
        final education = educationModel[index];
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: EdgeInsets.only(left: isMobile ? 10.0 :20.0),
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
            child: AnimatedContainer(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 15 : 20,
                vertical: isMobile ? 10 : 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: bgColor,
              ),
              duration: const Duration(milliseconds: 500),
              child: Stack(alignment: Alignment.bottomLeft,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Duration
                      Padding(
                        padding: EdgeInsets.only(top: isMobile ? 8.0 : 15.0 ,),
                        child: Text(
                          education.duration,
                          style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontSize: subtitleFontSize,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: isMobile ? 8 : 10),
                  
                      // Position
                      Text(
                        education.position,
                        style: GoogleFonts.koHo(
                          fontSize: titleFontSize,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                     
                    ],
                  ),
                   // Company
                  Padding(
                    padding:  EdgeInsets.only(bottom: isMobile ? 15:isDesktop?0 : 20),
                    child: Text(
                      education.company,
                      style: GoogleFonts.koHo(
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}