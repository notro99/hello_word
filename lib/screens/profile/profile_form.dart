import 'package:flutter/material.dart';
import 'package:hello_word_android_studio/db/profile_repository.dart';
import 'package:hello_word_android_studio/l10n/app_localization.dart';
import 'package:hello_word_android_studio/models/profile.dart';
import 'package:hello_word_android_studio/screens/profile/address_card.dart';
import 'package:provider/provider.dart';

class ProfileForm extends StatefulWidget {
  final Profile profile;

  ProfileForm({Key key, this.profile}) : super(key: key);
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  // These controllers can be used to get the value entered into the input field
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController.fromValue(
        TextEditingValue(text: widget.profile.name ?? ''));
    _emailController = TextEditingController.fromValue(
        TextEditingValue(text: widget.profile.email ?? ''));
    _phoneController = TextEditingController.fromValue(
        TextEditingValue(text: widget.profile.phone ?? ''));
  }

  void saveProfile(BuildContext context) async {
    var repository = context.read<ProfileRepository>();
    await repository.save(widget.profile);
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('mentve'),
        ),
      );
  }

  Widget bottomSheet() {
    return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            Text(
              "Válassz képet",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.camera),
                  onPressed: () {},
                  label: Text("Kamera"),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: () {},
                  label: Text("Galéria"),
                )
              ],
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'profil',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'neved johet',
                        labelText: 'nev',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Kotelezo';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email kell',
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Kotelezo';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        hintText: '+36',
                        labelText: 'telefonszam',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Kotelezo';
                        }
                        return null;
                      },
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            widget.profile.name = _nameController?.value?.text;
                            widget.profile.email =
                                _emailController?.value?.text;
                            widget.profile.phone =
                                _phoneController?.value?.text;
                            saveProfile(context);
                          }
                        },
                        child: Text('Mentes'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Cim',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (widget.profile.addresses.length > 0)
              ...widget.profile.addresses
                  .map((address) => AddressCard(address: address))
                  .toList()
          ],
        ),
      ),
    );
  }
}
