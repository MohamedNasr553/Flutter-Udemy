import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/shop_app/login/LoginScreen.dart';
import 'package:flutter_app/modules/shop_app/register/cubit/cubit.dart';
import 'package:flutter_app/modules/shop_app/register/cubit/states.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        defaultTextFormField(
                          validate: (value){
                            if(value!.isEmpty){
                              return 'Name must not be empty';
                            }
                            return null;
                          },
                          controller: nameController,
                          type: TextInputType.text,
                          labelText: 'Name',
                          prefix: Icons.person,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField(
                          validate: (value){
                            if(value!.isEmpty){
                              return 'Email must not be empty';
                            }
                            return null;
                          },
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          labelText: 'Email Address',
                          prefix: Icons.email,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField(
                            validate: (value){
                              if(value!.isEmpty){
                                return 'password must not be empty';
                              }
                              return null;
                            },
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            labelText: 'Password',
                            prefix: Icons.lock,
                            isPassword: ShopRegisterCubit.get(context).isPassword,
                            suffix: ShopRegisterCubit.get(context).suffix,
                            suffixPressed:(){
                              ShopRegisterCubit.get(context).changeVisibility();
                            }
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField(
                          validate: (value){
                            if(value!.isEmpty){
                              return 'phone must not be empty';
                            }
                            return null;
                          },
                          controller: phoneController,
                          type: TextInputType.phone,
                          labelText: 'Phone Number',
                          prefix: Icons.phone,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (context) => defaultButton(
                            text: 'Sign up',
                            isUpperCase: true,
                            color: Colors.deepOrange.shade400,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                navigateAndFinish(context, ShopLoginScreen());
                                ShopRegisterCubit.get(context).registerUser(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            radius: 8.0,
                            width: 200.0,
                          ),
                          fallback: (context) => const Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
