import 'package:flutter/material.dart';

class TimeSlotWidget extends StatelessWidget {
  final String time;
  final String selectedTime;
  final void Function(String) onSelected;

  const TimeSlotWidget({
    super.key,
    required this.time,
    required this.selectedTime,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedTime == time;

    return GestureDetector(
      onTap: () => onSelected(time),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00C896) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xFF00C896) : Colors.grey[300]!,
          ),
        ),
        child: Text(
          time,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
