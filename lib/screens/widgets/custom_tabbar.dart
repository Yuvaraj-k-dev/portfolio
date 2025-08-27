import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/constraints/colors.dart';

class CustomTabSection extends StatefulWidget {
  const CustomTabSection({super.key});

  @override
  State<CustomTabSection> createState() => _CustomTabSectionState();
}

class _CustomTabSectionState extends State<CustomTabSection>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final List<String> certificateImages = [
    "assets/images/dsa.jpg",
  ];

  final List<Map<String, String>> skills = [
    {"name": "Flutter", "icon": "assets/images/flutter.png"},
    {"name": "Dart", "icon": "assets/images/dart.png"},
    {"name": "Firebase", "icon": "assets/images/firebase.png"},
    {"name": "Git", "icon": "assets/images/git.png"},
    {"name": "C++", "icon": "assets/images/Cpp.png"},
    {"name": "Python", "icon": "assets/images/python.png"},
    {"name": "Java", "icon": "assets/images/java.png"},
  ];

  final List<Map<String, dynamic>> projects = [
    {
      "name": "E-Commerce App",
      "icon": Icons.shopping_cart,
      "images": [
        "assets/images/ecommerce1.jpg",
        "assets/images/ecommerce2.jpg",
        "assets/images/ecommerce3.jpg",
        "assets/images/ecommerce4.jpg",
        "assets/images/ecommerce5.jpg",
      ]
    },
    {
      "name": "Tool App",
      "icon": Icons.build,
      "images": [
        "assets/images/tools1.jpg",
      ]
    },
    {
      "name": "demo App",
      "icon": Icons.developer_mode,
      "images": [
        "assets/images/demo1.jpg",
      ]
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size.width * 0.6,
          decoration: BoxDecoration(
            color: AppColors.ebony,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: AppColors.studio,
            tabs: const [
              Tab(text: "Skills"),
              Tab(text: "Projects"),
              Tab(text: "Certificates"),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: size.height * 0.6,
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildSkillsList(),
              ProjectGridView(projects: projects),
              CertificateGrid(images: certificateImages),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsList() {
    return Center(
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: skills.map((skill) {
          return SkillChip(
            name: skill["name"]!,
            iconPath: skill["icon"]!,
          );
        }).toList(),
      ),
    );
  }
}

//GalleryGrid widget to display images in a grid format

class ProjectGridView extends StatelessWidget {
  final List<Map<String, dynamic>> projects;

  const ProjectGridView({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    int crossAxisCount;
    if (width < 600) {
      crossAxisCount = 1; // Mobile
    } else if (width < 1024) {
      crossAxisCount = 2; // Tablet
    } else {
      crossAxisCount = 3; // Desktop
    }
    return GridView.builder(
      shrinkWrap: false,
      // physics: NeverScrollableScrollPhysics(),
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: width < 600 ? 1 : 4 / 3,
      ),
      itemBuilder: (context, index) {
        final project = projects[index];
        return ProjectCard(
          name: project['name'],
          icon: project['icon'],
          images: project['images'],
        );
      },
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final List<String> images;

  const ProjectCard({
    super.key,
    required this.name,
    required this.icon,
    required this.images,
  });

  void _showImagesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: InteractiveViewer(
          child: SizedBox(
            height: 850,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              separatorBuilder: (_, __) => const SizedBox(width: 20),
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(images[index], fit: BoxFit.contain),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: Colors.white, size: 36),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () => _showImagesDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.studio,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("View"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileScreenMockup extends StatelessWidget {
  final String imagePath;
  const MobileScreenMockup({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 19.5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String name;
  final String iconPath;

  const SkillChip({super.key, required this.name, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: AppColors.ebony,
      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
      avatar: Image.asset(
        iconPath,
        width: 30,
        height: 30,
        fit: BoxFit.contain,
      ),
      label: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

//Certificate Grid Display View

class CertificateGrid extends StatelessWidget {
  final List<String> images;
  const CertificateGrid({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 4 / 3,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return CertificateCard(imagePath: images[index]);
      },
    );
  }
}

class CertificateCard extends StatelessWidget {
  final String imagePath;
  const CertificateCard({super.key, required this.imagePath});

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: InteractiveViewer(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: () => _showImageDialog(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.studio,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "View",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
