import XCTest
@testable import CocaidoPackman

class CocaidoPackmanTests: XCTestCase {

    func testMoveHeroToRight() {
        let hero = Hero(position: .init(coordinate: .init(x: 0, y: 0)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .right)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 1, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToLeft() {
        let hero = Hero(position: .init(coordinate: .init(x: 1, y: 0)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .left)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToUp() {
        let hero = Hero(position: .init(coordinate: .init(x: 0, y: 1)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .up)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToDown() {
        let hero = Hero(position: .init(coordinate: .init(x: 0, y: 0)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .down)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 1))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToUpDoesNotGoOutOfBounds() {
        let hero = Hero(position: .init(coordinate: .init(x: 0, y: 0)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .up)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToLeftDoesNotGoOutOfBounds() {
        let hero = Hero(position: .init(coordinate: .init(x: 0, y: 0)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .left)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToDownDoesNotGoOutOfBounds() {
        let hero = Hero(position: .init(coordinate: .init(x: 9, y: 9)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .down)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 9, y: 9))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToRightDoesNotGoOutOfBounds() {
        let hero = Hero(position: .init(coordinate: .init(x: 9, y: 9)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .right)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 9, y: 9))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToLeftDoesNotGoThroughWall() {
        let hero = Hero(position: .init(coordinate: .init(x: 2, y: 2)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .left)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 2, y: 2))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToRightDoesNotGoThroughWall() {
        let hero = Hero(position: .init(coordinate: .init(x: 0, y: 1)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .right)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 1))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToUpDoesNotGoThroughWall() {
        let hero = Hero(position: .init(coordinate: .init(x: 1, y: 4)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .up)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 1, y: 4))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToDownDoesNotGoThroughWall() {
        let hero = Hero(position: .init(coordinate: .init(x: 1, y: 0)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .down)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 1, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToLeftDoesGoBehindBounds() {
        let hero = Hero(position: .init(coordinate: .init(x: 0, y: 0)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .left)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroToRightDoesGoBehindBounds() {
        let hero = Hero(position: .init(coordinate: .init(x: 9, y: 0)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .right)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 9, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroDownDoesGoBehindBounds() {
        let hero = Hero(position: .init(coordinate: .init(x: 0, y: 9)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .down)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 9))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testMoveHeroUpDoesGoBehindBounds() {
        let hero = Hero(position: .init(coordinate: .init(x: 0, y: 0)))
        let sut = Game(hero: hero)
        
        sut.moveHero(direction: .up)
        let expectedViewModel = GameViewModel(heroPosition: .init(x: 0, y: 0))
       
        XCTAssertEqual(sut.output(), expectedViewModel)
    }
    
    func testBoardHaveCookiesOnNonWallTiles() {
        let sut = Board()
        
        XCTAssertEqual(sut.cookiesTilesCount, sut.tilesCount - sut.wallTilesCount)
    }
    
    func testHeroCanEatCookies() {
        let hero = Hero(position: .init(coordinate: .init(x: 0, y: 0)))
        let sut = Game(hero: hero)
        let cookiesTilesCountBeforeMovement = sut.cookiesTilesInBoardCount()

        sut.moveHero(direction: .right)
        let cookiesTilesCountAfterMovement = sut.cookiesTilesInBoardCount()
        XCTAssertEqual(cookiesTilesCountBeforeMovement - 1, cookiesTilesCountAfterMovement)
    }
}

//------------------------------------------------
// _TODO [🌶]: implementation

struct Tile: Equatable {
    var isWallTile = false
    var isCookie = false
    let coordinate: Coordinate
    
    func eat() -> Tile {
        Tile(isWallTile: isWallTile,
             isCookie: false,
             coordinate: coordinate)
    }
}

struct Bounds {
    var minX: Int
    var maxX: Int
    var minY: Int
    var maxY: Int
}

struct Board {
    private var area: [Tile]
    enum Constant {
        static let boardSize = BoardSize(width: 10, height: 10)
    }
    private let boardSize = Constant.boardSize
    
    var bounds: Bounds {
        Bounds(minX: 0, maxX: boardSize.width, minY: 0, maxY: boardSize.height)
    }
//    var minX: Int { 0 }
//    var maxX: Int { bounds. }
//    var minY: Int { 0 }
//    var maxY: Int { boardSize.height }
    var cookiesTilesCount: Int { area.filter { $0.isCookie }.count }
    var tilesCount: Int { area.count }
    var wallTilesCount: Int { area.filter { $0.isWallTile }.count }
    
    init(wallCoordinates: [Coordinate] = [Coordinate(x: 1, y: 1),
                                          Coordinate(x: 1, y: 2),
                                          Coordinate(x: 1, y: 3)]) {
        var tiles = [Tile]()
        for xIndex in 0..<Constant.boardSize.width {
            for yIndex in 0..<Constant.boardSize.height {
                let tile = Board.tile(for: .init(x: xIndex, y: yIndex), wallCoordinates: wallCoordinates)
                tiles.append(tile)
            }
        }
        
        self.area = tiles
    }
    
    private static func tile(for coordinate: Coordinate, wallCoordinates: [Coordinate]) -> Tile {
        var tile = Tile(coordinate: coordinate)
        tile.isWallTile = wallCoordinates.contains(coordinate)
        tile.isCookie = !tile.isWallTile
        
        return tile
    }
    
    func filteringTiles(_ filter: (Tile) -> Bool) -> [Tile] {
        area.filter(filter)
    }
    
    mutating func eatCookie(at tile: Tile) {
        var area = self.area
        guard tile.isCookie, let tileToReplace = area.filter({ $0 == tile }).first, let index = area.firstIndex(of: tileToReplace) else {
            return
        }
        area[index] = tileToReplace.eat()
        self.area = area
    }
}

struct BoardSize {
    let width: Int
    let height: Int
}

class Game {
    private var board: Board
    private let hero: Hero
    private var viewModel: GameViewModel
    
    init(hero: Hero, board: Board = Board()) {
        self.hero = hero
        self.board = board
        let heroPosition = hero.position
        viewModel = GameViewModel(heroPosition: heroPosition.coordinate)
    }
    
    private func moveTo(_ direction: Direction) -> Coordinate {
        let coordinate = viewModel.heroPosition
        let action: (Tile, Bounds) -> Coordinate
        
        switch direction {
        case .up:
            action = coordinate.moveUp
        case .down:
            action = coordinate.moveDown
        case .left:
            action = coordinate.moveLeft
        case .right:
            action = coordinate.moveRight
        }
        
        return board.filteringTiles { tile in
            if tile.coordinate == action(tile, board.bounds) {
                board.eatCookie(at: tile)
                return true
            }
            return false
        }.map { $0.coordinate }.first ?? coordinate
    }
    
    func moveHero(direction: Direction) {
        let coordinate = moveTo(direction)
        let localViewModel = GameViewModel(heroPosition: coordinate)
        viewModel = localViewModel
    }
    
    func output() -> GameViewModel {
        viewModel
    }
    
    func cookiesTilesInBoardCount() -> Int {
        board.cookiesTilesCount
    }
}

enum Direction {
    case up, down, left, right
    
//    func xxx() ->
}

struct Hero {
    var position: Tile
}

//------------------------------------------------

struct Coordinate: Equatable {
    var x, y: Int
    
    func moveUp(from tileAboveOfPos: Tile, bounds: Bounds) -> Coordinate {
        if y != bounds.minY && !tileAboveOfPos.isWallTile {
            return Coordinate(x: x, y: y - 1)
        }
        return self
    }
    
    func moveDown(from tileBelowOfPos: Tile, bounds: Bounds) -> Coordinate {
        if y < bounds.maxY && !tileBelowOfPos.isWallTile {
            return Coordinate(x: x, y: y + 1)
        }
        return self
    }
    
    func moveLeft(from tileLeftOfPos: Tile, bounds: Bounds) -> Coordinate {
        if x != bounds.minX && !tileLeftOfPos.isWallTile {
            return Coordinate(x: x - 1, y: y)
        }
        return self
    }
    
    func moveRight(from tileRightOfPos: Tile, bounds: Bounds) -> Coordinate {
        if x < bounds.maxX && !tileRightOfPos.isWallTile {
            return Coordinate(x: x + 1, y: y)
        }
        return self
    }
}

struct GameViewModel: Equatable {
    let heroPosition: Coordinate
}

/*
 Issues / Refactoring stuff:
    Make `canHeroMove(heroCoordinate:` methos easy to read and simple
 Calling `self.consumeCookieIfPossible(tile: tile)` in 287 line, not a single responsability method
 Tile isWallTile and isCookie coud be part of an enum
 Having a method to create the board and not having all in the init
 Move the boardSize property in board and use the constant or something different to make it cleaner
 Replace at index instead of creating a new area in `eatCookie` method
 Can we remove Hero struct or refactor it?
 
 Tasks for a future:
 We should look for the score in the game instead of counting cookies
 `func cookiesTilesInBoardCount() -> Int` should not be part of the game
 */

