//
//  CurrencyFormatterTests.swift
//  BankkkeyUnitTests
//
//  Created by Ruby on 2022/5/10.
//

import Foundation
import XCTest

@testable import Bankkkey

class Test:XCTestCase {
    var formatter:CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollorsIntoCents() throws{
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0,"929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(929466.23)
        XCTAssertEqual(result, "$929,466.23")
    }
    
    func testZeroDollarsFormatted() throws{
        let result = formatter.dollarsFormatted(00.0)
        XCTAssertEqual(result, "$0.00")
    }
    
    func testDollarsFormattedWithCurrencySymbol() throws{
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        let result = formatter.dollarsFormatted(929466.23)
        XCTAssertEqual(result, "\(currencySymbol)929,466.23")
    }
}
