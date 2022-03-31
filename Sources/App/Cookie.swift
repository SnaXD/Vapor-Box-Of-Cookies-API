//
//  File.swift
//  
//
//  Created by Jonathan T. Nielsen on 31/03/2022.
//

import FluentSQLiteDriver
import Vapor
import Fluent

final class Cookie: Model, Content {
    static let schema = "cookies"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Children(for: \.$cookie)
    var chips: [ChocolateChip]

    
    init() {}
    
    init(id: UUID? = nil, name: String){
        self.id = id
        self.name = name
    }
}

struct createCookie: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("cookies")
            .id()
            .field("name", .string)
            .create()
    }
    func revert(on database: Database) async throws {
        try await database.schema("cookies").delete()
    }
}
