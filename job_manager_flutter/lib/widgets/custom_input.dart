import 'dart:async';

import 'package:flutter/material.dart';
import 'package:job_manager_flutter/widgets/edit_btn.dart';
import 'package:job_manager_flutter/widgets/popup.dart';

class CustomInput extends StatefulWidget {
  final String label;
  final String? initValue;
  final Future<void> Function(String) onUpdate, onCheck;
  const CustomInput({
    super.key,
    required this.onUpdate,
    required this.onCheck,
    required this.label,
    required this.initValue,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

//TODO: Use this to update the state of the suffixIcon
enum IconStatus { readOnly, editOn, checking, saving, saved }

class _CustomInputState extends State<CustomInput> {
  late final _controller = TextEditingController(text: widget.initValue);
  var _readOnly = true, _loading = false;
  Timer? _timer;
  String? errorText, helperText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _onChanged,
      readOnly: _readOnly,
      controller: _controller,
      decoration: InputDecoration(
        helperText: helperText,
        helperStyle: TextStyle(color: Colors.green),
        errorText: errorText,
        border: OutlineInputBorder(),
        labelText: widget.label,
        suffixIcon: Container(
          alignment: Alignment.center,
          height: 30,
          width: 30,
          child: AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: _loading
                ? CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.green,
                    padding: EdgeInsets.all(10),
                  )
                : _readOnly
                    ? EditBtn(onPressed: _enableEdit)
                    : IconButton(
                        onPressed: _save,
                        icon: Icon(
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
    _timer = Timer(Duration(seconds: 1), () async {
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
      if (!mounted) return;
      errorPopup(context, e);
    }
  }
}
