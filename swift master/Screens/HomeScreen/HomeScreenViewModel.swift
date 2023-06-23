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
	var questionBank: QuestionBank?
	@Published var currentQuestion: Int = 0
	@Published var difficulty: Int = 0
	@Published var cancellationRequested = false
	@Published var score = 0
	init() {
		let jsonDecoder = JSONDecoder()
		let questionBankDecoded = try? jsonDecoder.decode(QuestionBank.self, from: questionBankData!)
		
		if let questionBankDecoded {
			self.questionBank = questionBankDecoded
		}
	}
}
