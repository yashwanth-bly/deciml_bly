import 'package:deciml_bly/login_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 50),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/200?img=2'),
            radius: 80,
          ),
        ),
        const Center(
          child: Text(
            'UserName',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        _RoundUpAmount(),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const LoginScreen()),
            );
          },
          child: const Text(
            'Sign In to get more benifits',
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
      ],
    );
  }
}

class _RoundUpAmount extends StatefulWidget {
  @override
  State<_RoundUpAmount> createState() => _RoundUpAmountState();
}

class _RoundUpAmountState extends State<_RoundUpAmount> {
  final List<double> values = List.generate(10, (index) => (index + 1) * 10);
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('My round up Amount ₹${values[selectedIndex].toInt().toString()}'),
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
      ],
    );
  }
}
