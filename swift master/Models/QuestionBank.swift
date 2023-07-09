//
//  QuestionBank.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-05-21.
//

import Foundation

struct QuestionBank: Codable {
	var questions: [Question]
}

struct Question: Codable, Hashable, Identifiable {
	var id = UUID()
	
	var question: String
	var choices: [String]
	var correctChoice: Int
	var difficulty: Int
	
	enum CodingKeys: String, CodingKey {
		case question
		case choices
		case correctChoice = "correct_choice"
		case difficulty
	}
}
