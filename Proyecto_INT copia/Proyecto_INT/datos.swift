//
//  datos.swift
//  Proyecto_INT
//
//  Created by David Alge Balaguer on 14/2/23.
//

import Foundation
struct ProductData: Codable {
    var categories: [Category]
    var id: String
    var image: Image
    var name: String
    var price: Price
        struct Category: Codable {
            var id: String
            var name: String
            var slug: String
        }
        struct Image: Codable {
            var createdAt: Int
            var description: String?
            var fileExtension: String
            var fileSize: Int
            var filename: String
            var id: String
            var isImage: Bool
            var updatedAt: Int
            var url: String
        }
        struct Price: Codable {
            var formatted: String
            var formattedWithCode: String
            var formattedWithSymbol: String
        }
    
    
}
    
