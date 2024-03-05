import 'package:flutter/material.dart';
import 'package:projectapp/widget/onboarding/onboarding_page_widget.dart';

class LewatiButton extends StatelessWidget{
  const LewatiButton({
    Key? key, required Null Function() onPressed,
  }):super(key: key);


  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 44,
        width: 82,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Lewati',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          )
        ),
      ),
    );
  }
}