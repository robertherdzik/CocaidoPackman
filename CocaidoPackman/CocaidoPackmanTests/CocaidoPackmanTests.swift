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
    
    func testMoveHeroToLeft() {
        let hero = Hero(position: .init(x: 1, y: 0))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .left)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToUp() {
        let hero = Hero(position: .init(x: 0, y: 1))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .up)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToDown() {
        let hero = Hero(position: .init(x: 0, y: 0))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .down)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 1))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToUpDoesNotGoOutOfBounds() {
        let hero = Hero(position: .init(x: 0, y: 0))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .up)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToLeftDoesNotGoOutOfBounds() {
        let hero = Hero(position: .init(x: 0, y: 0))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .left)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToDownDoesNotGoOutOfBounds() {
        let hero = Hero(position: .init(x: 9, y: 9))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .down)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 9, y: 9))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToRightDoesNotGoOutOfBounds() {
        let hero = Hero(position: .init(x: 9, y: 9))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .right)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 9, y: 9))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToLeftDoesNotGoThroughWall() {
        let hero = Hero(position: .init(x: 2, y: 2))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .left)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 2, y: 2))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToRightDoesNotGoThroughWall() {
        let hero = Hero(position: .init(x: 0, y: 1))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .right)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 1))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToUpDoesNotGoThroughWall() {
        let hero = Hero(position: .init(x: 1, y: 4))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .up)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 1, y: 4))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToDownDoesNotGoThroughWall() {
        let hero = Hero(position: .init(x: 1, y: 0))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .down)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 1, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToLeftDoesGoBehindBounds() {
        let hero = Hero(position: .init(x: 0, y: 0))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .left)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToRightDoesGoBehindBounds() {
        let hero = Hero(position: .init(x: 9, y: 0))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .right)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 9, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroDownDoesGoBehindBounds() {
        let hero = Hero(position: .init(x: 0, y: 9))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .down)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 9))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroUpDoesGoBehindBounds() {
        let hero = Hero(position: .init(x: 0, y: 0))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .up)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
}

//------------------------------------------------
// _TODO [🌶]: implementation

struct Tile {
    var isWallTile = false
    let x, y: Int
}

struct Board {
    let area: [Tile]
}

struct BoardSize {
    let width: Int
    let height: Int
}

class Game {
    private var board: Board!
    private let boardSize: BoardSize = BoardSize(width: 10, height: 10)
    private let hero: Hero
    private var viewModel: GameViewModel
    
    init(hero: Hero) {
        self.hero = hero
        let heroPosition = hero.position
        viewModel = GameViewModel(heroPosition: .init(x: heroPosition.x, y: heroPosition.y))
        makeBoard()
    }
    
    private func makeBoard() {
        var tiles = [Tile]()
        
        let wallCoordinates = [Coordinate(x: 1, y: 1),
                               Coordinate(x: 1, y: 2),
                               Coordinate(x: 1, y: 3)]
        
        for i in 0..<boardSize.width {
            for j in 0..<boardSize.height {
                var tile = Tile(x: i, y: j)
                let currentCoordinate = Coordinate(x: i, y: j)
                if wallCoordinates.contains(currentCoordinate) {
                    tile.isWallTile = true
                }
                tiles.append(tile)
            }
        }
        board = Board(area: tiles)
    }
    
    private func moveTo(_ direction: Direction) -> Coordinate {
        let coordinate = viewModel.heroPosition
        
        switch direction {
        case .up:
            let usecase = canHeroMove(heroCoordinate: coordinate, action: coordinate.moveUp)
            return usecase(board, 0) ?? coordinate
        case .down:
            let usecase = canHeroMove(heroCoordinate: coordinate, action: coordinate.moveDown)
            return usecase(board, boardSize.height) ?? coordinate
        case .left:
            let usecase = canHeroMove(heroCoordinate: coordinate, action: coordinate.moveLeft)
            return usecase(board, 0) ?? coordinate
        case .right:
            let usecase = canHeroMove(heroCoordinate: coordinate, action: coordinate.moveRight)
            return usecase(board, boardSize.width) ?? coordinate
        }
    }
    
    private func canHeroMove(heroCoordinate: Coordinate,
                             action: @escaping (Tile, _ boundIndex: Int) -> Coordinate) -> (Board, _ boundIndex: Int) -> Coordinate? {
        return { board, boundIndex in
            return board.area
                .filter({ tile -> Bool in
                    if tile.x == action(tile, boundIndex).x && tile.y == action(tile, boundIndex).y {
                        return true
                    }
                    return false
                }).map { Coordinate(x: $0.x, y: $0.y) }.first
        }
    }
    
    func moveHero(direction: Direction) {
        let coordinate = moveTo(direction)
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
    
    func moveUp(from tileAboveOfPos: Tile, boundIndex: Int) -> Coordinate {
        if y != boundIndex && !tileAboveOfPos.isWallTile {
            return Coordinate(x: x, y: y - 1)
        }
        return self
    }
    
    func moveDown(from tileBelowOfPos: Tile, boundIndex: Int) -> Coordinate {
        if y < boundIndex && !tileBelowOfPos.isWallTile {
            return Coordinate(x: x, y: y + 1)
        }
        return self
    }
    
    func moveLeft(from tileLeftOfPos: Tile, boundIndex: Int) -> Coordinate {
        if x != boundIndex && !tileLeftOfPos.isWallTile {
            return Coordinate(x: x - 1, y: y)
        }
        return self
    }
    
    func moveRight(from tileRightOfPos: Tile, boundIndex: Int) -> Coordinate {
        if x < boundIndex && !tileRightOfPos.isWallTile {
            return Coordinate(x: x + 1, y: y)
        }
        return self
    }
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
