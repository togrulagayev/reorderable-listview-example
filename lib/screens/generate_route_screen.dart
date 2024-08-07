import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/route_screen/custom_list_tile.dart';
import '../widgets/route_screen/destination_field.dart';
import '../widgets/route_screen/draggable_destination_field.dart';

class GenerateRouteScreen extends StatefulWidget {
  const GenerateRouteScreen({super.key});

  @override
  State<GenerateRouteScreen> createState() => _GenerateRouteScreenState();
}

class _GenerateRouteScreenState extends State<GenerateRouteScreen> {
  final _currentLocationController = TextEditingController();
  final _destinationController = TextEditingController();
  List<TextEditingController> _destinationControllers = [];
  bool _hasOneDestination = true;
  final Map<String, String> _savedAddresses = {
    'Home': '8A, Gurban Khalilov str.',
    'Work': '9B, Fatali Khan str.',
  };
  final List<String> _pastAddresses = [
    'Baku International Airport',
    'Heydar Aliyev Center',
    'Flame Towers',
  ];
  @override
  void initState() {
    super.initState();
    _destinationControllers = [_currentLocationController, _destinationController];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.primaryColor,
        leading: const CloseButton(
          style: ButtonStyle(
            iconSize: MaterialStatePropertyAll(30),
          ),
        ),
        title: const Text(
          'Your Route',
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            iconSize: 30,
            onPressed: () {
              setState(() {
                _hasOneDestination = false;
                _destinationControllers.add(TextEditingController());
              });
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          /// Təyinat nöqtəsi 1 ünvandısa normal halda yerləşir
          if (_hasOneDestination) ...[
            CustomDestinationField(
              controller: _currentLocationController,
              hintText: 'Your location',
              icon: Icons.location_on,
              onChanged: (value) {
                _currentLocationController.text = value;
              },
            ),
            const SizedBox(height: 20),
            CustomDestinationField(
              controller: _destinationController,
              hintText: 'Destination',
              icon: Icons.search,
              onTap: () {
                /// Open map screen
              },
              onChanged: (value) {
                _destinationController.text = value;
              },
            ),
          ],

          /// Təyinat nöqtəsi 1-dən çox ünvandısa draggable halda yerləşir
          if (!_hasOneDestination)
            SizedBox(
              height: 80 * _destinationControllers.length.toDouble(),
              child: ReorderableListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    key: ValueKey(index),
                    padding: const EdgeInsets.only(bottom: 20),
                    child: DraggableDestinationField(
                      // key: ValueKey(index),
                      isFirst: index == 0,
                      icon: Icons.search,
                      controller: _destinationControllers[index],
                      hintText: index == 0 ? 'Your Locaton' : 'Destination $index ',
                      onRemove: () {
                        setState(() {
                          _destinationControllers.removeAt(index);
                          if (_destinationControllers.length == 2) {
                            _hasOneDestination = true;
                          }
                        });
                      },
                      onDrag: () {
                        setState(() {
                          _hasOneDestination = true;
                          _destinationController.text = _destinationControllers[index].text;
                          _destinationControllers.removeAt(index);
                        });
                      },
                    ),
                  );
                },
                itemCount: _destinationControllers.length,
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final item = _destinationControllers.removeAt(oldIndex);
                    _destinationControllers.insert(newIndex, item);
                  });
                },
              ),
            ),
          if (_savedAddresses.isNotEmpty)
            ..._savedAddresses.keys.map(
              (e) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomListTile(
                    icon: setIcon(e),
                    title: e,
                    subtitle: _savedAddresses[e]!,
                    onTap: () {
                      if (_hasOneDestination) {
                        _destinationController.text = _savedAddresses[e]!;
                      } else {
                        _destinationControllers.last.text = _savedAddresses[e]!;
                      }
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
          if (_pastAddresses.isNotEmpty)
            ..._pastAddresses.map(
              (e) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomListTile(
                    icon: Icons.history,
                    title: e,
                    // subtitle: e,
                    onTap: () {
                      if (_hasOneDestination) {
                        _destinationController.text = e;
                      } else {
                        _destinationControllers.last.text = e;
                      }
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
        ],
      ),
    );
  }

  IconData setIcon(String title) {
    switch (title) {
      case 'Instant request':
        return Icons.access_time;
      case 'Home':
        return Icons.home_outlined;
      case 'Work':
        return Icons.work_outline;
      default:
        return Icons.location_on;
    }
  }
}
