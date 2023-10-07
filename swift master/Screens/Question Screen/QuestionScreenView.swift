//
//  QuestionScreenView.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import SwiftUI

struct QuestionScreenView: View {
	let questions: [Question]
	let questionNumber: Int
	@Binding var selectedOption: String
	@Binding var cancellationRequested: Bool
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		VStack {
			Text("Question - \(questionNumber + 1) / \(questions.count)")
				.padding()
			
			Text(questions[questionNumber].question)
			
			OptionView(options: questions[questionNumber].choices,
					   correctOption: questions[questionNumber].correctChoice,
					   selectedOption: $selectedOption)
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
		QuestionScreenView(questions: [sampleQuestion, sampleQuestion], questionNumber: 0, selectedOption: .constant(""), cancellationRequested: .constant(false))
	}
}
