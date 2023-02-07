import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hr/mvvm/ui/widgets/list_events/list_events_view_model.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/event_model.dart';
import 'detail_event_view_model.dart';

class DetailEvent extends StatelessWidget {
  Event selectedEvent;

  DetailEvent(this.selectedEvent, {super.key});

  void _show(BuildContext ctx) {
    showModalBottomSheet(
      elevation: 1,
      backgroundColor: Colors.white,
      context: ctx,
      builder: (ctx) => SizedBox(
        height: 60,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text("По всем вопросам"),
              onTap: () {
                print("Copy");
              },
              trailing: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("sport_art@dme.ru"),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final viewModel = DetailEventViewModel();
  @override
  Widget build(BuildContext context) {
    final _viewModel = DetailEventViewModel();
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Image.asset(selectedEvent.url![0]),
            ),
            const Divider(
              thickness: 1,
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Icon(
                        Icons.watch_later_outlined,
                      ),
                    ),
                    Text(selectedEvent.dateEnd),
                    Text(selectedEvent.dateStart)
                  ]),
                  SizedBox(
                    width: 150,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Icon(
                          Icons.location_on_sharp,
                        ),
                      ),
                      Text(
                        "ДОМОДЕДОВО",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Здание УЦ, кабинет уточняется",
                        textAlign: TextAlign.center,
                      )
                    ]),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text(
                'Следить за событиями',
              ),
              trailing: Switch(
                  value: _viewModel.switcher(),
                  onChanged: (value) {
                    _viewModel.switcher();
                  }),
            ),
            Divider(
              color: Colors.grey[300],
              indent: 70,
              thickness: 1,
              height: 1,
            ),
            ListTile(
              onTap: () => _show(context),
              leading: Icon(Icons.email),
              title: Text(
                'Email для обратной связи',
              ),
              trailing: Icon(Icons.keyboard_arrow_right_rounded),
            ),
            Divider(
              color: Colors.grey[300],
              indent: 70,
              thickness: 1,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Турник в DME по шахматам',
                      style: TextStyle(fontSize: 22)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      'assets/imgs/default_img_card.png',
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                        'Приглашаем вас поучастововать во внутреннем турнире по шахматам в DME!'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                        'Приходите поболеть за своих коллег или же побороться за звание лучшего шахматиста DME.'),
                  ),
                  Text(
                      'Принимаем ваши заявки на участие до 17 ноября на почту во вложениях.'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
