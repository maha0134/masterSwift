//
//  HomeScreenViewModel.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import Foundation

class QuestionDetails: ObservableObject {
	
}

class HomeScreenViewModel: ObservableObject {
//	var questionBank: QuestionBank?
	var questions = [Question]()
	@Published var currentQuestionNumber: Int = 0
	@Published var difficulty: Int = 0
	@Published var cancellationRequested: Bool = false
	@Published var score: Int = 0
	@Published var isAlertActive: Bool = false
	@Published var selectedOption = ""
	@Published var correctAnswerSelected: Bool = false
	@Published var currentCorrectAnswer: String = ""
	init() {
		let jsonDecoder = JSONDecoder()
		let questionBankDecoded = try? jsonDecoder.decode(QuestionBank.self, from: questionBankData!)
		
		if let questionBankDecoded {
			self.questions = questionBankDecoded.questions
		}
	}
}
