import 'package:flutter/material.dart';
class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => search_screen();
}
class search_screen extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Here.."),
        actions: <Widget>[ IconButton(onPressed: (){
          showSearch(context: context, delegate: datasearch() );
        }, icon: Icon(Icons.search))],
      ),
    );
  }
}
class datasearch extends SearchDelegate<String> {
  final people = [
    "Mike Mcgee",
    "Reagan Maynard",
    "Miley Garner",
    "Peter Duncan",
    "Tony Nielsen",
    "Phoebe Drake",
    "Julissa Pena",
    "Laura Vaughan",
    "Kathryn Dickson",
    "Bridger Newton",
    "Mia Mccann",
    "Tristian Yoder",
    "fareed Idrees",
    "Ahsan lundkatiya",
    "hashir lola",
    "hadiqa hadoop"
  ];
  final recentpeople = [
    "Tristian Yoder",
    "fareed Idrees",
    "Ahsan lundkatiya",
    "hashir lola",
    "hadiqa hadoop"
  ];
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(onPressed: (){
        query="";
      }, icon: Icon(Icons.clear))
    ];
  }
  @override
  Widget buildLeading(BuildContext context)
  {
    return IconButton(onPressed: (
        ){
      close(context,"");
    },
        icon:
        AnimatedIcon(icon: AnimatedIcons.menu_arrow,progress: transitionAnimation));
  }
  @override
  Widget buildResults(BuildContext context) {
    return Center(
        child:Container(
          height: 100,
          width: 100,
          child:Card(
            color: Colors.redAccent,
            child: Center(child: Text(query),),
          ),));
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionpeople = query.isEmpty?recentpeople:people.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context,index)=>ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.person_outline_rounded),
        title: RichText(text: TextSpan(
            text: suggestionpeople[index].substring(0,query.length),
            style: TextStyle(
              color:Colors.black,fontWeight: FontWeight.bold,),
            children:[TextSpan(
                text:suggestionpeople[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
            )
            ]),
        ),
      ),
      itemCount: suggestionpeople.length,);
  }
}