import 'package:auction_app/app/res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPopupMenu extends StatelessWidget {
  final List<String> items;
  final RxString selectedValue;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color borderColor;

  const CustomPopupMenu({
    Key? key,
    required this.items,
    required this.selectedValue,
    this.padding = const EdgeInsets.all(12),
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.borderColor = const Color(0xFFCCCCCC),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        selectedValue.value = value;
      },
      initialValue: selectedValue.value,
      itemBuilder: (BuildContext context) => items
          .map((item) => PopupMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
      child: Container(
        width: double.infinity,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Obx(() => Text(
                  selectedValue.value,
                  style: context.bodySmall,
                )),
            const Spacer(),
            const Icon(Icons.arrow_drop_down, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
