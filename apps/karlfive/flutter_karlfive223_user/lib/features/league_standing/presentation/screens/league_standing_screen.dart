import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/common/widgets/app_scaffold.dart';
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
      body: SafeArea(
        child: Obx(() {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 180,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(league.name),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(league.imageUrl, fit: BoxFit.cover),
                      Container(color: Colors.black.withOpacity(0.3)),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const StandingHeaderTabs(currentIndex: 0),
                      const SizedBox(height: 12),
                      _body(controller),
                      const SizedBox(height: 20),
                      const StandingLegend(),
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
