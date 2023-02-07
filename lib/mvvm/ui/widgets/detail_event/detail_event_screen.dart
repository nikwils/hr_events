import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'detail_event_view_model.dart';
import 'detail_event_widget.dart';

class DetailEventScreen extends StatefulWidget {
  DetailEventScreen({super.key});
  static const routeName = '/detail-event';

  @override
  State<DetailEventScreen> createState() => _DetailEventScreenState();
}

class _DetailEventScreenState extends State<DetailEventScreen> {
  @override
  Widget build(BuildContext context) {
    final eventId = ModalRoute.of(context)?.settings.arguments;
    DetailEventViewModel viewModel = DetailEventViewModel();
    // final selectedEvent = viewModel.findById(eventId);
    final selectedUser2 =
        context.read<DetailEventViewModel>().findById(eventId);

    return Scaffold(
        appBar: AppBar(title: Text('\$Названия меропярития')),
        body: SafeArea(child: DetailEvent(selectedUser2)));
  }
}
