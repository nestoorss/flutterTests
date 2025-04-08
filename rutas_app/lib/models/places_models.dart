import 'dart:convert';

class PlacesResponse {
    final String type;
    final List<Feature> features;
    final String attribution;

    PlacesResponse({
        required this.type,
        required this.features,
        required this.attribution,
    });

    factory PlacesResponse.fromJson(String str) => PlacesResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PlacesResponse.fromMap(Map<String, dynamic> json) => PlacesResponse(
        type: json["type"],
        features: List<Feature>.from(json["features"].map((x) => Feature.fromMap(x))),
        attribution: json["attribution"],
    );

    Map<String, dynamic> toMap() => {
        "type": type,
        "features": List<dynamic>.from(features.map((x) => x.toMap())),
        "attribution": attribution,
    };
}

class Feature {
    final String id;
    final String type;
    final List<String> placeType;
    final Properties properties;
    final String textEs;
    final String placeNameEs;
    final String text;
    final String placeName;
    final List<double> center;
    final Geometry geometry;
    final List<Context> context;

    Feature({
        required this.id,
        required this.type,
        required this.placeType,
        required this.properties,
        required this.textEs,
        required this.placeNameEs,
        required this.text,
        required this.placeName,
        required this.center,
        required this.geometry,
        required this.context,
    });

    factory Feature.fromJson(String str) => Feature.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Feature.fromMap(Map<String, dynamic> json) => Feature(
        id: json["id"],
        type: json["type"],
        placeType: List<String>.from(json["place_type"].map((x) => x)),
        properties: Properties.fromMap(json["properties"]),
        textEs: json["text_es"],
        placeNameEs: json["place_name_es"],
        text: json["text"],
        placeName: json["place_name"],
        center: List<double>.from(json["center"].map((x) => x?.toDouble())),
        geometry: Geometry.fromMap(json["geometry"]),
        context: List<Context>.from(json["context"].map((x) => Context.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "place_type": List<dynamic>.from(placeType.map((x) => x)),
        "properties": properties.toMap(),
        "text_es": textEs,
        "place_name_es": placeNameEs,
        "text": text,
        "place_name": placeName,
        "center": List<dynamic>.from(center.map((x) => x)),
        "geometry": geometry.toMap(),
        "context": List<dynamic>.from(context.map((x) => x.toMap())),
    };

  @override
  String toString() {
    return "Feature: $text";
  }

}

class Context {
    final String id;
    final String? mapboxId;
    final String textEs;
    final String text;
    final Language? language;
    final String? wikidata;
    final String? shortCode;

    Context({
        required this.id,
        this.mapboxId,
        required this.textEs,
        required this.text,
        this.language,
        this.wikidata,
        this.shortCode,
    });

    factory Context.fromJson(String str) => Context.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Context.fromMap(Map<String, dynamic> json) => Context(
        id: json["id"],
        mapboxId: json["mapbox_id"],
        textEs: json["text_es"],
        text: json["text"],
        language: languageValues.map[json["language"]],
        wikidata: json["wikidata"],
        shortCode: json["short_code"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "mapbox_id": mapboxId,
        "text_es": textEs,
        "text": text,
        "language": languageValues.reverse[language],
        "wikidata": wikidata,
        "short_code": shortCode,
    };
}

enum Language {
    ES
}

final languageValues = EnumValues({
    "es": Language.ES
});

class Geometry {
    final String type;
    final List<double> coordinates;

    Geometry({
        required this.type,
        required this.coordinates,
    });

    factory Geometry.fromJson(String str) => Geometry.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Geometry.fromMap(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toMap() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    };
}

class Properties {
    final String? accuracy;
    final String? mapboxId;

    Properties({
        this.accuracy,
        this.mapboxId,
    });

    factory Properties.fromJson(String str) => Properties.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Properties.fromMap(Map<String, dynamic> json) => Properties(
        accuracy: json["accuracy"],
        mapboxId: json["mapbox_id"],
    );

    Map<String, dynamic> toMap() => {
        "accuracy": accuracy,
        "mapbox_id": mapboxId,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
