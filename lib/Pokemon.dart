class Pokemon {
  int _id;
  String _type;
  int _moves;

  Pokemon(this._id, this._type, this._moves);

  //setter
  set id(int id){
    this._id = id;
  }

  set type(String type){
    this._type = type;
  }

  set moves(int moves){
    this._moves = moves;
  }

  //getters
  
  int get id => this._id;
  String get type => this._type;
  int get moves => this._moves;
    
}
