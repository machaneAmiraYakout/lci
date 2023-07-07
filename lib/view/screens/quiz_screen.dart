import 'package:flutter/material.dart';

class QuizQuestionWidget extends StatelessWidget {
  final String question;
  final List<String> choices;
  final int selectedChoiceIndex;
  final ValueChanged<int?> onChoiceSelected;
  final VoidCallback onNextPressed;

  const QuizQuestionWidget({
    required this.question,
    required this.choices,
    required this.selectedChoiceIndex,
    required this.onChoiceSelected,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
            child: Text(
              question,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: choices.length,
              itemBuilder: (context, index) {
                final choice = choices[index];
                return ListTile(
                  onTap: () => onChoiceSelected(index),
                  leading: Radio<int>(
                    value: index,
                    groupValue: selectedChoiceIndex,
                    onChanged: onChoiceSelected,
                  ),
                  title: Text(choice),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ElevatedButton(
              onPressed: onNextPressed,
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
