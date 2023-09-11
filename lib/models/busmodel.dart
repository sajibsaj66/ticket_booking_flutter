const String tableMovie='tbl_movie';
const String tblMovieColId='id';
const String tblMovieColName='name';
const String tblMovieColTitle='title';
const String tblMovieColImage='image';
const String tblMovieColDes='description';
const String tblMovieColBudget='budget';
const String tblMovieColBudgets='seat';
const String tblMovieColType='type';
const String tblMovieColTypee='typee';
const String tblMovieColRelease='release_date';
const String tblMovieColtime='time';

class BusModel{
  int? id;
  String name;
  String image;
  String description;
  String type;
  String typee;

  int budget;
  int budgets;
  String time;

  String release_date;

  BusModel(
      {this.id,
     required this.name,
     required this.image,
     required this.description,
     required this.budget,
     required this.type,
     required this.typee,
      required this.budgets,
     required this.release_date,
     required this.time
     });

  Map<String,dynamic> toMap(){
    final map=<String,dynamic>{
      tblMovieColName:name,
      tblMovieColDes:description,
      tblMovieColImage:image,
      tblMovieColBudget:budget,
      tblMovieColType:type,
      tblMovieColTypee:typee,
tblMovieColBudgets:budgets,
      tblMovieColRelease:release_date,
      tblMovieColtime:time
    };
    if(id!=null){
      map[tblMovieColId]=id;
    }
    return map;
  }

  factory BusModel.fromMap(Map<String,dynamic> map) => BusModel(
      id: map[tblMovieColId],
      name: map[tblMovieColName],
      image: map[tblMovieColImage],
      description: map[tblMovieColDes],
      budget: map[tblMovieColBudget],
      type: map[tblMovieColType],
      typee: map[tblMovieColTypee],
   budgets: map[tblMovieColBudgets],
      release_date: map[tblMovieColRelease],
    time: map[tblMovieColtime]
  );

}