import 'package:flutter/material.dart';
// import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BookRide extends StatefulWidget {
  const BookRide({super.key});

  @override
  State<BookRide> createState() => _BookRideState();
}

class _BookRideState extends State<BookRide> {
  // final form = FormGroup({
  //   'from': FormControl<String>(value: ''),
  //   'to': FormControl<String>(value: '')
  // });

  final _fbkey = GlobalKey<FormBuilderState>();

  final String From = 'From';
  final String To = 'To';
  final String Message = 'Message';

  // final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: FormBuilder(
          key: _fbkey,
          child: SizedBox(
            width: 380,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: From,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "From",
                    hintStyle: TextStyle(),
                    focusColor: Colors.white,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                  name: To,
                  decoration: InputDecoration(
                    // ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "To",
                    focusColor: Colors.white,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                  name: Message,
                  decoration: InputDecoration(
                    // ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Message",
                    focusColor: Colors.white,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
