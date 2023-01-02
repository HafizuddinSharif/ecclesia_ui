import 'package:ecclesia_ui/client/widgets/custom_appbar.dart';
import 'package:ecclesia_ui/client/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class RegisterConfirmation extends StatelessWidget {
  const RegisterConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(back: false, disableBackGuard: true, disableMenu: false),
      endDrawer: const CustomDrawer(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.0), boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(255, 211, 211, 211).withOpacity(0.5), //color of shadow
                spreadRadius: 3, //spread radius
                blurRadius: 7, // blur radius
                offset: const Offset(0, 6)),
          ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.av_timer_rounded,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 10),
              const Text(
                'Your current status on joining',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Edinburgh University Students\' Association (EUSA)',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: const Text('Registering your details',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(height: 10),
              const Text(
                'We will send you an email to notify if you have been successfully registered',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
