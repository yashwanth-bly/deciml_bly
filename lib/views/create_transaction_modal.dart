import 'package:deciml_bly/bloc/bloc.dart';
import 'package:deciml_bly/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CreateTransactionModal extends StatefulWidget {
  const CreateTransactionModal({super.key});

  @override
  State<CreateTransactionModal> createState() => _CreateTransactionModalState();
}

class _CreateTransactionModalState extends State<CreateTransactionModal> {
  final List<double> values = List.generate(10, (index) => (index + 1) * 10);
  int selectedIndex = 0;
  TransactionType type = TransactionType.debit;
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTransactionCubit, CreateTransactionState>(
      listener: (context, state) {
        if (state is CreateTransactionLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }

        if (state is CreateTransactionSuccess) {
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: "Transaction Success",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        if (state is CreateTransactionError) {
          Fluttertoast.showToast(
              msg: "Something went wrong",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Send Money',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 200,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: TextField(
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.blueAccent,
                ),
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  prefixIcon: const Icon(Icons.currency_rupee),
                  hintText: "Amount",
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 32.0),
                      borderRadius: BorderRadius.circular(25.0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blueGrey.shade100, width: 32.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: const Text("DEBIT"),
                    value: TransactionType.debit,
                    groupValue: type,
                    onChanged: (value) {
                      setState(() {
                        type = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text("CREDIT"),
                    value: TransactionType.credit,
                    groupValue: type,
                    onChanged: (value) {
                      setState(() {
                        type = value!;
                      });
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'My round up Amount ₹${values[selectedIndex].toInt().toString()}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Slider(
              value: selectedIndex.toDouble(),
              min: 0,
              max: values.length - 1,
              divisions: values.length - 1,
              label: values[selectedIndex].toInt().toString(),
              onChanged: (double value) {
                setState(() {
                  selectedIndex = value.toInt();
                });
              },
            ),
            ElevatedButton(
                onPressed: _onTapSubmit,
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueGrey, // foreground
                    padding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 30)),
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }

  void _onTapSubmit() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (controller.text.isNotEmpty) {
      int amount = int.parse(controller.text);
      context.read<CreateTransactionCubit>().save(
            amount: amount,
            type: type,
            roundUp: values[selectedIndex].toInt(),
          );
    }
  }
}
