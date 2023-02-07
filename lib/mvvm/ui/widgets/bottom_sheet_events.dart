import 'package:flutter/material.dart';

class BottomSheetEvents {
  BottomSheetEvents.show(ctx) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: ctx,
      builder: (ctx) => SizedBox(
        height: 185,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
                visualDensity: const VisualDensity(vertical: -3),
                title: const Text("Новости и события",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  print("Новости и события");
                }),
            ListTile(
                visualDensity: const VisualDensity(vertical: -3),
                title: const Text("Новости"),
                onTap: () {
                  print("Новости");
                }),
            ListTile(
                visualDensity: const VisualDensity(vertical: -3),
                title: const Text("Cобытия"),
                onTap: () {
                  print("Cобытия");
                }),
            const Divider(
              color: Color.fromARGB(255, 193, 192, 192),
              thickness: 1,
              height: 2,
              indent: 0,
            ),
            ListTile(
              visualDensity: const VisualDensity(vertical: -3),
              title: const Text("Отмена"),
              onTap: () {
                Navigator.pop(ctx);
              },
            ),
          ],
        ),
      ),
    );
  }
}
