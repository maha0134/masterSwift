//
//  QuestionScreenView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import SwiftUI

struct QuestionScreenView: View {
	var question: Question
	var questionNumber: Int
	@Binding var selectedOption: String
	@Binding var cancellationRequested: Bool
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		VStack {
			//TODO: Take care of question numbers
			Text("Question - \(questionNumber + 1) / 10")
				.padding()
			
			Text(question.question)
			
			OptionView(options: question.choices, correctOption: question.correctChoice, selectedOption: $selectedOption)
				.padding()
			
			Spacer()
		}
		.padding()
		.onChange(of: cancellationRequested) { newValue in
			if newValue {
				dismiss()
				cancellationRequested = false
				selectedOption = ""
			}
		}
	}
}

struct QuestionScreenView_Previews: PreviewProvider {
	static var previews: some View {
		QuestionScreenView(question: (HomeScreenViewModel().questionBank?.questions[0])!, questionNumber: 0, selectedOption: .constant("let"), cancellationRequested: .constant(false))
	}
}
