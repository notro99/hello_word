import 'package:flutter/material.dart';

import 'package:hello_word_android_studio/db/profile_repository.dart';
import 'package:hello_word_android_studio/models/profile.dart';
import 'package:hello_word_android_studio/screens/profile/add_address_button.dart';
import 'package:hello_word_android_studio/screens/profile/profile_form.dart';
import 'package:hello_word_android_studio/screens/profile/profile_picture.dart';
import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  final void Function() onShowCart;

  const Page2({
    Key key,
    this.onShowCart,
  }) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Page2> {
  Profile _profile;
  ProfileRepository _profileRepository;

  @override
  void initState() {
    super.initState();
    _profileRepository = context.read<ProfileRepository>();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    var loadedProfile = await _profileRepository.load();
    setState(() {
      _profile = Profile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Column(
            children: <Widget>[
              ProfilePicture(),
              if (_profile != null)
                Expanded(
                    child: ProfileForm(
                  profile: _profile,
                )),
            ],
          ),
        ),
        floatingActionButton: AddAddressButton(
          onAddressSaved: _loadProfile,
        ),
      ),
    );
  }
}
