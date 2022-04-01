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
    

    app.get("image", ":cat") { req -> Response in
        let name = req.parameters.get("cat")
        return req.redirect(to: "/images/Cat/\(name ?? "0").jpg")
    }
    
//    app.get("image", ":cat") { req -> EventLoopFuture<View> in
//        let catN = req.parameters.get("cat")
//        return req.view.render("image", ["cat": catN])
//    }


    try app.register(collection: TodoController())
}
