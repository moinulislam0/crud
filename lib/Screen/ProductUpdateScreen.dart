
import 'package:crud/RestApi/restApi.dart';
import 'package:crud/Screen/ProductGridViewScreen.dart';
import 'package:crud/Style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductUpdateScreen extends StatefulWidget {
 final Map productItem;
  const ProductUpdateScreen(this.productItem);

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  Map<String,String> FromsValue={
    "Img":"",
    "ProductCode":"",
    "ProductName":"",
    "Qty":"",
    "TotalPrice":"",
    "UnitPrice":""
  };

  @override
  void initState() {
    setState(() {
      FromsValue.update("Img", (value)=>widget.productItem["Img"]);
      FromsValue.update("ProductCode", (value)=>widget.productItem["ProductCode"]);
      FromsValue.update("ProductName", (value)=>widget.productItem["ProductName"]);
      FromsValue.update("Qty", (value)=>widget.productItem["Qty"]);
      FromsValue.update("TotalPrice", (value)=>widget.productItem["TotalPrice"]);
      FromsValue.update("UnitPrice", (value)=>widget.productItem["UnitPrice"]);
    });
    super.initState();
  }


  bool Loading=false;


  InputDate (TextKey,TextValue){
    setState(() {
      FromsValue.update(TextKey, (value)=>TextValue);
    });
  }
  FromOnSubmit() async{
    if(FromsValue['Img']!.length==0){
      ErrorMessage('Image Link Required');
    }
    else if(FromsValue['ProductCode']!.length==0){
      ErrorMessage('ProductCode Link Required');
    }
    else if(FromsValue['ProductName']!.length==0){
      ErrorMessage('ProductName Link Required');
    }
    else if(FromsValue['Qty']!.length==0){
      ErrorMessage('Qty Link Required');
    }
    else if(FromsValue['TotalPrice']!.length==0){
      ErrorMessage('TotalPrice Link Required');
    }
    else if(FromsValue['UnitPrice']!.length==0){
      ErrorMessage('UnitPrice Link Required');
    }
    else{
      setState(() {
        Loading=true;
      });
      await RestUpdateSubmit(FromsValue,widget.productItem["_id"]);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> ProductGridViewScreen()),
          (Route route)=>false
      );
      setState(() {
        Loading=false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update product"),
      ),
      body: Stack(
        children: [
          // ScreenBackground(context),
          Container(
              child: Loading
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: FromsValue["ProductName"],
                      onChanged: (value) {
                        InputDate("ProductName", value);
                      },
                      decoration: AppInputDecoration("Product name"),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      initialValue: FromsValue["ProductCode"],
                      onChanged: (TextValue) {
                        InputDate("ProductCode", TextValue);
                      },
                      decoration: AppInputDecoration("Product Code"),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      initialValue: FromsValue["Img"],
                      onChanged: (TextValue) {
                        InputDate("Img", TextValue);
                      },
                      decoration: AppInputDecoration("Product Image"),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      initialValue: FromsValue["TotalPrice"],
                      onChanged: (TextValue) {
                        InputDate("TotalPrice", TextValue);
                      },
                      decoration: AppInputDecoration("Total Price"),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      initialValue: FromsValue["UnitPrice"],
                      onChanged: (TextValue) {
                        InputDate("UnitPrice", TextValue);
                      },
                      decoration: AppInputDecoration("Unit Price"),
                    ),
                    SizedBox(height: 10),
                    AppDropDown(
                      DropdownButton(
                        value: FromsValue['Qty'],
                        items: [
                          DropdownMenuItem(child: Text("Select Qty"), value: ''),
                          DropdownMenuItem(child: Text("1ps"), value: '1ps'),
                          DropdownMenuItem(child: Text("2ps"), value: '2ps'),
                          DropdownMenuItem(child: Text("3ps"), value: '3ps'),
                          DropdownMenuItem(child: Text("4ps"), value: '4ps'),
                        ],
                        onChanged: (TextValue) {
                          InputDate("Qty", TextValue);
                        },
                        isExpanded: true,
                        underline: Container(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: ElevatedButton(
                        style: AppButton(),
                        onPressed: () {
                          FromOnSubmit();
                        },
                        child: SuccessButton("Submit"),
                      ),
                    ),
                  ],
                ),
              )

          ),

        ],
      ),
    );
  }
}



