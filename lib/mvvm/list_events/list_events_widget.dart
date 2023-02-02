import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../detail_event/detail_event_screen.dart';

class HrList extends StatelessWidget {
  HrList({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime _today = DateTime.now();
  DateTime _firstDate = DateTime.now().subtract(const Duration(days: 7));
  bool _formValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
          ),
          padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
          width: double.infinity,
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Поиск...',
                prefixIcon: IconButton(
                  alignment: Alignment.topLeft,
                  icon: Icon(Icons.calendar_month,
                      color: Theme.of(context).primaryColor),
                  onPressed: () {
                    print('object');
                    showDatePicker(
                      context: context,
                      firstDate: _firstDate,
                      initialDate: _today,
                      lastDate: _today,
                    );
                  },
                ),
                suffixIcon: _formValue
                    ? Icon(
                        Icons.close,
                        color: Colors.grey,
                      )
                    : null),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 20),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(DetailEventScreen.routeName);
                },
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Image.asset(
                          'assets/imgs/default_img_card.png',
                          height: 100,
                          alignment: Alignment.center,
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: const EdgeInsets.all(
                          10,
                        ),
                        height: 126,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Турник в ДМЕ по шахматам',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(DateFormat.yMMMEd().format(DateTime.now())),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                "Внутренний турник ДМЕ по шахматам состоится 19 ноября"),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
