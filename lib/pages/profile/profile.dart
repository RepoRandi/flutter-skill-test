import 'package:flutter/material.dart';
import 'package:skill_test/widgets/experience_company_card.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/randi.jpg'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter),
                      ),
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Randi Maulana A',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('Flutter Developer at Telkom Indonesia'),
            const SizedBox(height: 10),
            const Text(
              'About the job',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'I am a Flutter developer with experience in building high-performance, visually-appealing mobile applications. I have a strong background in object-oriented programming and experience with popular libraries and frameworks such as Flutter, Dart, Firebase, and BLoC. I am also well-versed in Git and Agile development methodologies. I am constantly learning new technologies and best practices to stay up-to-date in the ever-evolving world of software development.',
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            const Text(
              'Experience',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const ExperienceCompanyCard(
              logoPath: 'assets/telkom_logo.jpeg',
              company: 'Telkom Indonesia',
              jobDuration: 'Full-time · 3 yrs 1 mo',
              location: 'Jakarta Selatan · Remote',
              jobDetails: [
                JobDetail(
                  jobTitle: 'Mobile Developer',
                  jobPeriod: 'Nov 2022 - Present • 1 yr',
                  skills:
                      'Skills: Agile Methodologies · REST APIs · CI/CD · Scrum · Firebase · iOS · Android · Flutter · Dart',
                ),
                JobDetail(
                  jobTitle: 'Frontend Developer',
                  jobPeriod: 'Oct 2020 – Oct 2022 • 2 yrs 1 mo',
                  skills:
                      'Skills: Next.js · JavaScript · TypeScript · Node.js · React.js · REST APIs · CI/CD · CircleCI · Agile & Waterfall Methodologies · Scrum · Firebase',
                ),
              ],
            ),
            const ExperienceCompanyCard(
              logoPath: 'assets/serviceback_logo.jpeg',
              company:
                  'ServiceBack.com | Get Cashback on Home Services and Renovation!',
              jobDuration: 'Full-time · 2 yrs 10 mos',
              location: 'Singapore · Remote',
              jobDetails: [
                JobDetail(
                  jobTitle: 'Full Stack Developer',
                  jobPeriod: 'Jan 2018 - Oct 2020',
                  skills:
                      'Skills: Next.js · NestJS · PostgreSQL · AWS · Git · JavaScript · TypeScript · Node.js · React.js · REST APIs · Agile & Waterfall Methodologies · Scrum',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
