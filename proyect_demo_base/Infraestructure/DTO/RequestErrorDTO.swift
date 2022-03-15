//
//  RequestErrorDTO.swift
//  proyect_demo_base
//
//  Created by Luis Aceredo on 13/3/22.
//

import Foundation

struct RequestError: Decodable {
     var statusMessage: String
     var success: Bool
     var statusCode: Int
}
