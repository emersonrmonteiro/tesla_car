import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_car/constrains.dart';
import 'package:tesla_car/screens/home_controller.dart';

import 'components/battery_status.dart';
import 'components/door_lock.dart';
import 'components/tesla_bottom_navigationbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _controller = HomeController();
  late AnimationController _batteryAnimationController;
  late Animation<double> _animationBattery;
  late Animation<double> _animationBatteryStatus;

  void setupBatteryAnimation() {
    _batteryAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animationBattery = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: const Interval(0.0, 0.5),
    );

    _animationBatteryStatus = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: const Interval(0.6, 1),
    );
  }

  @override
  void initState() {
    setupBatteryAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_controller, _batteryAnimationController]),
      builder: (context, _) {
        return Scaffold(
          bottomNavigationBar: TeslaButtomNavigationBar(
            onTap: (index) {
              if (index == 1) {
                _batteryAnimationController.forward();
              } else if (_controller.selectedButtomTab == 1 && index != 1) {
                _batteryAnimationController.reverse(from: 0.7);
              }
              _controller.onButtomNavigationTabChange(index);
            },
            selectedTab: _controller.selectedButtomTab,
          ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constrains) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constrains.maxHeight * 0.1),
                      child: SvgPicture.asset(
                        'assets/icons/Car.svg',
                        width: double.infinity,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      right: _controller.selectedButtomTab == 0
                          ? constrains.maxWidth * 0.05
                          : constrains.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedButtomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: _controller.updateRightDoorLock,
                          isLock: _controller.isRightDoorLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      left: _controller.selectedButtomTab == 0
                          ? constrains.maxWidth * 0.05
                          : constrains.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedButtomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: _controller.updatLeftDoorLock,
                          isLock: _controller.isLeftDoorLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      top: _controller.selectedButtomTab == 0
                          ? constrains.maxHeight * 0.13
                          : constrains.maxHeight / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedButtomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: _controller.updatBonnetLock,
                          isLock: _controller.isBonnetLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      bottom: _controller.selectedButtomTab == 0
                          ? constrains.maxHeight * 0.17
                          : constrains.maxHeight / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedButtomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: _controller.updatTrunkLock,
                          isLock: _controller.isTrunkLock,
                        ),
                      ),
                    ),
                    // Battery
                    Opacity(
                      opacity: _animationBattery.value,
                      child: SvgPicture.asset(
                        'assets/icons/Battery.svg',
                        height: constrains.maxHeight * 0.36,
                      ),
                    ),
                    Positioned(
                      top: 50 * (1 - _animationBatteryStatus.value),
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      child: Opacity(
                          opacity: _animationBatteryStatus.value,
                          child: BatteryStatus(constrains: constrains)),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
