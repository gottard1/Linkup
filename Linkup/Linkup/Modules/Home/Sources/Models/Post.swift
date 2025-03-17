//
//  Post.swift
//  Home
//
//  Created by Marcel Felipe Gottardi Anesi on 10/03/25.
//


import Foundation

struct Post: Identifiable, Decodable {
    let id: Int
    let title: String
    let body: String
}