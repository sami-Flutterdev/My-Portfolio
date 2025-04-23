import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../view model/responsive.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
       padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 15 : 20,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Responsive.isDesktop(context)||Responsive.isExtraLargeScreen(context)? 
             Text(
              'About me',
              style: TextStyle(
                fontSize: Responsive.isMobile(context) ? 20 : 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ):  
            Padding(
              padding:  const EdgeInsets.only(top: 40),
              child: Center(
                child:  Text(
                  'About me',
                  style: TextStyle(
                    fontSize: Responsive.isMobile(context) ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
             Padding(
            padding:  EdgeInsets.only(right: Responsive.isMobile(context) ?30: 200),
               child: SelectableText(
                "I'm Sami Ullah, a skilled Flutter developer with 3 years of experience in building responsive, dynamic mobile applications. I excel at transforming complex ideas into intuitive, user-friendly interfaces while ensuring seamless functionality across platforms. My expertise lies in developing efficient solutions, optimizing performance, and collaborating on projects that deliver engaging user experiences.",
                 style: GoogleFonts.poppins(
                fontSize: Responsive.isMobile(context) ? 16 : 18,
                color: Colors.grey,
              ),  textAlign: Responsive.isDesktop(context)||Responsive.isExtraLargeScreen(context)?TextAlign.left:TextAlign.center,
               
                
                           ),
             ),
                         SizedBox(height: Responsive.isMobile(context) ? 40 :60,),

            Padding(
              padding:  EdgeInsets.only(right: Responsive.isMobile(context) ?30: 200),
              child: Wrap(
                spacing: 40,
                runSpacing: 16,
                children: [
                  _buildInfoRow('Name', 'Sami Ullah',context),
                  _buildInfoRow('Phone', '(+92) 330 3210550',context),
                  _buildInfoRow('Experience', '3 Year',context),
                  _buildInfoRow('Nationality', 'Pakistani',context),
                  _buildInfoRow('Email', 'samiu09950@gmail.com',context),
                  _buildInfoRow('Freelance', 'Not yet',context),
                  _buildInfoRow('Language', 'English, Urdu, Pashto',context),
                ],
              ),
            ),
         const SizedBox(height: 40)

          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value,context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$label ',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white54,
          ),
        ),SizedBox(width: 20,),
        Text(
          value,
          style:  TextStyle(
            fontSize: Responsive.isMobile(context) ? 16 : 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
} 