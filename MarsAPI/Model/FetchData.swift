//
//  FetchData.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/12/24.
//

import Foundation
import SwiftUI

struct FetchData {
    var response: Response = Response()
    mutating func getData() async -> String{
        let URLString = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2017-09-18&api_key=46SgK5xzWzPwJhnSoeWBe9nDIgwWH6wpusUSzjUA"
        
        guard let url = URL(string: URLString) else {return " "}
        
        let(data, _) = try! await URLSession.shared.data(from: url)
        
        response = try! JSONDecoder().decode(Response.self, from: data)
        
        let dataString = String(data: data, encoding: .utf8)
        return(dataString ?? " ")
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
