class LatLong {
  double? lat;
  double? long;
  toLatLongString() {
    return "LatLong: lat: $lat, long: $long";
  }

  dataIsNull() {
    return lat == 0 && long == 0;
  }

  LatLong(double lat, double long) {
    this.lat = lat;
    this.long = long;

    // This is the line that causes the error (see below
  }
}
