import 'package:flutter/material.dart';
import 'package:todo/component/todo_badge.dart';

class IconPicker extends StatefulWidget {
  final ValueChanged<IconData> onIconChanged;
  final IconData currentIconData;
  final Color highlightColor, unHighlightColor;

  final List<IconData> icons = [
    Icons.accessibility_new,
    Icons.brush,
    Icons.business_center,
    Icons.cake,
    Icons.color_lens,
    Icons.code,
    Icons.create,
    Icons.delete_outline,
    Icons.directions_run,
    Icons.directions_car,
    Icons.directions_boat,
    Icons.local_airport,
    Icons.directions_subway,
    Icons.euro_symbol,
    Icons.favorite_border,
    Icons.movie_creation,
    Icons.local_phone,
    Icons.local_play,
    Icons.music_note,
    Icons.pets,
    Icons.restaurant,
    Icons.school,
    Icons.tag_faces,
  ];

  IconPicker({
    required this.currentIconData,
    required this.onIconChanged,
    Color? highlightColor,
    Color? unHighlightColor,
  })  : this.highlightColor = highlightColor ?? Colors.red,
        this.unHighlightColor = unHighlightColor ?? Colors.blueGrey;

  @override
  State<StatefulWidget> createState() {
    return _IconPickerState();
  }
}

class _IconPickerState extends State<IconPicker> {
  late IconData selectedIconData;

  @override
  void initState() {
    selectedIconData = widget.currentIconData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      width: orientation == Orientation.portrait ? 300.0 : 300.0,
      height: orientation == Orientation.portrait ? 360.0 : 200.0,
      child: GridView.builder(
        itemBuilder: (BuildContext context, int index) {
          var iconData = widget.icons[index];
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIconData = iconData;
                });
                widget.onIconChanged(iconData);
              },
              borderRadius: BorderRadius.circular(50.0),
              child: TodoBadge(
                id: iconData.hashCode.toString(),
                codePoint: iconData.codePoint,
                outlineColor: iconData == selectedIconData
                    ? widget.highlightColor
                    : widget.unHighlightColor,
                color: iconData == selectedIconData
                    ? widget.highlightColor
                    : widget.unHighlightColor,
                size: 32,
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: orientation == Orientation.portrait ? 4 : 6,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemCount: widget.icons.length,
      ),
    );
  }
}
