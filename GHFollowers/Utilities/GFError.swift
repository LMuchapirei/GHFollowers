//
//  GFError.swift
//  GHFollowers
//
//  Created by Linval Muchapirei on 29/1/2024.
//

import Foundation


enum GFError: String,Error {
    case invalidUserName = "Username created an invalid request.Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "Invalid data response from the server. Please try again."
    case unableToGetFavorites = "There was an error getting favorites for this user. Please try again."
    case unableToSaveFavorites = "Failed to save favorites. Please try again"
    case alreadyExists = "This user has been added to favorites already. Select another."
    
}
