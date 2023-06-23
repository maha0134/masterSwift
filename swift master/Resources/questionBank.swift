//
//  questionBank.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import Foundation
//TODO: Add more questions
let questionBankData =
"""
{
 "questions": [
  {
   "question": "What is the keyword used to define a constant in Swift?",
   "choices": ["let", "var", "constant", "define"],
   "correct_choice": 0,
   "difficulty": 1
  },
  {
   "question": "What is the operator used for optional unwrapping in Swift?",
   "choices": ["?", "!", "??", "&&"],
   "correct_choice": 1,
   "difficulty": 1
  },
  {
   "question": "Which collection type in Swift does not allow duplicate elements?",
   "choices": ["Array", "Set", "Dictionary", "Tuple"],
   "correct_choice": 1,
   "difficulty": 1
  },
  {
   "question": "What is the correct syntax to define a function in Swift?",
   "choices": ["func", "function", "def", "method"],
   "correct_choice": 0,
   "difficulty": 1
  },
  {
   "question": "What is the type annotation for a String in Swift?",
   "choices": ["String", "str", "text", "StringType"],
   "correct_choice": 0,
   "difficulty": 1
  },
  {
   "question": "Which control flow statement is used to repeat a block of code multiple times in Swift?",
   "choices": ["if", "while", "for", "switch"],
   "correct_choice": 2,
   "difficulty": 1
  },
  {
   "question": "What is the protocol-oriented programming feature in Swift called?",
   "choices": ["Interfaces", "Classes", "Inheritance", "Protocols"],
   "correct_choice": 3,
   "difficulty": 1
  },
  {
   "question": "What is the purpose of the didSet observer in Swift?",
   "choices": ["To observe property changes before they occur.", "To observe property changes after they occur.", "To observe collection changes.", "To observe view layout changes."],
   "correct_choice": 1,
   "difficulty": 1
  },
  {
   "question": "Which keyword is used to make a class property or method accessible without needing an instance?",
   "choices": ["public", "private", "static", "internal"],
   "correct_choice": 2,
   "difficulty": 1
  },
  {
   "question": "What is the syntax for creating a SwiftUI View?",
   "choices": ["struct View {}", "class View {}", "enum View {}", "protocol View {}"],
   "correct_choice": 0,
   "difficulty": 1
  },
  {
   "question": "Which SwiftUI container view is used to stack views horizontally?",
   "choices": ["HStack", "VStack", "ZStack", "Group"],
   "correct_choice": 0,
   "difficulty": 1
  },
  {
   "question": "What is the purpose of the @State property wrapper in SwiftUI?",
   "choices": ["To manage the state of a view.", "To create a reusable component.", "To handle user input.", "To observe changes in environment objects."],
   "correct_choice": 0,
   "difficulty": 1
  },
  {
   "question": "Which modifier is used to clip a view to its bounding frame in SwiftUI?",
   "choices": ["clipShape()", "frame()", "padding()", "overlay()"],
   "correct_choice": 0,
   "difficulty": 2
  }
  ]
}
""".data(using: .utf8)
