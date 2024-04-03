import 'package:flutter/material.dart';

const dg1 = Color(0XFF282D3A);
const dg2 = Color(0XFF1C1E24);
const lg1 = Color(0XFF434A5E);
const lg2 = Color(0XFF373D4D);
const lg3 = Color(0XFF2C3140);
const bl1 = Color(0XFF6954E7);
const bl2 = Color(0XFF2FA4ED);
const appBlack = Color(0XFF000000);
const appWhite = Color(0XFFFFFFFF);

TextStyle headingTextStyle() {
  return const TextStyle(
    color: appWhite,
    fontWeight: FontWeight.w600,
    fontSize: 25,
  );
}

const backgroundContainerGradient = LinearGradient(
  colors: [dg1, dg2],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const defaultContainerGradient = LinearGradient(
  colors: [lg2, lg3],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

class AppBackgroundContainer extends StatelessWidget {
  final Widget? child;
  const AppBackgroundContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: backgroundContainerGradient,
      ),
      height: double.infinity,
      width: double.infinity,
      child: child,
    );
  }
}

class AppDefaultContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final double? h;
  final double? v;
  const AppDefaultContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.h,
    this.v,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: h ?? 8, vertical: v ?? 3),
      decoration: BoxDecoration(
        gradient: defaultContainerGradient,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: lg1),
        boxShadow: [
          BoxShadow(
            color: appBlack.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(5, 5),
          )
        ],
      ),
      width: width,
      height: height,
      child: Center(child: child),
    );
  }
}
