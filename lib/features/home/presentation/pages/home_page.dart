import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octocoin/features/home/presentation/widgets/course_card.dart';
import 'package:octocoin/features/home/presentation/widgets/course_type_chip.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 24),
          Container(
            height: 160,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  'Courses',
                  style: GoogleFonts.notoSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) {
                return CourseTypeChip(
                  selected: _selectedType == index,
                  onTap: () => setState(() {
                    if (_selectedType == index) {
                      _selectedType = null;
                    } else {
                      _selectedType = index;
                    }
                  }),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemCount: 12,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 4 / 3,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemBuilder: (context, index) {
              return const CourseCard();
            },
            itemCount: 5,
          )
        ],
      ),
    );
  }
}
