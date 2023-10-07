//
//  UserDefaultsViewModel.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-10-02.
//

import Foundation

struct ScoreData: Codable {
	var id = UUID().uuidString
	let score: Int
	let difficulty: Int
	var difficultyLabel = ""
}

class UserDefaultsViewModel {
	private let scores = "scores"
	
	
	func updateStorage(with score: Int, and difficulty: Int) {
		let updatedScore = ScoreData(score: score, difficulty: difficulty)
		var storedData = readFromStorage()
		storedData.append(updatedScore)
		writeToStorage(for: storedData)
	}
	
	func fetchStorageValues() -> [ScoreData] {
		readFromStorage()
	}
	
	private func readFromStorage() -> [ScoreData] {
		if let data = UserDefaults.standard.data(forKey: scores) {
			let decoder = JSONDecoder()
			do {
				return try decoder.decode([ScoreData].self, from: data)
			} catch {
				print("Error decoding scores")
			}
		}
		return []
	}
	
	private func writeToStorage(for updatedScores: [ScoreData]) {
		let encoder = JSONEncoder()
		do {
			let data = try encoder.encode(updatedScores)
			UserDefaults.standard.set(data, forKey: scores)
		} catch {
			print("error encoding scores")
		}
	}
}
