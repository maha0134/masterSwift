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
	@Binding var cancellationRequested: Bool
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		VStack {
			//TODO: Take care of question numbers
			Text("Question - \(questionNumber + 1) / 10")
			
			HStack {
				Spacer()
				Text("Time Left: 00:00")
			}
			.padding()
			
			Text(question.question)
			
			OptionView(options: question.choices, correctOption: question.correctChoice)
				.padding()
			
			Spacer()
		}
		.padding()
		.onChange(of: cancellationRequested) { newValue in
			if newValue {
				dismiss()
				cancellationRequested = false
			}
		}
	}
}

struct QuestionScreenView_Previews: PreviewProvider {
	static var previews: some View {
		QuestionScreenView(question: (HomeScreenViewModel().questionBank?.questions[0])!, questionNumber: 0, cancellationRequested: .constant(false))
	}
}
