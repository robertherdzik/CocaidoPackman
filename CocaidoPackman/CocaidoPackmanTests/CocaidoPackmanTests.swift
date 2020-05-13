import XCTest
@testable import CocaidoPackman

class CocaidoPackmanTests: XCTestCase {

    func testMoveHeroToRight() {
        let hero = Hero(position: .init(x: 0, y: 0))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .right)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 1, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
}

//------------------------------------------------
// _TODO [🌶]: implementation

struct Tile {
    let x, y: Int
}

struct Board {
    let area: [Tile]
}

class Game {
    private var board: Board!
    private let boardSize: CGSize = CGSize(width: 10, height: 10)
    private let hero: Hero
    private var viewModel: GameViewModel!
    
    init(hero: Hero) {
        self.hero = hero
        let heroPosition = hero.position
        viewModel = GameViewModel(heroPosition: .init(x: heroPosition.x, y: heroPosition.y))
        makeBoard()
    }
    
    func makeBoard() {
        var tiles = [Tile]()
        for i in 0..<Int(boardSize.width) {
            for j in 0..<Int(boardSize.height) {
                tiles.append(Tile(x: i, y: j))
            }
        }
        board = Board(area: tiles)
    }
    
    func moveHero(direction: Direction) {
        var coordinate = viewModel.heroPosition
        switch direction {
        case .up:
            break
        case .down:
            break
        case .left:
            break
        case .right:
            coordinate.x += 1
        }
        
        let localViewModel = GameViewModel(heroPosition: coordinate)
        
        viewModel = localViewModel
    }
    
    func output() -> GameViewModel {
        viewModel
    }
}

enum Direction {
    case up, down, left, right
}

struct Hero {
    var position: Tile
}

//------------------------------------------------

struct Coordinate: Equatable {
    var x, y: Int
}

struct GameViewModel: Equatable {
    let heroPosition: Coordinate
}

/*
 Board
 -
 
 Packman
 - move up/down/right/left
 - position
 */
