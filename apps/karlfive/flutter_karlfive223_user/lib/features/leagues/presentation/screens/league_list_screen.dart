import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/league_model.dart';
import '../controller/league_controller.dart';

class LeagueListScreen extends StatelessWidget {
  LeagueListScreen({super.key});

  final LeagueController controller = Get.find<LeagueController>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.errorMessage.value.isNotEmpty) {
            return Center(
              child: Text(
                controller.errorMessage.value,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) => _LeagueCard(
              league: controller.leagues[index],
              onTap: () => Get.toNamed(
                '/league-standing',
                arguments: controller.leagues[index],
              ),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemCount: controller.leagues.length,
          );
        }),
      ),
    );
  }
}

class _LeagueCard extends StatelessWidget {
  final LeagueModel league;
  final VoidCallback? onTap;
  const _LeagueCard({required this.league, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(league.imageUrl, fit: BoxFit.cover),
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                league.name,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              right: 12,
              bottom: 12,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.white.withOpacity(0.9),
                child: const Icon(
                  Icons.info_outline,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
