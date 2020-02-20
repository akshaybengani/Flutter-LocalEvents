import 'package:flutter/material.dart';
import 'package:local_events/app_state.dart';
import 'package:local_events/model/category.dart';
import 'package:local_events/styleguide.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  // Category is the modal class we defined at the starting
  final Category category;
  CategoryWidget(this.category);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.categoryId;

    return GestureDetector(
      onTap: () {
        if(!isSelected){
          appState.updateCategoryId(category.categoryId);
        }
      },
      child: Container( 
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Colors.white : Color(0X99FFFFFF), width: 3),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: isSelected ? Colors.white : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              category.icon,
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
              size: 40,
            ),
            SizedBox(height: 10),
            Text(
              category.name,
              style: isSelected ? selectedCategoryTextStyle : categoryTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
