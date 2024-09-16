import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dealsdray/bloc/login/login_bloc.dart';
import 'package:dealsdray/bloc/login/login_event.dart';
import 'package:dealsdray/bloc/login/login_state.dart';
import 'package:dealsdray/screens/verify/verify_screen.dart';
import 'package:dealsdray/screens/email/email_screen.dart';
import 'package:dealsdray/util/button.dart';
import 'package:dealsdray/util/textfield.dart';
import 'package:dealsdray/util/togggle_button.dart';
import 'package:logger/logger.dart'; // Import logger package

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<bool> _isSelected = [true, false];
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

  final Logger _logger = Logger(); // Create a logger instance

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isButtonEnabled = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_outlined,
        ),
      ),
      body: Column(
        children: [
          // Logo
          Center(
            child: Image.asset(
              "assets/logo.png",
              width: 130,
              height: 130,
            ),
          ),

          // Name
          const Text(
            "DealsDray",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 40,
            ),
          ),
          const SizedBox(height: 35),

          // Toggle button
          CustomToggleButton(
            items: const <Widget>[
              Text('Phone'),
              Text('Email'),
            ],
            isSelected: _isSelected,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _isSelected.length; i++) {
                  _isSelected[i] = i == index;
                }

                // Log the toggle button action
                _logger.i('Toggle button pressed: index $index');

                // Navigate to Email page if Email is clicked (index == 1)
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmailScreen()),
                  );
                }
              });
            },
          ),
          const SizedBox(height: 25),

          // Title
          const Padding(
            padding: EdgeInsets.only(left: 80),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Glad to see you!',
                style: TextStyle(
                    color: Color.fromARGB(217, 7, 7, 7),
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Subtitle
          const Padding(
            padding: EdgeInsets.only(left: 80),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Please provide your phone number',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 25),

          // TextField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: CustomTextField(
              controller: _controller,
              hintText: 'phone',
              keyboardType: TextInputType.phone,
              maxLength: 10,
              textCapitalization: TextCapitalization.none,
              onSubmitted: (String value) {
                _logger.i('Submitted phone number: $value');
              },
            ),
          ),
          const SizedBox(height: 50),

          // BlocConsumer handling submit button state and interaction
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is SuccessState) {
                _logger.i('SuccessState emitted: ${state.successResponse}');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.successResponse)),
                );
                // Navigate to the verification screen on success
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VerifyScreen()),
                );
              } else if (state is FailureState) {
                _logger.e('FailureState emitted: ${state.errorMessage}');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage)),
                );
              }
            },
            builder: (context, state) {
              return CustomElevatedButton(
                text: 'Submit',
                onPressed: _isButtonEnabled
                    ? () {
                        final phoneNumber = _controller.text;
                        _logger.i(
                            'Submit button pressed with phone number: $phoneNumber');
                        BlocProvider.of<LoginBloc>(context)
                            .add(PostMobileNumber(phoneNumber: phoneNumber));
                      }
                    : null,
                isEnabled: _isButtonEnabled,
              );
            },
          ),
        ],
      ),
    );
  }
}
