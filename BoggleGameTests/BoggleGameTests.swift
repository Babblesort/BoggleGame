import XCTest
@testable import BoggleGame

class BoggleGameTests: XCTestCase {
    
    var model: BoggleModel!
    
    override func setUp() {
        super.setUp()
        model = BoggleModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_AddLetterToCurrentWord() {
        model.addLetterToCurrentWord(letter: "h")
        model.addLetterToCurrentWord(letter: "i")
        
        XCTAssertEqual("hi", model.currentWord)
    }
    
    func test_SubmitWordClearsCurrentWord() {
        model.addLetterToCurrentWord(letter: "h")
        model.addLetterToCurrentWord(letter: "i")
        model.addWord()

        XCTAssertEqual("", model.currentWord)
    }

    func test_ClearWordClearsCurrentWord() {
        model.addLetterToCurrentWord(letter: "h")
        model.addLetterToCurrentWord(letter: "i")
        model.clearWord()
        
        XCTAssertEqual("", model.currentWord)
    }

    func test_LettersArrayHasCorrectNumberOfLetters() {
        model.resetGame()
        
        XCTAssertEqual(model.randomLetters.count, 16)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
