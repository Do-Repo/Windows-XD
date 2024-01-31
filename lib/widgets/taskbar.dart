import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:my_portfolio/widgets/start_button.dart';

class TaskBar extends StatefulWidget {
  const TaskBar({
    super.key,
    required this.taskbarItems,
    required this.optionbarItems,
  });

  final List<Widget> taskbarItems, optionbarItems;

  @override
  State<TaskBar> createState() => _TaskBarState();
}

class _TaskBarState extends State<TaskBar> {
  Widget taskbarStart = Container(
    decoration: BoxDecoration(gradient: Constants.taskbarStart),
  );

  Widget taskbarSplit = Container(
    height: 30,
    width: 1,
    decoration: BoxDecoration(gradient: Constants.taskbarSplit),
  );

  Widget taskbarEnd = Container(
    decoration: BoxDecoration(gradient: Constants.taskbarEnd),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          width: 100,
          child: Stack(
            children: [
              Positioned.fill(
                child: TaskbarBody(
                  background: taskbarStart,
                  height: 30,
                  fit: FlexFit.loose,
                ),
              ),
              const StartButton(),
            ],
          ),
        ),
        Flexible(
          child: TaskbarBody(
            fit: FlexFit.tight,
            height: 30,
            background: taskbarStart,
            children: widget.taskbarItems,
          ),
        ),
        taskbarSplit,
        TaskbarBody(
          height: 30,
          fit: FlexFit.loose,
          background: taskbarEnd,
          children: widget.optionbarItems,
        ),
      ],
    );
  }
}

class TaskbarBody extends StatelessWidget {
  const TaskbarBody({super.key, required this.background, required this.height, required this.fit, this.children});
  final Widget background;
  final FlexFit fit;
  final double height;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(child: background),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: (fit == FlexFit.tight) ? MainAxisSize.max : MainAxisSize.min,
              children: children ?? [],
            ),
          )
        ],
      ),
    );
  }
}
