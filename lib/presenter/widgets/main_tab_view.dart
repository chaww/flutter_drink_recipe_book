import 'package:flutter/material.dart';

class MainTabData {
  final Widget child;
  final Widget label;

  const MainTabData({
    required this.label,
    required this.child,
  });
}

class MainTabView extends StatelessWidget {
  final List<MainTabData> tabs;
  final Animation<double>? paddingAnimation;

  const MainTabView({
    super.key,
    required this.tabs,
    this.paddingAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTopAnimatedPadding(),
            _buildTabBar(),
            _buildTabContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopAnimatedPadding() {
    if (paddingAnimation == null) {
      return const SizedBox(height: 6);
    }

    return AnimatedBuilder(
      animation: paddingAnimation!,
      builder: (context, _) => SizedBox(
        height: (1 - paddingAnimation!.value) * 16 + 6,
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      labelPadding: const EdgeInsets.symmetric(vertical: 16),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 2,
      // indicatorColor: Colors.grey,
      dividerColor: Colors.transparent,
      tabs: tabs.map((tab) => tab.label).toList(),
    );
  }

  Widget _buildTabContent() {
    return Expanded(
      child: TabBarView(
        children: tabs.map((tab) => tab.child).toList(),
      ),
    );
  }
}
