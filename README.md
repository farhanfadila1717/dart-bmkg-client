
## [![cover][]][github]
[![badge paypal][]][paypal account] [![badge linktree][]][linktree account] <br>
BMKG weather forecast data client with dart.

---

## Usage
to `/example` folder. 

```dart
  final results = await BMKGClient().getProvinceWeather(
    Province.Indonesia,
    filterParameters: [
      FilterParameter.Weather,
    ],
  );
```

## Source
[BMKG (Badan Meteorologi, Klimatologi, dan Geofisika)](https://data.bmkg.go.id/prakiraan-cuaca/)

---

### 🚧 Maintener 
[![account avatar][]][github account] <br>
**Farhan Fadila** <br>
📫 How to reach me: farhan.fadila1717@gmail.com

### ❤️ Suport Maintener
[![badge paypal][]][paypal account] [![badge linktree][]][linktree account]

[cover]: https://github.com/farhanfadila1717/dart-bmkg-client/blob/master/display/bmkg_client.png
[github]: https://github.com/farhanfadila1717/dart-bmkg-client
[account avatar]: https://avatars.githubusercontent.com/u/43161050?s=80
[github account]: https://github.com/farhanfadila1717
[badge linktree]: https://img.shields.io/badge/Donate-farhanfadila-orange
[linktree account]: https://linktr.ee/farhanfadila
[badge paypal]: https://img.shields.io/badge/Donate-PayPal-00457C?logo=paypal
[paypal account]: https://www.paypal.me/farhanfadila1717 