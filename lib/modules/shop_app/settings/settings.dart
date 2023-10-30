import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/cubit.dart';
import 'package:flutter_app/layout/shop_app/states.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopSettingScreen extends StatelessWidget {
  ShopSettingScreen({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).shopProfileModel;

        // nameController.text = model!.data!.name! ;
        // emailController.text = model.data!.email!;
        // emailController.text = model.data!.phone!;

        return ConditionalBuilder(
          condition: ShopCubit.get(context).shopProfileModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                defaultTextFormField(
                  validate: (value){},
                  controller: nameController,
                  type: TextInputType.text,
                  labelText: 'Name',
                  prefix: Icons.person,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultTextFormField(
                  validate: (value){},
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  labelText: 'Email Address',
                  prefix: Icons.email,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultTextFormField(
                  validate: (value){},
                  controller: phoneController,
                  type: TextInputType.phone,
                  labelText: 'Phone Number',
                  prefix: Icons.phone,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultButton(
                  function: (){},
                  text: 'Update',
                ),
              ],
            ),
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
