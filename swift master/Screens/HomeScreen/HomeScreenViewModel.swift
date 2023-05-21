//
//  HomeScreenViewModel.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import Foundation

class QuestionDetails: ObservableObject {
	
}

struct Questions {
	var questionBank: QuestionBank?
	
	init() {
		let jsonDecoder = JSONDecoder()
		let questionBankDecoded = try? jsonDecoder.decode(QuestionBank.self, from: questionBankData!)
		
		if let questionBankDecoded {
			self.questionBank = questionBankDecoded
		}
	}
}
