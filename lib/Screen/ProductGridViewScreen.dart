import 'package:crud/RestApi/restApi.dart';
import 'package:crud/Screen/CreateViewScreen.dart';
import 'package:crud/Screen/ProductUpdateScreen.dart';
import 'package:crud/Style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {

  List ProducList=[];
  bool Loading=true;


  @override
  void initState() {
    CallData();
    super.initState();

  }
  CallData() async {
    Loading=true;
    var data = await GridViewRequest();
    setState(() {
      ProducList=data;
      Loading=false;
    });
  }


  DeleteItem(id) async{
     showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Alert"),
            content: Text("Do you want to delete??"),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      Loading=true;
                    });
                    await RequestDelete(id);
                    CallData();
                  },
                  child: Text("Yes")),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("No"))
            ],
          );
        },);

  }

  GotoUpdate(context,productItem){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductUpdateScreen(productItem) ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),

      ),
      body: Stack(
        children: [
          Container(
            child: Loading ? (Center(child: CircularProgressIndicator(),))
                :
            RefreshIndicator( onRefresh: () async {
              await CallData();
            },
            child: GridView.builder(
                gridDelegate:  ProductGridView(),
                itemCount :ProducList.length,
                itemBuilder: (context,index){
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(ProducList[index]['Img'],fit: BoxFit.fill,),
                            )
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Text( ProducList[index]["ProductName"] ),
                              Container(height: 11,),
                              Text("Price: ${ProducList[index]["UnitPrice"] ?? "0"} BDT"),
                              Container(height:7,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  OutlinedButton(onPressed: (){
                                    GotoUpdate(context,ProducList[index]);
                                  },
                                      child: Icon(CupertinoIcons.ellipsis_vertical_circle,size: 18,color: colorGreen,)),
                                  Container(width: 7,),
                                  OutlinedButton(
                                      onPressed: () async {
                                      await DeleteItem(ProducList[index]['_id']);
                                      },
                                      child: Icon(CupertinoIcons.delete,size: 18,color: colorRed,)),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
            ),
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductCreateScreen() ));
          },
        child: Icon(Icons.add)
      ),
    );
  }
}


