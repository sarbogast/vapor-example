import PackageDescription

let package = Package(
    name: "VaporApp",
    dependencies: [
        .Package(url: "https://github.com/sarbogast/vapor.git", majorVersion: 0, minor: 14),
        .Package(url: "https://github.com/LoganWright/MongoKitten.git", majorVersion: 0, minor: 10)
    ],
    exclude: [
      "Deploy",
      "Public",
      "Resources",
      "Config",
		  "Tests",
		  "Database"
    ]
)
