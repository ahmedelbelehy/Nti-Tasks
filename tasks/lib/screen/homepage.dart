import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/cubit/name_cubit.dart';
import 'package:tasks/cubit/name_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cubit Example")),
      body: Center(
        child: BlocBuilder<ImageTextCubit, ImageTextState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(state.imagePath, width: 200, height: 200),
                SizedBox(height: 20),
                Text(state.text, style: TextStyle(fontSize: 22)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed:
                      () => context.read<ImageTextCubit>().toggleContent(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: state.buttonColor,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text("change"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
