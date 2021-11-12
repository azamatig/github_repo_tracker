import 'package:flutter/material.dart';

Widget nameStyle(
  String text,
) {
  return Text(
    text.split('/').last,
    overflow: TextOverflow.ellipsis,
    style: const TextStyle(
        fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
  );
}

Widget roundContainer(String text, int count) {
  return Container(
    height: 30,
    width: 65,
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(18.0)),
      border: Border.all(width: 1.0, color: Colors.white),
    ),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            count.toString(),
            style: const TextStyle(fontSize: 9),
          ),
          const SizedBox(width: 2),
          Text(
            text,
            style: const TextStyle(fontSize: 9),
          )
        ],
      ),
    ),
  );
}

Widget timeIntervalText(DateTime pushedAt) {
  final _time = DateTime.now().compareTo(pushedAt);
  if (_time == 1) {
    return Text(
      _time.toString() + ' day ago',
      style: const TextStyle(
          fontSize: 8, color: Colors.white, fontWeight: FontWeight.w700),
    );
  }
  return Text(
    _time.toString() + ' days ago ',
    style: const TextStyle(
        fontSize: 8, color: Colors.white, fontWeight: FontWeight.w700),
  );
}

Widget timeIntervalOwnerName(
  String text,
) {
  return SizedBox(
    width: 65,
    child: Text(
      ' by ' + text,
      style: const TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 8,
          color: Colors.white,
          fontWeight: FontWeight.w500),
    ),
  );
}
