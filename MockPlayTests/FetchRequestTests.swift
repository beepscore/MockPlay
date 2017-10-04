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

        /// In this approach, mock by subclassing the class we want to test, override methods as necessary
        /// Swift can declare an "inner class" within a function.
        class MockNSManagedObjectContext: NSManagedObjectContext {

            /// this mocked method always returns same result
            override func fetch(_ request: NSFetchRequest<NSFetchRequestResult>) throws -> [Any] {
                return [["name": "Johnny Appleseed", "email": "johnny@apple.com"]]
            }
        }

        // instantiate the mock
        // https://stackoverflow.com/questions/32064295/nsmanagedobjectcontext-init-was-deprecated-in-ios-9-0-use-initwithconcu#32064729
        let mockContext = MockNSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

        // prepare fetchRequest
        let fetchRequest = NSFetchRequest<NSDictionary>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "email ENDSWITH[cd] %@", "@apple.com")
        fetchRequest.resultType = .dictionaryResultType

        do {
            // call method under test
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
