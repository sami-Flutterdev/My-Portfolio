
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
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
                  "Contact",
                  style: GoogleFonts.poppins(
                  fontSize: Responsive.isMobile(context) ? 20 : 24,fontWeight: FontWeight.w600,
                        color: Colors.white,),
                             ),
               ):Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    "Contact",
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
                  "Passionate and dedicated Flutter Developer with a solid understanding of mobile application development principles. Skilled in creating clean, reliable, and efficient code, with a focus on user experience and interface design. Seeking opportunities to leverage expertise in Flutter development to contribute to innovative projects and drive business growth.",
                   style: GoogleFonts.poppins(
                  fontSize: Responsive.isMobile(context) ? 16 : 18,
                  color: Colors.grey,
                ),
                                    textAlign: Responsive.isDesktop(context)||Responsive.isExtraLargeScreen(context)?TextAlign.left:TextAlign.center,
                
                ),
              ),
                     const SizedBox(height: 40)

          ],
        ),
      ),
    );
  }
}