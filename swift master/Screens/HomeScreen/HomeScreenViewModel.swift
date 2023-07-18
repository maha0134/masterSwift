//
//  HomeScreenViewModel.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class HomeScreenViewModel: ObservableObject {
	var allQuestions = [Question]()
	var questions = [Question]()
	@Published var currentQuestionNumber: Int = 0
	@Published var difficulty: Int = 0
	@Published var cancellationRequested: Bool = false
	@Published var showQuiz: Bool = false
	@Published var score: Int = 0
	@Published var isAlertActive: Bool = false
	@Published var selectedOption: String = ""
	@Published var correctAnswerSelected: Bool = false
	@Published var currentCorrectAnswer: String = ""
	@Published var resultsPresented: Bool = false
	@Published var showLoader: Bool = false
	
	func readFromFirebase(for difficulty: Int, with completion: @escaping () -> Void ) {
		let db = Firestore.firestore()
		db.collection("QuestionBank").document("SwiftQuestions").getDocument(as: QuestionBank.self) { result in
			switch result {
				case .success(let questionBank):
					self.allQuestions = questionBank.questions
					self.questions = questionBank.questions
					completion()

				case .failure(let err):
					print("Couldn't fetch from database, please try again: \(err)")
			}
		}
	}
}
