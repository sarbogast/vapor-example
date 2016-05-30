import PackageDescription

let package = Package(
    name: "VaporApp",
    dependencies: [
        .Package(url: "https://github.com/sarbogast/vapor.git", majorVersion: 0, minor: 13),
        .Package(url: "https://github.com/PlanTeam/MongoKitten.git", majorVersion: 0, minor: 10)
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
