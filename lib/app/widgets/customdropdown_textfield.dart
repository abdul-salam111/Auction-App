import 'package:auction_app/app/res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFieldDropdownPopup extends StatefulWidget {
  final RxString selectedValue;
  final List<String> items;

  const CustomTextFieldDropdownPopup({
    Key? key,
    required this.selectedValue,
    required this.items,
  }) : super(key: key);

  @override
  State<CustomTextFieldDropdownPopup> createState() =>
      _CustomTextFieldDropdownPopupState();
}

class _CustomTextFieldDropdownPopupState
    extends State<CustomTextFieldDropdownPopup> {
  final LayerLink _layerLink = LayerLink();
  late TextEditingController _controller;
  OverlayEntry? _overlayEntry;
  final FocusNode _focusNode = FocusNode();
  final RxList<String> _filteredItems = <String>[].obs;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.selectedValue.value);
    _filteredItems.value = widget.items;

    // Add listener to handle focus changes
    _focusNode.addListener(_handleFocusChange);

    // Listen to external value changes
    ever(widget.selectedValue, (value) {
      if (_controller.text != value) {
        _controller.text = value;
      }
    });
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      _showOverlay();
    } else {
      _removeOverlay();
    }
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    _filteredItems.value = widget.items;

    final overlay = Overlay.of(context);
    if (overlay == null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: MediaQuery.of(context).size.width - 32,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0.0, 48.0),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: Obx(
              () => ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 300),
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 15),
                  shrinkWrap: true,
                  itemCount: _filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = _filteredItems[index];
                    return ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      visualDensity: const VisualDensity(vertical: -3),
                      title: Text(
                        item,
                        style: context.bodySmall!
                            .copyWith(color: AppColors.textColorSecondary),
                      ),
                      onTap: () {
                        _controller.text = item;
                        widget.selectedValue.value = item;
                        _removeOverlay();
                        _focusNode.unfocus();
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    _controller.dispose();
    _removeOverlay(); // Ensure overlay is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        onChanged: (value) {
          widget.selectedValue.value = value;
          _filteredItems.value = widget.items
              .where((item) => item.toLowerCase().contains(value.toLowerCase()))
              .toList();
        },
        style: context.bodySmall!.copyWith(color: AppColors.textColorPrimary),
        decoration: InputDecoration(
          fillColor: AppColors.halfwhiteColor,
          filled: true,
          hintText: 'Select or type...',
          contentPadding: const EdgeInsets.only(left: 10),
          hintStyle:
              context.bodySmall!.copyWith(color: AppColors.textColorSecondary),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(10)),
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}
