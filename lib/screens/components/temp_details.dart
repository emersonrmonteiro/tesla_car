import 'package:flutter/material.dart';

import '../../constrains.dart';
import '../../models/temp_details_model.dart';
import '../home_controller.dart';
import 'temp_button.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    Key? key,
    required HomeController controller,
    required this.tempDetails,
    required this.pressUp,
    required this.pressDown,
  })  : _controller = controller,
        super(key: key);

  final VoidCallback pressUp;
  final VoidCallback pressDown;
  final HomeController _controller;
  final TempDetailsModel tempDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TempButton(
                  isActive: _controller.isCoolSelected,
                  svgSrc: 'assets/icons/coolShape.svg',
                  title: 'Cool',
                  press: _controller.updateCoolselectedTab,
                ),
                const SizedBox(width: defaultPadding),
                TempButton(
                  isActive: !_controller.isCoolSelected,
                  svgSrc: 'assets/icons/heatShape.svg',
                  title: 'Heat',
                  activeColor: redColor,
                  press: _controller.updateCoolselectedTab,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: pressUp,
                icon: const Icon(
                  Icons.arrow_drop_up,
                  size: 48,
                ),
              ),
              Text(
                '${tempDetails.temp}\u2103',
                style: const TextStyle(fontSize: 86),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: pressDown,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 48,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text('CURRENT TEMPERATURE'),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Inside'.toUpperCase(),
                  ),
                  Text(
                    '${tempDetails.inside}\u2103',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
              const SizedBox(width: defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Outside'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                  Text(
                    '${tempDetails.outside}\u2103',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white54,
                        ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
