import Vapor
import Leaf
import Fluent
import FluentSQLiteDriver

// configures your application
public func configure(_ app: Application) throws {
    try routes(app)
    
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    app.migrations.add(createCookie())
    app.migrations.add(createChocolatechips())
    }
