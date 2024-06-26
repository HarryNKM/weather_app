class HomeModal {
  String? name="Rajkot";
  int? id, timezone, cod, dt;
  MainModal? modal;
  WindModal? modal1;

  HomeModal(
      {this.name,
        this.id,
        this.timezone,
        this.cod,
        this.dt,
        this.modal,
        this.modal1});

  factory HomeModal.mapToModal(Map m1) {
    return HomeModal(
      name: m1['name'],
      id: m1['id'],
      cod: m1['cod'],
      dt: m1['dt'],
      modal1: WindModal.mapToModal(m1['wind']),
      modal: MainModal.mapToModal(m1['main']),
      timezone: m1['timezone'],
    );
  }
}

class MainModal {
  int? humidity, grnd_level, sea_level, pressure;
  double? temp, feels_like, temp_min, temp_max;

  MainModal(
      {this.humidity,
        this.grnd_level,
        this.sea_level,
        this.pressure,
        this.temp,
        this.feels_like,
        this.temp_min,
        this.temp_max});

  factory MainModal.mapToModal(Map m1) {
    return MainModal(
        feels_like: m1['feels_like'],
        grnd_level: m1['grnd_level'],
        humidity: m1['humidity'],
        pressure: m1['pressure'],
        sea_level: m1['sea_level'],
        temp: m1['temp'],
        temp_max: m1['temp_max'],
        temp_min: m1['temp_min']);
  }
}

class WindModal {
  double? speed, gust;
  int? deg;

  WindModal({this.speed, this.gust, this.deg});

  factory WindModal.mapToModal(Map m1) {
    return WindModal(
      deg: m1['deg'],
      gust: m1['gust'],
      speed: m1['speed'],
    );
  }
}
