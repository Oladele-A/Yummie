//
//  YummieError.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 9/26/22.
//

import Foundation

enum YummieError: String, Error{
    case errorDecoding =  "The data received from the server is invalid. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection" //request timeout
    case unknownError = "I have no idea what is wrong"
    case invalidUrl = "The url is invalid, input a valid url"
    case serverError = "Invalid response from the server. Please try again."
}
