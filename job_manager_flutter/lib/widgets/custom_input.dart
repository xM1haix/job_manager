import "dart:async";

import "package:flutter/material.dart";
import "package:job_manager_flutter/widgets/edit_btn.dart";
import "package:job_manager_flutter/widgets/popup.dart";

class CustomInput extends StatefulWidget {
  const CustomInput({
    required this.onUpdate,
    required this.onCheck,
    required this.label,
    required this.initValue,
    super.key,
  });
  final String label;
  final String? initValue;
  final Future<void> Function(String) onUpdate;
  final Future<void> Function(String) onCheck;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

// TODO(xM1haix): Use this to update the state of the suffixIcon.
enum IconStatus { readOnly, editOn, checking, saving, saved }

class _CustomInputState extends State<CustomInput> {
  late final _controller = TextEditingController(text: widget.initValue);
  var _readOnly = true;
  var _loading = false;
  Timer? _timer;
  String? errorText;
  String? helperText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _onChanged,
      readOnly: _readOnly,
      controller: _controller,
      decoration: InputDecoration(
        helperText: helperText,
        helperStyle: const TextStyle(color: Colors.green),
        errorText: errorText,
        border: const OutlineInputBorder(),
        labelText: widget.label,
        suffixIcon: Container(
          alignment: Alignment.center,
          height: 30,
          width: 30,
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: _loading
                ? const CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.green,
                    padding: EdgeInsets.all(10),
                  )
                : _readOnly
                    ? EditBtn(onPressed: _enableEdit)
                    : IconButton(
                        onPressed: _save,
                        icon: const Icon(
                          Icons.done,
                          color: Colors.green,
                        ),
                      ),
          ),
        ),
      ),
    );
  }

  void _enableEdit() => setState(() => _readOnly = false);
  Future<void> _onChanged(String value) async {
    if (!_loading) {
      setState(() {
        _loading = true;
      });
    } else {
      _timer?.cancel();
      if (_timer != null) {
        setState(() {
          _timer = null;
        });
      }
    }
    _timer = Timer(const Duration(seconds: 1), () async {
      if (value == widget.initValue) {
        setState(() {
          errorText = "Same value";
        });
      }
      await widget.onCheck(value);
      setState(() {
        _loading = false;
      });
    });
  }

  Future<void> _save() async {
    setState(() {
      _readOnly = true;
    });
    try {
      await widget.onUpdate(_controller.text);
    } catch (e) {
      if (!mounted) {
        return;
      }
      await errorPopup(context, e);
    }
  }
}
