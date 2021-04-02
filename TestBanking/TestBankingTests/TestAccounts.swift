//
//  TestAccounts.swift
//  TestBankingTests
//
//  Created by Anshika on 02/04/21.
//
/*{
  "accounts" : [
    {

        "id": "098765",
        "currentBalance" : "25238.24",
        "availableBalance" : "8238.70",
        "productName" : "Saving"
    },
    {
        "id": "12345",
        "currentBalance" : "500.01",
        "availableBalance" : "500.01",
        "productName" : "Spending"
    },
    {
        "id": "135790",
        "currentBalance" : "-469.01",
        "availableBalance" : "1500.00",
        "productName" : "Spending"
    }
  ]
}*/

@testable import TestBanking
import XCTest

class TestAccounts: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInit_Id_CurrentBalance_AvailableBalance_ProductName_Instantiated() {
        let account = Account(id: 098765, currentBalance: 25238.24, availableBalance: 8238.70, productName: ProductName.Saving)
        XCTAssertNotNil(account)
        XCTAssertNotNil(account.id)
        XCTAssertEqual(account.id, 098765)
        XCTAssertNotNil(account.currentBalance)
        XCTAssertEqual(account.currentBalance, 25238.24)
        XCTAssertNotNil(account.availableBalance)
        XCTAssertEqual(account.availableBalance, 8238.70)
        XCTAssertNotNil(account.productName)
        XCTAssertEqual(account.productName, ProductName.Saving)
        
    }
    
    func testInitFromDecoder() {
        let jsonDecoder = JSONDecoder()
        let accountData = getAccountAsData()
        let account = jsonDecoder.decode(Account.self, from: accountData)
        XCTAssertEqual(account.id, 098765)
        XCTAssertEqual(account.currentBalance, 25238.24)
        XCTAssertEqual(account.availableBalance, 8238.70)
        XCTAssertEqual(account.productName, ProductName.Saving)
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

//MARK: Helper functions
extension TestAccounts {
    func getAccountAsData() -> Data {
        let json = """
{
        
        "id": "098765",
        "currentBalance" : "25238.24",
        "availableBalance" : "8238.70",
        "productName" : "Saving"
    }
"""
        let data = json.data(using: .utf8)
        return data ?? Data()
    }
}
