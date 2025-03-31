class Band {
  String id;
  String name;
  int votes = 0;

  Band({
    required this.id,
    required this.name,
    required this.votes
  });

  factory Band.fromMap(Map<String, dynamic> obj) 
    => Band(
      id: obj.containsKey('id') ? obj["id"] : 'no-id',
      name: obj.containsKey('name') ? obj["name"] : 'no-name',
      votes: obj.containsKey('votes') ? (obj["votes"] as num).toInt() : 0
    );

}