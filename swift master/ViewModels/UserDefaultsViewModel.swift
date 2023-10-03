//
//  UserDefaultsViewModel.swift
//  swift master
//
//  Created by AKSHAY MAHAJAN on 2023-10-02.
//

import Foundation

 typealias ScoreData = (id: String, score: Int)

class UserDefaultsViewModel {
	private let scores = "scores"
	
	
	func updateStorage(with score: Int) {
		let id = UUID().uuidString
		var updatedScore: ScoreData
		updatedScore.id = id
		updatedScore.score = score
		
		if var storedData = readFromStorage() as? [ScoreData] {
			storedData.append(updatedScore)
			writeToStorage(for: storedData)
		} else {
			writeToStorage(for: [updatedScore])
		}
	}
	
	func fetchStorageValues() -> [ScoreData] {
		if let scores = readFromStorage() as? [ScoreData] {
			return scores
		}
		return []
	}
	
	private func readFromStorage() -> [Any]? {
		UserDefaults.standard.array(forKey: scores)
	}
	
	private func writeToStorage(for updatedScores: [ScoreData]) {
		UserDefaults.standard.set(updatedScores, forKey: scores)
	}
}
