import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/image_resource.dart';
import 'package:my_portfolio/widgets/start_button.dart';

class TaskBar extends StatelessWidget {
  const TaskBar({
    super.key,
    required this.taskbarItems,
    required this.optionbarItems,
  });

  final List<Widget> taskbarItems, optionbarItems;

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
                  bodyPart: ImageResources().taskbarStart,
                  height: 30,
                  imageRepeat: ImageRepeat.repeatX,
                  fit: FlexFit.loose,
                ),
              ),
              const StartButton(),
            ],
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: TaskbarBody(
            bodyPart: ImageResources().taskbarStart,
            height: 30,
            fit: FlexFit.tight,
            imageRepeat: ImageRepeat.repeatX,
            children: taskbarItems,
          ),
        ),
        TaskbarBody(
            bodyPart: ImageResources().taskbarSplit,
            height: 30,
            imageRepeat: ImageRepeat.noRepeat,
            fit: FlexFit.loose,
            children: optionbarItems),
        TaskbarBody(
            bodyPart: ImageResources().taskbarEnd,
            height: 30,
            imageRepeat: ImageRepeat.repeatX,
            fit: FlexFit.loose,
            children: optionbarItems),
      ],
    );
  }
}

class TaskbarBody extends StatelessWidget {
  const TaskbarBody(
      {super.key,
      required this.imageRepeat,
      required this.bodyPart,
      required this.height,
      required this.fit,
      this.children});
  final String bodyPart;
  final FlexFit fit;
  final double height;
  final List<Widget>? children;
  final ImageRepeat imageRepeat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: (imageRepeat == ImageRepeat.noRepeat)
          ? Image.asset(
              bodyPart,
              height: height,
              fit: BoxFit.contain,
            )
          : Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                    child: Image.asset(
                  bodyPart,
                  gaplessPlayback: true,
                  fit: BoxFit.contain,
                  height: height,
                  repeat: imageRepeat,
                )),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: (fit == FlexFit.tight)
                        ? MainAxisSize.max
                        : MainAxisSize.min,
                    children: children ?? [],
                  ),
                )
              ],
            ),
    );
  }
}
