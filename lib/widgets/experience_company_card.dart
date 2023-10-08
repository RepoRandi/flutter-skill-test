import 'package:flutter/material.dart';

class ExperienceCompanyCard extends StatelessWidget {
  final String logoPath;
  final String company;
  final String jobDuration;
  final String location;
  final List<JobDetail> jobDetails;

  const ExperienceCompanyCard({
    Key? key,
    required this.logoPath,
    required this.jobDuration,
    required this.company,
    required this.location,
    required this.jobDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    logoPath,
                    width: 48.0,
                    height: 48.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        "$jobDuration · $location",
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            for (int i = 0; i < jobDetails.length; i++)
              JobDetail(
                jobTitle: jobDetails[i].jobTitle,
                jobPeriod: jobDetails[i].jobPeriod,
                skills: jobDetails[i].skills,
              ),
          ],
        ),
      ),
    );
  }
}

class JobDetail extends StatelessWidget {
  final String jobTitle;
  final String jobPeriod;
  final String skills;

  const JobDetail({
    Key? key,
    required this.jobTitle,
    required this.jobPeriod,
    required this.skills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            jobTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(
            jobPeriod,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            skills,
            style: const TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
