//
//  Blog.swift
//  Task8
//
//  Created by Алан Абзалханулы on 14.11.2024.
//

import UIKit

struct Blog {
    let title: String
    let image: UIImage
    let text: String
    let author: String
}

extension Blog {
    static func sampleData() -> [Blog] {
        return [
            Blog(
                title: "The Art of Swift Programming",
                image: UIImage(named: "work") ?? UIImage(),
                text: "Swift is a powerful and intuitive programming language for iOS, macOS, watchOS, and tvOS.",
                author: "John Appleseed"
            ),
            Blog(
                title: "Understanding UIKit in Depth",
                image: UIImage(named: "work") ?? UIImage(),
                text: "UIKit is the framework that drives the user interface of iOS applications.",
                author: "Jane Doe"
            ),
            Blog(
                title: "Building Layouts with SwiftUI",
                image: UIImage(named: "work") ?? UIImage(),
                text: "SwiftUI provides a new way to build user interfaces across all Apple platforms.",
                author: "Chris Lee"
            ),
            Blog(
                title: "Concurrency in Swift",
                image: UIImage(named: "work") ?? UIImage(),
                text: "Learn how to manage asynchronous tasks and concurrency in Swift.",
                author: "Alice Johnson"
            ),
            Blog(
                title: "Optimizing iOS Performance",
                image: UIImage(named: "work") ?? UIImage(),
                text: "Performance optimization is crucial for creating a responsive and smooth user experience.",
                author: "Bob Smith"
            )
        ]
    }
}
