import Vapor
import Fluent
import FluentMySQLDriver

// configures your application
public func configure(_ app: Application) throws {
    try routes(app)
    
    ///Option #1 - Local
//    app.databases.use(.mysql(hostname: "localhost", username: "vapor", password: "vapor", database: "vapor"), as: .mysql)
//    app.migrations.add(createCookie())
//    app.migrations.add(createChocolatechips())
//
    ///Option #2 - Local without SSL Cetificate typical for Docker
    var tls = TLSConfiguration.makeClientConfiguration()
    tls.certificateVerification = .none
    
    app.databases.use(.mysql(hostname: "localhost", username: "root", password: "vapor", database: "sys", tlsConfiguration: tls), as: .mysql)
    app.migrations.add(createCookie())
    app.migrations.add(createChocolatechips())

}
