import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../detail_event/detail_event_screen.dart';
import 'list_events_view_model.dart';

class ListEvents extends StatefulWidget {
  ListEvents({super.key});

  @override
  State<ListEvents> createState() => _ListEventsState();
}

class _ListEventsState extends State<ListEvents> {
  final _viewModel = ListEventsViewModel();

  // @override
  // void initState() {
  //   // Start listening to changes.
  //   _viewModel.controllerSearch.addListener(_viewModel.printLatestValue);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _viewModel.controllerSearch.dispose();
  //   super.dispose();
  // }

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
            controller: _viewModel.controllerSearch,
            onChanged: (value) {
              // Call setState to update the UI
              setState(() {});
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Поиск...',
              prefixIcon: IconButton(
                alignment: Alignment.center,
                icon: Icon(Icons.calendar_month,
                    color: Theme.of(context).primaryColor),
                onPressed: () {
                  _viewModel.selectDate(context);
                },
              ),
              suffixIcon: _viewModel.controllerSearch.text.isEmpty
                  ? null // Show nothing if the text field is empty
                  : IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.grey,
                      ),
                      onPressed: _viewModel.clearTextField,
                    ),
            ),
          ),
        ),
        Expanded(child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return ListView.builder(
              padding: EdgeInsets.only(top: 20),
              itemCount: _viewModel.listEventsService.length,
              itemBuilder: (BuildContext context, int i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(DetailEventScreen.routeName,
                        arguments: _viewModel.listEventsService[i].id);
                    print('detail ${_viewModel.listEventsService[i].id}');
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Image.asset(
                            _viewModel.listEventsService[i].url![0],
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
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_viewModel.listEventsService[i].name,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(DateFormat.yMMMEd().format(DateTime.now())),
                              SizedBox(
                                height: 5,
                              ),
                              Text(_viewModel.listEventsService[i].dateEnd),
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
            );
          },
        )),
      ],
    );
  }
}
