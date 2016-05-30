import S4
import Vapor

// **** WARNING ****
//
// THIS ASSUMES THAT IF YOU'RE NOT ON LINUX, YOU'RE RUNNING FROM XCODE
// IF YOU'RE RUNNING ON AN OSX SERVER, YOU SHOULD STILL USE WORKDIR="./"
//
#if os(Linux)
let workDir = "./"
#else
var workDir: String {
    let parent = #file.characters.split(separator: "/").map(String.init).dropLast().joined(separator: "/")
    let path = "/\(parent)/.."
    return path
    }
#endif

let app = Application(workDir: workDir)

/**
	This first route will return the welcome.html
	view to any request to the root directory of the website.

	Views referenced with `app.view` are by default assumed
	to live in <workDir>/Resources/Views/

	You can override the working directory by passing
	--workDir to the application upon execution.
*/
app.get("/") { request in
	return try app.view("welcome.html")
}

app.get("tests") { request in
    return try app.view("todo-backend-tests.html")
}

/**
	This will set up the appropriate GET, PUT, and POST
	routes for basic CRUD operations. Check out the
	TodoController in App/Controllers to see more.

	Controllers are also type-safe, with their types being
	defined by which StringInitializable class they choose
	to receive as parameters to their functions.
*/
app.resource("todos", controller: TodoController.self)

/**
	Middleware is a great place to filter
	and modifying incoming requests and outgoing responses.

	Check out the middleware in App/Middelware.

	You can also add middleware to a single route by
	calling the routes inside of `app.middleware(MiddelwareType) {
		app.get() { ... }
	}`
*/
app.add(CorsMiddleware())

// Print what link to visit for default port
print("Visit: \(app.host):\(app.port)")
app.start()
