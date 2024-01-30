import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ['ทั้งหมด', 'ชา', 'กาแฟ', 'สมูทตี้', 'โซดา', 'อื่นๆ'];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.wb_sunny_outlined),
                  )
                ],
              ),
              const SizedBox(height: 64),
              const Placeholder(
                child: SizedBox(height: 120, width: 240),
              ),
              const SizedBox(height: 64),
              const Text('สูตรเครื่องดื่ม'),
              const SizedBox(height: 64),
              const Row(
                children: [
                  Text('ประเภทของเครื่องดื่ม'),
                  Spacer(),
                ],
              ),
              GridView(
                padding: const EdgeInsets.symmetric(vertical: 36),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.58,
                  mainAxisSpacing: 15,
                ),
                children: [
                  ...category.map(
                    (e) => Card(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(e),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
