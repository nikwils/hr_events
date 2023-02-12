import 'package:flutter/material.dart';

import '../../../domain/models/event_model.dart';
import 'detail_event_view_model.dart';

class DetailEvent extends StatelessWidget {
  Event selectedEvent;

  DetailEvent(this.selectedEvent, {super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: selectedEvent.picture.toString() != ''
                  ? Image.network(selectedEvent.picture.toString())
                  : Image.asset('assets/imgs/default_img_card.png'),
            ),
            const Divider(
              thickness: 1,
            ),
            _TimeADateOfEvent(selectedEvent),
            _ListTileCreate('notifications', selectedEvent),
            const _Divider(),
            _ListTileCreate('email', selectedEvent),
            const _Divider(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: _DescColumn(selectedEvent),
            )
          ],
        ),
      ),
    );
  }
}

class _TimeADateOfEvent extends StatelessWidget {
  Event selectedEvent;

  _TimeADateOfEvent(this.selectedEvent);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Icon(
                Icons.watch_later_outlined,
              ),
            ),
            Text(selectedEvent.dateStart == ''
                ? selectedEvent.dateStart
                : "Cкоро"),
            Text(selectedEvent.timeStart ?? "Скоро")
          ]),
          SizedBox(
            width: 150,
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Icon(
                  Icons.location_on_sharp,
                ),
              ),
              Text(
                selectedEvent.location ?? "Аэропорт город",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                selectedEvent.address ?? "Аэропорт здание",
                textAlign: TextAlign.center,
              )
            ]),
          )
        ],
      ),
    );
  }
}

class _ListTileCreate extends StatefulWidget {
  final String _typeListTile;
  final Event _selectedEvent;
  _ListTileCreate(this._typeListTile, this._selectedEvent, {super.key});

  @override
  State<_ListTileCreate> createState() => _ListTileCreateState();
}

class _ListTileCreateState extends State<_ListTileCreate> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final viewModel = DetailEventViewModel();

    if (widget._typeListTile == 'notifications') {
      return ListTile(
        leading: const Icon(Icons.notifications),
        title: const Text(
          'Следить за событиями',
        ),
        trailing: Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
            viewModel.switcher(isSwitched);
          },
        ),
      );
    } else {
      return ListTile(
        onTap: () => viewModel.show(context, widget._selectedEvent),
        leading: const Icon(Icons.email),
        title: const Text(
          'Email для обратной связи',
        ),
        trailing: const Icon(Icons.keyboard_arrow_right_rounded),
      );
    }
  }
}

class _Divider extends StatelessWidget {
  const _Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey[300],
      indent: 70,
      thickness: 1,
      height: 1,
    );
  }
}

class _DescColumn extends StatelessWidget {
  Event _selectedEvent;
  _DescColumn(this._selectedEvent, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_selectedEvent.name, style: TextStyle(fontSize: 22)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: _selectedEvent.picture.toString() != ''
              ? Image.network(_selectedEvent.picture.toString())
              : Image.asset('assets/imgs/default_img_card.png'),
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
    );
  }
}
