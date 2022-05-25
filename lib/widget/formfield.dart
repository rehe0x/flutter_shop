import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/common/screenutil/src/size_extension.dart';

import '../theme/themes.dart';

class CustomFormField extends StatelessWidget {
  final double? maxHeight;
  final double? maxWidth; 
  final String? title;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onEditingComplete;

  

  const CustomFormField ({this.maxHeight, this.maxWidth, this.title,
   this.validator, this.inputFormatters,this.onEditingComplete, Key? key}) 
  : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Offstage(
          offstage: !(title != null),
          child: Text('  $title' ,style: AppThemes.of(context).textTheme.titleSmall,)
        ),
        Offstage(
          offstage: !(title != null),
          child: SizedBox(height: 10.h,),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight ?? 70.h,
            maxWidth: maxWidth ?? double.infinity
          ),
          child: TextFormField(
              // keyboardType: TextInputType.phone,
              style: AppThemes.of(context).textTheme.labelLarge,
              cursorColor: AppThemes.of(context).primaryColor,
              textAlignVertical: TextAlignVertical.center,
              validator: validator,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 0.r),
                hintText: title,
                hintStyle: AppThemes.of(context).textTheme.displayMedium,
                suffixIcon: Icon(Icons.close, color: AppThemes.of(context).primaryColor,),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: AppThemes.of(context).divideColor
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: AppThemes.of(context).primaryColor
                  )
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(
                    color: Colors.red
                  )
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(
                    color: Colors.red
                  )
                ),
              ),
                onEditingComplete: onEditingComplete
            ),
        ),
      ],
    );
  }
}