import 'package:flutter/material.dart';

class CaseDataRow extends StatelessWidget {
  final String? title;
  final String? value;
  const CaseDataRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title!, style: TextStyle(
                fontSize: 13.0,
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              ),
              Text(value!,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0,),

        ],
      ),
    );
  }
}
