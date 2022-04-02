import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    app.get("image", ":cat") { req -> Response in
        let name = req.parameters.get("cat")
        return req.redirect(to: "/images/Cat/\(name ?? "0").jpg")
    }
    
    
//    app.get("api", "advice") { req -> EventLoopFuture<Void> in
//
//        try await req.fileio.readFile(at: "/Advice/advice.json") { chunk in
//            return chunk // ByteBuffer
//        }
//    }



    try app.register(collection: TodoController())
}
