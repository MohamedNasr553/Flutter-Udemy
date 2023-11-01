import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultButton({
  double width = double.infinity,
  Color color = Colors.blue,
  double height = 40.0,
  double radius = 0.0,
  bool isUpperCase = true,
  FontWeight fontWeight = FontWeight.normal,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: color,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: fontWeight,
            fontSize: 25.0,
          ),
        ),
      ),
    );

Widget defaultTextFormField({
  bool isPassword = false,
  ValueChanged<String>? onChange,
  VoidCallback? onTap,
  ValueChanged<String>? onFieldSubmitted,
  required String? Function(String?) validate,
  required TextEditingController controller,
  required TextInputType type,
  required String labelText,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: type,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      validator: validate,
      onChanged: onChange,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(
          prefix,
        ),
        suffix: (suffix != null)
            ? IconButton(
                icon: Icon(
                  suffix,
                ),
                onPressed: suffixPressed,
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );

Widget newTaskField(Map model, context)
  =>
    Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '${model['time']}',
                style: const TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${model['title']}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDatabase(
                  status: 'Done',
                  id: model['id'],
                );
              },
              icon: const Icon(
                Icons.done,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDatabase(
                  status: 'Archived',
                  id: model['id'],
                );
              },
              icon: const Icon(
                Icons.archive,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteDataFromDatabase(
          id: model['id'],
        );
      },
    );

Widget separator()
  =>
    Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey,
    );

Widget buildNewsAppItem(article, context)
  =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
        top: 20.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Container(
              height: 170.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['author']}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Text(
                    '${article['title']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: const TextStyle(
                      fontSize: 17.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget buildNewsAppPage(list, context, {isSearch = false})
  =>
      ConditionalBuilder(
        condition: list.isNotEmpty,
        builder: (context) => ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildNewsAppItem(list[index], context),
          separatorBuilder: (context, index) => separator(),
          itemCount: list.length,
        ),
        fallback: (context) => isSearch ? Container() : const Center(child: CircularProgressIndicator()),
      );

void navigateTo(context, widget)
  =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context,widget)
  =>
    Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
        builder: (context) =>widget
    ), (route) => false,
);

void showToast({
  required String text,
  required ToastStates state
})
  =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 4,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0
    );

enum ToastStates{
  SUCCESS,
  ERROR,
  WARNING
}

Color chooseToastColor(ToastStates state){
  Color color;
  switch(state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}
