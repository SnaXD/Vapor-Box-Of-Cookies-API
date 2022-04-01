//
//  File.swift
//  
//
//  Created by Jonathan T. Nielsen on 31/03/2022.
//

import FluentMySQLDriver
import Vapor
import Fluent

final class ChocolateChip: Model, Content {
    static let schema = "chocolateChips"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Parent(key: "cookie_id")
    var cookie: Cookie
    
    init() {}
    
    init(id: UUID, name: String, cookieID: UUID){
        self.id = id
        self.name = name
        // prefixing the parent property's name with $, you access the underlying property wrapper that stores the actual id's value.
        self.$cookie.id = cookieID
    }
}

struct createChocolatechips: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("chocolateChips")
            .id()
            .field("name", .string)
            .field("cookie_id", .uuid, .references("cookies", .id))
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("chocolateChips").delete()
    }
}
