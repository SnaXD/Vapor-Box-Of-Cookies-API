import Vapor

func routes(_ app: Application) throws {
    app.get("cookie") { req async throws in
        try await Cookie.query(on: req.db).all()
    }
    
    app.post("cookie") { req -> EventLoopFuture<Cookie> in
        let cookie = try req.content.decode(Cookie.self)
        return cookie.create(on: req.db) .map { cookie }
    }
    
    app.post("chocolatechip") { req -> ChocolateChip in
        let chocolateChip = try req.content.decode(ChocolateChip.self)
        try await chocolateChip.create(on: req.db)
        return chocolateChip
    }
    
    app.get("box") { req in
        try await Cookie.query(on: req.db).with(\.$chips).all()
    }
}
