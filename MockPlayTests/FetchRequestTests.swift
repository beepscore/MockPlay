//
//  FetchRequestTests.swift
//  MockPlayTests
//
//  Created by Steve Baker on 10/4/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import XCTest
import CoreData

class FetchRequestTests: XCTestCase {

    /// http://nshipster.com/xctestcase/#mocking-in-swift
    func testFetchRequestWithMockedManagedObjectContext() {
        class MockNSManagedObjectContext: NSManagedObjectContext {
            override func fetch(_ request: NSFetchRequest<NSFetchRequestResult>) throws -> [Any] {
                return [["name": "Johnny Appleseed", "email": "johnny@apple.com"]]
            }
        }

        let mockContext = MockNSManagedObjectContext()
        let fetchRequest = NSFetchRequest<NSDictionary>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "email ENDSWITH[cd] %@", "@apple.com")
        fetchRequest.resultType = .dictionaryResultType

        do {
            let results = try mockContext.fetch(fetchRequest)
            XCTAssertEqual(results.count, 1, "fetch request should only return 1 result")
            guard let result = results.first as? [String: String] else {
                XCTFail("fetch request returned wrong type")
                return
            }

            XCTAssertEqual(result["name"], "Johnny Appleseed", "name should be Johnny Appleseed")
            XCTAssertEqual(result["email"], "johnny@apple.com", "email should be johnny@apple.com")
        } catch {
            XCTFail("fetch request should not throw")
        }
    }
    
}
