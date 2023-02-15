//
//  datos.swift
//  Proyecto_INT
//
//  Created by David Alge Balaguer on 14/2/23.
//

import Foundation
struct ProductData: Codable {
  
        
    let categories: [Category]
    let id: String
    let image: Image
    let name: String
    let price: Price
        struct Category: Codable {
            let id: String
            let name: String
            let slug: String
        }
        struct Image: Codable {
            let createdAt: Int
            let description: String?
            let fileExtension: String
            let fileSize: Int
            let filename: String
            let id: String
            let isImage: Bool
            let updatedAt: Int
            let url: String
        }
        struct Price: Codable {
            let formatted: String
            let formattedWithCode: String
            let formattedWithSymbol: String
        }
    
    
}
    
