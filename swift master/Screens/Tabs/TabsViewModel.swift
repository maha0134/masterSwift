//
//  HomeScreenViewModel.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class TabsViewModel: ObservableObject {
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
	
	@MainActor
	func readFromFirebase() async {
		let db = Firestore.firestore()
		do {
			let response = try await db.collection("QuestionBank").document("SwiftQuestions").getDocument(as: QuestionBank.self)
			self.allQuestions = response.questions
			self.questions = response.questions
		} catch let err {
			print("Couldn't fetch from database, please try again: \(err)")
		}
		
	}
	
	func generateQuiz() {
		clearStates()
		let questionCount = 10
		//Pull out 10 questions from the questionbank having the desired difficulty
		if difficulty < 3 {
			questions = Array(allQuestions
				.filter { $0.difficulty == difficulty }
				.prefix(upTo: questionCount))
		} else {
			questions = Array(allQuestions.prefix(questionCount))
		}
		showQuiz = true
	}
	
	
	//Clear everything about previous attempts
	func clearStates() {
		allQuestions.shuffle()
		score = 0
		currentQuestionNumber = 0
		correctAnswerSelected = false
		currentCorrectAnswer = ""
		selectedOption = ""
	}
	
	func checkCorrectAnswer() {
		
		let currentQuestion = questions[currentQuestionNumber]
		let correctAnswer = currentQuestion.choices[currentQuestion.correctChoice]
		if correctAnswer == selectedOption {
			correctAnswerSelected = true
			score += 1
		} else {
			correctAnswerSelected = false
		}
		currentCorrectAnswer = correctAnswer
	}
}
