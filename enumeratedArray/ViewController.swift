//
//  ViewController.swift
//  enumeratedArray
//
//  Created by Derrick Showers on 3/11/18.
//  Copyright © 2018 Derrick Showers. All rights reserved.
//

import UIKit

enum MockEnum: Int {

    case Foo
    case Bar
    case Baz

    var name: String {
        switch self {
        case .Foo:
            return "foo"
        case .Bar:
            return "bar"
        case .Baz:
            return "baz"
        }
    }
}

struct SomeData {
    let isFirst: Bool
    let name: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let cases = buildArray()
        let data = enumerateMockCases(cases)
        print("=============FINAL RESULT==============")
        print(data.map({ $0.name }))
        print("=======================================")
    }

    private func buildArray() -> [MockEnum] {

        var values = [MockEnum]()
        var index = 1

        while let element = MockEnum(rawValue: index), element.hashValue != 0 {
            values.append(element)
            index += 1
        }

        return values
    }

    private func enumerateMockCases(_ cases: [MockEnum]) -> [SomeData] {
        return cases.enumerated().flatMap { (index, element) in
            print("============================")
            print("Index: \(index)")
            print("Mock: \(element)")
            print("Mapping...")
            print("============================")
            let isFirst = index == 0
            return SomeData(isFirst: isFirst, name: element.name)
        }
    }
}

