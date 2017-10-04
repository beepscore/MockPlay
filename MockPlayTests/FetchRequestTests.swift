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

        /// This example creates a mock by subclassing the class we need for our test.
        /// Override methods as necessary.
        /// Swift can declare an "inner class" within a function.
        /// Note in general we aren't interested in testing the mock,
        /// just need it to fulfill a dependency in order to test another object.
        /// For example might want a mock web service to return fake results.
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
            // call method under test, "fetch".
            // Testing this mocked method isn't so valuable or interesting in itself.
            // But the assertions show the mock is working, and this mock could be used to test other methods that need a mock.

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
