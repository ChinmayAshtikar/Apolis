//
//  iTuneArtistsUnitTests.swift
//  iTuneArtistsUnitTests
//
//  Created by Chinmay Ashtikar on 6/17/24.
//

import XCTest
@testable import iTuneArtists

class NetworkAPIManagerTests: XCTestCase {
    
    var apiManager: NetworkAPIManager!
    
    override func setUp() {
        super.setUp()
        apiManager = NetworkAPIManager()
    }
    
    override func tearDown() {
        apiManager = nil
        super.tearDown()
    }
    
    func testFetchArtistsSuccess() {
        let expectation = self.expectation(description: "Fetch artists")
        var artists: [Artist]?
        var fetchError: Error?
        
        apiManager.fetchArtists { fetchedArtists, error in
            artists = fetchedArtists
            fetchError = error
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNotNil(artists)
        XCTAssertNil(fetchError)
    }
    
    func testFetchArtistsFailure() {
        let expectation = self.expectation(description: "Fetch artists with error")
        var artists: [Artist]?
        var fetchError: Error?
        
        let invalidURL = "https://invalidurl.com"
        
        apiManager.fetchArtists(urlString: invalidURL) { fetchedArtists, error in
            artists = fetchedArtists
            fetchError = error
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNil(artists)
        XCTAssertNotNil(fetchError)
    }
}
