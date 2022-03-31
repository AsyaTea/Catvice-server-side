import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    app.get("jacopo") { req -> String in
        return "Jacopo è un clown"
    }

    try app.register(collection: TodoController())
}
