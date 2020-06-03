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
    enum Kind {
        case wall
        case cookie
        case empty
    }
    
    let type: Kind
    let coordinate: Coordinate
    var isCookie: Bool {
        type == .cookie
    }
    var isWall: Bool {
        type == .wall
    }
    
    init(type: Kind = .empty,
         coordinate: Coordinate) {
        self.type = type
        self.coordinate = coordinate
    }
    
    func eat() -> Tile {
        Tile(type: .empty,
             coordinate: coordinate)
    }
}

struct Bounds {
    var minX: Int
    var maxX: Int
    var minY: Int
    var maxY: Int
}

struct BoardSize {
    let width: Int
    let height: Int
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
    var cookiesTilesCount: Int { area.filter { $0.isCookie }.count }
    var tilesCount: Int { area.count }
    var wallTilesCount: Int { area.filter { $0.isWall }.count }
    
    init(wallCoordinates: [Coordinate] = [Coordinate(x: 1, y: 1),
                                          Coordinate(x: 1, y: 2),
                                          Coordinate(x: 1, y: 3)]) {
        
        self.area = Board.make(wallCoordinates: wallCoordinates)
    }
    
    func filteringTiles(_ filter: (Tile) -> Bool) -> [Tile] {
        area.filter(filter)
    }
    
    func tile(for coordinate:  Coordinate) -> Tile? {
        area.first { $0.coordinate == coordinate }
    }
    
    mutating func eatCookie(at tile: Tile) {
        var area = self.area
        guard tile.isCookie, let tileToReplace = area.filter({ $0 == tile }).first, let index = area.firstIndex(of: tileToReplace) else {
            return
        }
        area[index] = tileToReplace.eat()
        self.area = area
    }
    
    static private func make(wallCoordinates: [Coordinate]) -> [Tile] {
        var tiles = [Tile]()
        for xIndex in 0..<Constant.boardSize.width {
            for yIndex in 0..<Constant.boardSize.height {
                let tile = Board.tile(for: .init(x: xIndex, y: yIndex),
                                      wallCoordinates: wallCoordinates)
                tiles.append(tile)
            }
        }
        
        return tiles
    }
    
    private static func tile(for coordinate: Coordinate, wallCoordinates: [Coordinate]) -> Tile {
        if wallCoordinates.contains(coordinate) {
            return Tile(type: .wall, coordinate: coordinate)
        }
        
        return Tile(type: .cookie, coordinate: coordinate)
    }
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
        let coordinateAction = coordinate.moveAction(direction: direction,
                                                     bounds: board.bounds)
        
        return board.filteringTiles {
            $0.coordinate == coordinateAction($0.isWall, board.bounds)
        }.map { $0.coordinate }.first ?? coordinate
    }
    
    func moveHero(direction: Direction) {
        let coordinate = moveTo(direction)
        
        if let tile = board.tile(for: coordinate) {
            board.eatCookie(at: tile)
            viewModel = GameViewModel(heroPosition: coordinate)
        }
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
}

struct Hero {
    var position: Tile
}

//------------------------------------------------

struct Coordinate: Equatable {
    var x, y: Int
    
    func moveUp(isWallTile: Bool, bounds: Bounds) -> Coordinate {
        if y != bounds.minY && !isWallTile {
            return Coordinate(x: x, y: y - 1)
        }
        return self
    }
    
    func moveDown(isWallTile: Bool, bounds: Bounds) -> Coordinate {
        if y < bounds.maxY && !isWallTile {
            return Coordinate(x: x, y: y + 1)
        }
        return self
    }
    
    func moveLeft(isWallTile: Bool, bounds: Bounds) -> Coordinate {
        if x != bounds.minX && !isWallTile {
            return Coordinate(x: x - 1, y: y)
        }
        return self
    }
    
    func moveRight(from isWallTile: Bool, bounds: Bounds) -> Coordinate {
        if x < bounds.maxX && !isWallTile {
            return Coordinate(x: x + 1, y: y)
        }
        return self
    }
    
    typealias MoveAction = (_ isWallTile: Bool, _ boardBounds: Bounds) -> Coordinate
    func moveAction(direction: Direction, bounds: Bounds) -> MoveAction {
        let action: (Bool, Bounds) -> Coordinate
        
        switch direction {
        case .up:
            action = moveUp
        case .down:
            action = moveDown
        case .left:
            action = moveLeft
        case .right:
            action = moveRight
        }
        
        return action
    }
}

struct GameViewModel: Equatable {
    let heroPosition: Coordinate
}

/*
 Issues / Refactoring stuff:

 - Replace at index instead of creating a new area in `eatCookie` method
 - Can we remove Hero struct or refactor it?
 - Add acceptance test: e.g. move from A (0, 0) to point B (3, 4)
 
 Tasks for a future:
 - We should look for the score in the game instead of counting cookies
 `func cookiesTilesInBoardCount() -> Int` should not be part of the game
 */

