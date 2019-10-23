import 'package:flutter/material.dart';

import 'package:pawlog/model/pet.dart';

import 'package:pawlog/ui/modal/ask_request_modal.dart';
import 'package:pawlog/ui/screen/meetup/map_screen.dart';
import 'package:pawlog/ui/widget/pet_page_view.dart';

class MeetupListScreen extends StatefulWidget {
  static const routeName = '/meetup-list';

  const MeetupListScreen({Key key}) : super(key: key);

  @override
  _MeetupListScreenState createState() => _MeetupListScreenState();
}

class _MeetupListScreenState extends State<MeetupListScreen> {
  void _askUserMeetup(AskRequestActions action) async {
    switch (await Navigator.of(context)
        .push<AskRequestResponses>(AskRequestModal(action))) {
      case AskRequestResponses.Accept:
        Navigator.of(context).pushNamed(MeetupMapScreen.routeName);
        break;
      case AskRequestResponses.Reject:
        break;
      case AskRequestResponses.Cancel:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meetup',
          style: Theme.of(context).textTheme.title,
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) =>
            _buildMeetupUser(context),
      ),
    );
  }

  Widget _buildMeetupUser(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.black26,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Sookhyun Kwon',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          '123m away',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  child: FlatButton(
                    onPressed: () =>
                        _askUserMeetup(AskRequestActions.Receiving),
                    child: const Text(
                      'Ask',
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    color: Theme.of(context).colorScheme.primary,
                    splashColor: Colors.white24,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ],
            ),
          ),
          PetPageView(
            [
              Pet(
                'Dexter',
                'Golden Retriever',
                'https://images.pexels.com/photos/356378/pexels-photo-356378.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              ),
              Pet(
                'Dexter',
                'Golden Retriever',
                'https://image.cnbcfm.com/api/v1/image/105992231-1561667465295gettyimages-521697453.jpeg?v=1561667497&w=678&h=381',
              ),
              Pet(
                'Dexter',
                'Golden Retriever',
                'https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg',
              ),
            ],
            height: MediaQuery.of(context).size.width * 0.6,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
        ],
      ),
    );
  }
}
