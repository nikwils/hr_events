import 'package:flutter/material.dart';

import '../detail_event/detail_event_screen.dart';
import 'list_events_view_model.dart';

class ListEvents extends StatefulWidget {
  ListEvents({super.key});

  @override
  State<ListEvents> createState() => _ListEventsState();
}

final _viewModel = ListEventsViewModel();

class _ListEventsState extends State<ListEvents> {
  @override
  void initState() {
    // Start listening to changes.
    _viewModel.controllerSearch.addListener(_viewModel.printLatestValue);
    super.initState();
    countEvent();
  }

  @override
  void dispose() {
    _viewModel.controllerSearch.dispose();
    super.dispose();
  }

  void countEvent() {
    print(_viewModel.listEvents.length);
  }

  void printOnTap() {
    // print(('ontap${_viewModel.listEvents.length}'));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          decoration: const BoxDecoration(
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
        Expanded(
            child: FutureBuilder(
                future: _viewModel.future,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.error != null) {
                      return const Center(
                        child: Text('Error'),
                      );
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.only(top: 20),
                        itemCount: _viewModel.listEvents.length,
                        itemBuilder: (BuildContext context, int i) {
                          return GestureDetector(
                            onTap: () async {
                              _viewModel
                                  .setSelectedEvent(_viewModel.listEvents[i]);
                              Navigator.of(context).pushNamed(
                                DetailEventScreen.routeName,
                              );
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: _viewModel.listEvents[i].picture !=
                                            ""
                                        ? Image.network(
                                            (_viewModel.listEvents[i].picture)
                                                .toString(),
                                            height: 100,
                                            width: 500.0,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                          )
                                        : Image.asset(
                                            'assets/imgs/default_img_card.png',
                                            height: 150,
                                            alignment: Alignment.center,
                                          ),
                                  ),
                                  const Divider(),
                                  Container(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    height: 160,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(_viewModel.listEvents[i].name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(_viewModel
                                                    .listEvents[i].dateStart !=
                                                ''
                                            ? _viewModel.listEvents[i].dateStart
                                            : 'Скоро объявим'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          _viewModel.listEvents[i].announce ??
                                              'Классное мероприятие',
                                          maxLines: 4,
                                        ),
                                        const SizedBox(
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
                    }
                  }
                })),
      ],
    );
  }
}
