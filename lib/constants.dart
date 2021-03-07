import 'package:flutter/material.dart';

const appTitle = 'Routers demo application';

const contentPadding = EdgeInsets.symmetric(
  vertical: 10.0,
  horizontal: 20.0,
);

const borderSide = BorderSide(
  color: Colors.grey,
  width: 2.0,
);

const thinBorderSide = BorderSide(
  color: Colors.grey,
  width: 1.0,
);

const border = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(5.0),
  ),
);

const enabledBorder = OutlineInputBorder(
  borderSide: thinBorderSide,
  borderRadius: BorderRadius.all(
    Radius.circular(5.0),
  ),
);

const focusedBorder = OutlineInputBorder(
  borderSide: borderSide,
  borderRadius: BorderRadius.all(
    Radius.circular(5.0),
  ),
);

const inputDecoration = InputDecoration(
  hintText: '', // This value always replaced with new one on create.
  contentPadding: contentPadding,
  border: border,
  enabledBorder: enabledBorder,
  focusedBorder: focusedBorder,
);
