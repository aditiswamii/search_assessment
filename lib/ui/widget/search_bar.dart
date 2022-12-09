import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search_assessment/core/core.dart';

class SearchBarWidget extends StatelessWidget {
 final double bodyMargin;
 final ValueChanged<String>? onTap;
 final ValueChanged<bool>? onTapClose;
   SearchBarWidget({super.key,required this.bodyMargin,required this.onTap,required this.onTapClose});
   TextEditingController searchController = TextEditingController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: bodyMargin, vertical: 10),
      child: TextFormField(
        controller: searchController,
        textInputAction: TextInputAction.search,
        textDirection: TextDirection.ltr,
        keyboardType: TextInputType.text,
        style: TextStyle(color: AppTheme.appBlack),
        cursorColor: AppTheme.appBlack,
        cursorHeight: 0.0,
        cursorWidth: 0.0,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            fillColor: AppTheme.appWhite,
            filled: true,
            hintText: 'Search Some User',
            hintStyle: TextStyle(color: AppTheme.appGrey),
            prefixIcon: Icon(Icons.search,color: AppTheme.appGrey,size: 22,),
            //prefixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
            suffixIcon: GestureDetector(onTap:(){
              onTapClose!(true);
            },child: Icon(Icons.close,color: AppTheme.appGrey,size: 22,)),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: AppTheme.appWhite)),
            disabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: AppTheme.appWhite)),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: AppTheme.appWhite)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: AppTheme.appWhite)),
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: AppTheme.appWhite))),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.singleLineFormatter
        ],
        onChanged: (value) {
          debugPrint(value);
          //  _cubit.getSearchProduct(text: searchController.text);
        },
        onFieldSubmitted: (String value) {
          onTap!(value);
          //
          // _cubit.getSearchProduct(text: value);
          // setState(() {
          //   searchController.text=value;
          // });
        },
      ),
    );
  }
}

