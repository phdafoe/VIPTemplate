//  MoviesEntity.swift
//  Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

// MARK: - MoviesEntity
struct MoviesEntity: EntityInterface, Codable {
    let feed: Feed?

    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

// MARK: - Feed
struct Feed: EntityInterface, Codable {
    let title: String?
    let id: String?
    let author: Author?
    let links: [Link]?
    let copyright: String?
    let country: String?
    let icon: String?
    let updated: String?
    let results: [ResultITunes]?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case id = "id"
        case author = "author"
        case links = "links"
        case copyright = "copyright"
        case country = "country"
        case icon = "icon"
        case updated = "updated"
        case results = "results"
    }
}

// MARK: - Author
struct Author: EntityInterface, Codable {
    let name: String?
    let uri: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case uri = "uri"
    }
}

// MARK: - Link
struct Link: EntityInterface, Codable {
    let linkSelf: String?
    let alternate: String?

    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate = "alternate"
    }
}

// MARK: - Result
struct ResultITunes: EntityInterface, Codable, Identifiable {
    let artistName: String?
    let id: String?
    let releaseDate: String?
    let name: String?
    let kind: String?
    let artistId: String?
    let artistUrl: String?
    let artworkUrl100: String?
    let genres: [Genre]?
    let url: String?
    let copyright: String?

    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case id = "id"
        case releaseDate = "releaseDate"
        case name = "name"
        case kind = "kind"
        case artistId = "artistId"
        case artistUrl = "artistUrl"
        case artworkUrl100 = "artworkUrl100"
        case genres = "genres"
        case url = "url"
        case copyright = "copyright"
    }
}

// MARK: - Genre
struct Genre: EntityInterface, Codable {
    let genreId: String?
    let name: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case genreId = "genreId"
        case name = "name"
        case url = "url"
    }
}

