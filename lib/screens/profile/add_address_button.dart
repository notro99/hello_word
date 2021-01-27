import 'package:flutter/material.dart';
import 'package:hello_word_android_studio/db/profile_repository.dart';
import 'package:hello_word_android_studio/l10n/app_localization.dart';
import 'package:hello_word_android_studio/location_service.dart';
import 'package:hello_word_android_studio/models/address.dart';
import 'package:hello_word_android_studio/screens/profile/address_form_dialog.dart';
import 'package:provider/provider.dart';

class AddAddressButton extends StatelessWidget {
  final Function onAddressSaved;

  AddAddressButton({Key key, @required this.onAddressSaved}) : super(key: key);

  Future<void> _addAddress(BuildContext context) async {
    var address = await showDialog<Address>(
      context: context,
      builder: (BuildContext context) => AddressFormDialog(),
    );
    if (address != null) {
      // Get the repository through Provider
      var repository = context.read<ProfileRepository>();
      // Get the latitude and longitude values for that address
      address.latLng = await LocationService.find(address);
      // Save the address into the DB
      await repository.addAddress(address);

      // Call the callback
      await onAddressSaved();
      // Show info to the user
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).addressSaved),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _addAddress(context);
      },
      backgroundColor: Colors.red,
      child: Icon(Icons.add),
    );
  }
}
