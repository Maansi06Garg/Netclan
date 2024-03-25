import 'package:flutter/material.dart';
import '../data/Data.dart';
import '../utils/Routes.dart';
// import 'Detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    super.initState();
    s=false;t=false;
  }
  bool s=false;
  bool t=false;
  var filteredList=[];
  void updateList(String query) {
    setState(() {
      filteredList = person.where((item) => item[0].toUpperCase().contains(query.toUpperCase())).toList();
      t=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Column(),
      appBar:AppBar(
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Netclan Explorer"),
            SizedBox(width: 40,),
            IconButton(onPressed:(){
              setState(() {
                s=true;
              });
            } ,icon:Icon(Icons.search_rounded)),

        ],
        ),
      ),
      body:Column(
        children: [
          if(s)TextFormField(
            style: TextStyle(color: Colors.black,fontSize: 20),
            decoration: InputDecoration(
              // contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              labelText: "Search",
              labelStyle: const TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder:const OutlineInputBorder( // Border styling
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledBorder: const OutlineInputBorder( // Border styling
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            // onTapOutside: ((){display=false;})
            onChanged: updateList,),
          (s&&t)?          Expanded(
            child: ListView.builder(
              itemCount:filteredList!.length,
              itemBuilder: (context,index){
                return ListTile(
                  title:Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.2,
                    color: Colors.grey.shade50,
                    child:ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        side: const BorderSide(color: Colors.purple, width: 1),
                      ),
                      onPressed: (){
                        for (int i = 0; i < person.length; i++) {
                          if (person[i][0] ==filteredList![index][0] ) {
                            ind = i;
                            break; // Stop loop once found
                          }
                        }
                        // ind=index;
                        Navigator.pushNamed(context, MyRoutes.ProfileRoutes);
                        // Navigator.push(context,  MaterialPageRoute(builder: (context) => Detail(det:dishes![index])));
                      },
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width:MediaQuery.of(context).size.width/(2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(filteredList![index][0],style: TextStyle(fontSize: 18),),
                                Text(filteredList![index][4]+" | "+filteredList![index][1]),
                                SizedBox(height: 6,),
                                Text(filteredList![index][3]),
                              ],
                            ),
                          ),
                          // SizedBox(width:10),
                          Container(
                            width:MediaQuery.of(context).size.width*0.2,
                            height:MediaQuery.of(context).size.height*0.15,
                            child: Image.asset(filteredList![index][2],fit: BoxFit.fitHeight,
                            ),
                          ),
                        ],
                      ),),
                  ),);},
            ),
          )
        :
          Expanded(
            child: ListView.builder(
              itemCount:person!.length,
              itemBuilder: (context,index){
                return ListTile(
                  title:Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.2,
                    color: Colors.grey.shade50,
                    child:ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        side: const BorderSide(color: Colors.purple, width: 1),
                      ),
                      onPressed: (){
                        ind=index;
                        Navigator.pushNamed(context, MyRoutes.ProfileRoutes);
                        // Navigator.push(context,  MaterialPageRoute(builder: (context) => Detail(det:dishes![index])));
                      },
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width:MediaQuery.of(context).size.width/(2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(person![index][0],style: TextStyle(fontSize: 18),),
                                Text(person![index][4]+" | "+person![index][1]),
                                SizedBox(height: 6,),
                                Text(person![index][3]),
                              ],
                            ),
                          ),
                          // SizedBox(width:10),
                          Container(
                            width:MediaQuery.of(context).size.width*0.2,
                            height:MediaQuery.of(context).size.height*0.15,
                            child: Image.asset(person![index][2],fit: BoxFit.fitHeight,
                            ),
                          ),
                        ],
                      ),),
                  ),);},
            ),
          ),
        ],
      ),
    );
  }
}
