// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'color name',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(create: (context) => NameCubit(), child: NameScreen()),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Name State
class NameState {
  final String name;
  final bool isVisible;
  final Color textColor;

  NameState({
    required this.name,
    this.isVisible = true,
    this.textColor = Colors.blue,
  });

  NameState copyWith({String? name, bool? isVisible, Color? textColor}) {
    return NameState(
      name: name ?? this.name,
      isVisible: isVisible ?? this.isVisible,
      textColor: textColor ?? this.textColor,
    );
  }
}

// Name Cubit
const String _initialName = 'cubit';

class NameCubit extends Cubit<NameState> {
  NameCubit() : super(NameState(name: _initialName));

  void showName() {
    emit(state.copyWith(isVisible: true));
  }

  void hideName() {
    emit(state.copyWith(isVisible: false));
  }

  void changeColor(Color color) {
    emit(state.copyWith(textColor: color));
  }

  void resetName() {
    emit(NameState(name: _initialName));
  }
}

class NameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' color name '), backgroundColor: Colors.blue),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display Name
              BlocBuilder<NameCubit, NameState>(
                builder: (context, state) {
                  return AnimatedOpacity(
                    opacity: state.isVisible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        state.name,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: state.textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 40),

              // Control Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<NameCubit>().showName();
                    },
                    child: Text('show'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<NameCubit>().hideName();
                    },
                    child: Text('hide'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Color Buttons
              Text(
                ' change color:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildColorButton(context, Colors.blue, 'blue'),
                  _buildColorButton(context, Colors.red, 'red'),
                  _buildColorButton(context, Colors.green, 'green'),
                  _buildColorButton(context, Colors.purple, 'purple'),
                ],
              ),

              SizedBox(height: 40),

              // Reset Button
              ElevatedButton.icon(
                onPressed: () {
                  context.read<NameCubit>().resetName();
                },
                icon: Icon(Icons.refresh),
                label: Text(' reset '),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }

  Widget _buildColorButton(BuildContext context, Color color, String label) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.read<NameCubit>().changeColor(color);
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 2),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
