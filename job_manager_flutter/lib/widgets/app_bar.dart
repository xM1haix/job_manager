import "package:flutter/material.dart";

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.isSearchOn,
    required this.switchToSearch,
    required this.controller,
    required this.closeSeach,
    required this.goToSettings,
    required this.focusNode,
    super.key,
  });
  final bool isSearchOn;
  final void Function() closeSeach;
  final void Function() goToSettings;
  final void Function() switchToSearch;
  final FocusNode focusNode;
  final TextEditingController controller;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.isSearchOn ? Colors.transparent : null,
      leading: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: IconButton(
          key: Key(widget.isSearchOn.toString()),
          onPressed:
              widget.isSearchOn ? widget.closeSeach : widget.goToSettings,
          icon: Icon(
            widget.isSearchOn ? Icons.close : Icons.account_circle_outlined,
          ),
        ),
      ),
      title: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: widget.isSearchOn
            ? SearchBar(
                focusNode: widget.focusNode,
                controller: widget.controller,
                // onSubmitted: (value) => init(),
                // onChanged: (v) => init(),
                hintText: "Search team...",
                overlayColor: WidgetStateColor.transparent,
                shadowColor: WidgetStateColor.transparent,
                backgroundColor: WidgetStateColor.transparent,
                // onEditingComplete: _init,
                //   decoration: InputDecoration(
                //     border: InputBorder.none,

                // )
              )
            : const Text("Your teams!"),
      ),
      actions: [
        IconButton(
          onPressed: widget.switchToSearch,
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
