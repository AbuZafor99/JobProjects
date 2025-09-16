import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../core/common/widgets/app_bottom_nav_bar.dart';
import '../../../leagues/data/models/league_model.dart';
import '../controller/league_standing_controller.dart';
import '../widgets/standing_list_view.dart';
import '../widgets/standing_header_tabs.dart';
import '../widgets/standing_legend.dart';

class LeagueStandingScreen extends StatelessWidget {
  final LeagueModel league;
  const LeagueStandingScreen({super.key, required this.league});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      LeagueStandingController(repository: Get.find(), league: league),
      tag: 'standing-${league.id}',
    );
    return AppScaffold(
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: 1, // Matches tab is selected as shown in the image
        onTap: (index) {
          // Just handle the color change in the bottom nav bar
          // No navigation needed
        },
      ),
      body: SafeArea(
        child: Obx(() {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 200,
                backgroundColor: Colors.black,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Background image
                      Image.network(
                        league.imageUrl, 
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.red.shade900,
                          child: const Center(child: Icon(Icons.sports_tennis, size: 50, color: Colors.white)),
                        ),
                      ),
                      // Dark overlay
                      Container(color: Colors.black.withOpacity(0.5)),
                      // Content on top of the image
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Close and favorite buttons row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.close, color: Colors.white),
                                Row(
                                  children: [
                                    const Icon(Icons.star_border, color: Colors.white),
                                    const SizedBox(width: 16),
                                    const CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.orange,
                                      child: Icon(Icons.person, color: Colors.white, size: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // League name
                            Text(
                              league.name,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            // Tabs at the bottom of the header
                            const StandingHeaderTabs(currentIndex: 0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      _body(controller),
                      const SizedBox(height: 20),
                      const StandingLegend(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _body(LeagueStandingController controller) {
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
    return StandingListView(rows: controller.rows.toList());
  }
}
