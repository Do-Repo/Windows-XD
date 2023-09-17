import 'package:flutter/material.dart';
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
    decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
      Color(0XFF316AD6),
      Color(0XFF3884E6),
      Color(0XFF4793E8),
      Color(0XFF3782E5),
      Color(0XFF296EE0),
      Color(0XFF2561D9),
      Color(0XFF235AD6),
      Color(0XFF2258D5),
      Color(0XFF2257D5),
      Color(0XFF2257D5),
      Color(0XFF2257D6),
      Color(0XFF2157D7),
      Color(0XFF2259D7),
      Color(0XFF225AD9),
      Color(0XFF235BD9),
      Color(0XFF235CDB),
      Color(0XFF245DDB),
      Color(0XFF245EDC),
      Color(0XFF255FDC),
      Color(0XFF2660DD),
      Color(0XFF2661DD),
      Color(0XFF2662DE),
      Color(0XFF2662df),
      Color(0XFF2663e0),
      Color(0XFF2663e0),
      Color(0XFF2560de),
      Color(0XFF2560de),
      Color(0XFF1d4ec0),
      Color(0XFF1942a6)
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
  );

  Widget taskbarSplit = Container(
    height: 30,
    width: 1,
    decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
      Color(0XFF0A60CC),
      Color(0XFF14A3EC),
      Color(0XFF1ABFF6),
      Color(0XFF16AFF2),
      Color(0XFF14A5F0),
      Color(0XFF14A0EF),
      Color(0XFF149CEE),
      Color(0XFF149DEE),
      Color(0XFF149DEE),
      Color(0XFF149DEE),
      Color(0XFF159EED),
      Color(0XFF159EED),
      Color(0XFF159EED),
      Color(0XFF159EED),
      Color(0XFF149DEE),
      Color(0XFF149BED),
      Color(0XFF1198EE),
      Color(0XFF0F9BF0),
      Color(0XFF0F9CF1),
      Color(0XFF0F9DF1),
      Color(0XFF0E9FF2),
      Color(0XFF0EA2F3),
      Color(0XFF10A5F2),
      Color(0XFF10A9F2),
      Color(0XFF11AFF4),
      Color(0XFF13B5F4),
      Color(0XFF14B8F4),
      Color(0XFF15ACEF),
      Color(0XFF1489DB),
      Color(0XFF0A5ECA)
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
  );

  Widget taskbarEnd = Container(
    decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
      Color(0XFF0A60CC),
      Color(0XFF14A2EB),
      Color(0XFF19BAF3),
      Color(0XFF16A1EA),
      Color(0XFF1593E5),
      Color(0XFF1389E0),
      Color(0XFF1283DE),
      Color(0XFF1284DF),
      Color(0XFF1284DF),
      Color(0XFF1284E0),
      Color(0XFF1284E0),
      Color(0XFF1184E0),
      Color(0XFF1284E0),
      Color(0XFF1184E0),
      Color(0XFF0F83E0),
      Color(0XFF0F83E0),
      Color(0XFF0F83E0),
      Color(0XFF0E85E2),
      Color(0XFF0D86E5),
      Color(0XFF0C87E7),
      Color(0XFF0C89E8),
      Color(0XFF0D8CE9),
      Color(0XFF0D8FEB),
      Color(0XFF0D91EB),
      Color(0XFF0D90EB),
      Color(0XFF0F8FE9),
      Color(0XFF108CE6),
      Color(0XFF1387E2),
      Color(0XFF137AD9),
      Color(0XFF0A5DCA)
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
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
  const TaskbarBody(
      {super.key,
      required this.background,
      required this.height,
      required this.fit,
      this.children});
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
              mainAxisSize:
                  (fit == FlexFit.tight) ? MainAxisSize.max : MainAxisSize.min,
              children: children ?? [],
            ),
          )
        ],
      ),
    );
  }
}
