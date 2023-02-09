import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'detail_event_view_model.dart';
import 'detail_event_widget.dart';

class DetailEventScreen extends StatelessWidget {
  DetailEventScreen({super.key});
  static const routeName = '/detail-event';

  @override
  Widget build(BuildContext context) {
    final eventId = ModalRoute.of(context)?.settings.arguments;

    final vm = context.watch<DetailEventViewModel>();
    print('ошибка после');
    final selectedEvent = vm.findById(eventId);

    return Scaffold(
        appBar: AppBar(title: Text(selectedEvent.name)),
        body: SafeArea(child: DetailEvent(selectedEvent)));
  }
}
