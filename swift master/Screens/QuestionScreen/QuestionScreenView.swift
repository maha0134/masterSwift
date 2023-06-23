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
	var body: some View {
		VStack {
			Text("Question - \(questionNumber + 1) / 10")
				.padding()
			HStack {
				Spacer()
				Text("Time: 00:00")
			}
			
			Text(question.question)
				.padding(.top, 10)
			
			OptionView(options: question.choices, correctOption: question.correctChoice)
			
			Spacer()
		}
		.padding()
	}
}

struct QuestionScreenView_Previews: PreviewProvider {
	static var previews: some View {
		QuestionScreenView(question: (Questions().questionBank?.questions[0])!, questionNumber: 1)
	}
}
