//
//  FetchData.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/12/24.
//

import Foundation
import SwiftUI

struct FetchData {
    var response: Response
    
    var cam: String
    var year: Int
    var month: Int
    var day: Int
    
    init(cam: String, year: Int, month: Int, day: Int) {
        self.response = Response()
        self.cam = cam
        self.year = year
        self.month = month
        self.day = day
    }
    
    mutating func getData() async -> String{
        let URLString = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=\(year)-\(month)-\(day)&camera=\(cam)&api_key=46SgK5xzWzPwJhnSoeWBe9nDIgwWH6wpusUSzjUA"
        
        guard let url = URL(string: URLString) else {return " "}
        
        do {
                let (data, _) = try await URLSession.shared.data(from: url)

                // Attempt to decode the response data
                let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                response = decodedResponse  // Store the decoded response
                return String(data: data, encoding: .utf8) ?? "Unable to convert data to string"
            } catch {
                // Handle errors (network or decoding)
                print("Error fetching or decoding data: \(error)")
                return "Error fetching or decoding data"
            }
        }
}

struct Response: Codable {
    var photos: [Photo] = []
}

struct Photo: Codable {
    var id: Int?
    var sol: Int?
    var camera: Camera?
    var img_src: String?
    var earth_date: String?
    var rover: Rover?
}

struct Camera: Codable {
    var id: Int?
    var name: String?
    var rover_id: Int?
    var full_name: String?
}

struct Rover: Codable {
    var id: Int?
    var name: String?
    var landing_date: String?
    var launch_date: String?
    var status: String?
    var max_sol: Int?
    var max_date: String?
    var total_photos: Int?
}

extension Photo: Identifiable {
    var real_id: Int {id ?? 0}
}
