class AddressModel {
  final int id;
  final String state;
  final String city;
  final String address;
  final double lat;
  final double long;
  final String number;
  final String unit;
  final String recieverName;
  final String recieverPhone;
  final bool isDefault;

  AddressModel(
      {this.id,
      this.state,
      this.city,
      this.address,
      this.lat,
      this.long,
      this.number,
      this.unit,
      this.recieverName,
      this.recieverPhone,
      this.isDefault});
}
