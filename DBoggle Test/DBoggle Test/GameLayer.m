//
//  GameLayer.m
//  DBoggle Test
//
//  Created by Arnav Kumar on 12/2/13.
//
//

#import "GameLayer.h"
#import "Tile.h"
#import "cocos2d.h"
#import "ResultLayer.h"
#import "MainMenuLayer.h"
#import "ScrollingMenuScene.h"
#import "Dictionary.h"

@interface GameLayer ()

@property (nonatomic) BOOL *userCanRotate; //user is allowed to rotate the board or not
@property (nonatomic) NSUInteger angle; // total angle by which the board is rotated till that point
@property (nonatomic) BOOL *isPaused;   // checks whether game is paused
@property (nonatomic, strong) NSArray *letters; //array of the letters on screen
@property (nonatomic, strong) CCNode *boardManager; //Frame of reference at centre of board. Holds 'board' and 'letters'
@property (nonatomic, strong) CCSprite *board;  //A sprite on board manager. Holds all the letters.
@property (nonatomic, strong) CCSprite *pauseButton;
@property (nonatomic, strong) CCSprite *rotateButton;
@property (nonatomic, strong) CCLabelTTF *timer;    //Label to display time remaning
@property (nonatomic, strong) NSNumber *time; //to do - change this to a non-strong NSInteger
@property (nonatomic, strong) CCLayer *pauseLayer;  //the translucent layer that appears on going to the pause menu
@property (nonatomic, strong) CCMenu *pauseMenu;
@property (nonatomic, strong) NSMutableArray *pressedTiles; //Array to hold all the currently selected letters
@property (nonatomic, strong) NSMutableArray *playedWordsList;  //Array to hold all words played
@property (nonatomic, strong) NSMutableArray *possibleWordList;
@property (nonatomic, strong) Dictionary *dict; //Dictionary object
@property (nonatomic) NSUInteger score;
@property (nonatomic, strong) CCLabelTTF *scoreLabel;
@end

@implementation GameLayer

@synthesize pauseLayer = _pauseLayer;
@synthesize board = _board;
@synthesize letters = _letters;
@synthesize boardManager = _boardManager;
@synthesize time = _time;
@synthesize userCanRotate = _userCanRotate;
@synthesize angle = _angle;
@synthesize pressedTiles = _pressedTiles;
@synthesize dict = _dict;
@synthesize playedWordsList = _playedWords;
@synthesize possibleWordList = _possibleWordList;

- (NSMutableArray *) pressedTiles {
    if (!_pressedTiles) _pressedTiles = [[NSMutableArray alloc] init];
    return _pressedTiles;
}

- (NSMutableArray *) playedWordsList {
    if (!_playedWords) _playedWords = [[NSMutableArray alloc] init];
    return _playedWords;
}

- (NSMutableArray *) possibleWordList {
    if(!_possibleWordList) _possibleWordList = [[NSMutableArray alloc] init];
    return _possibleWordList;
}

//
- (Dictionary *) dict {
    if (!_dict) _dict = [[Dictionary alloc] init];
    return _dict;
}

- (NSArray *)lettersForBoard {
    
    /////////////////////////////////////////////////////////////////////////////////
    // TODO                                                                        //
    // This is where the board gets initialized. Implement that later.             //
    /////////////////////////////////////////////////////////////////////////////////
    
    
    
    //All tiles initialized as empty tiles. No letter.
    Tile *letter1 = [Tile spriteWithFile:@"empty_letter_active.png"];
    Tile *letter2 = [Tile spriteWithFile:@"empty_letter_active.png"];
    Tile *letter3 = [Tile spriteWithFile:@"empty_letter_active.png"];
    Tile *letter4 = [Tile spriteWithFile:@"empty_letter_active.png"];
    Tile *letter5 = [Tile spriteWithFile:@"empty_letter_active.png"];
    Tile *letter6 = [Tile spriteWithFile:@"empty_letter_active.png"];
    Tile *letter7 = [Tile spriteWithFile:@"empty_letter_active.png"];
    Tile *letter8 = [Tile spriteWithFile:@"empty_letter_active.png"];
    Tile *letter9 = [Tile spriteWithFile:@"empty_letter_active.png"];
    Tile *letter10 = [Tile spriteWithFile:@"empty_letter_active.png"];
    Tile *letter11 = [Tile spriteWithFile:@"empty_letter_active.png"];
    Tile *letter12 = [Tile spriteWithFile:@"empty_letter_active.png"];
    Tile *letter13 = [Tile spriteWithFile:@"empty_letter_active.png"];
    Tile *letter14 = [Tile spriteWithFile:@"empty_letter_active.png"];
    Tile *letter15 = [Tile spriteWithFile:@"empty_letter_active.png"];
    Tile *letter16 = [Tile spriteWithFile:@"empty_letter_active.png"];
    
    
    //New Positions
    letter1.position = ccp(-112.5, 112.5);
    letter2.position = ccp(-37.5, 112.5);
    letter3.position = ccp(37.5, 112.5);
    letter4.position = ccp(112.5, 112.5);
    letter5.position = ccp(-112.5, 37.5);
    letter6.position = ccp(-37.5, 37.5);
    letter7.position = ccp(37.5, 37.5);
    letter8.position = ccp(112.5, 37.5);
    letter9.position = ccp(-112.5, -37.5);
    letter10.position = ccp(-37.5, -37.5);
    letter11.position = ccp(37.5, -37.5);
    letter12.position = ccp(112.5, -37.5);
    letter13.position = ccp(-112.5, -112.5);
    letter14.position = ccp(-37.5, -112.5);
    letter15.position = ccp(37.5, -112.5);
    letter16.position = ccp(112.5, -112.5);
    
    //grid initialization code
    //Need to implement randomization code
    //Suggestion: use a 0-15 loop for all the indices and a 26-char array from which randomization is done.
    
    
    //get string here
    //loop through it
    
    NSArray *array = [[NSArray alloc] initWithObjects:letter1, letter2, letter3, letter4, letter5,
                      letter6, letter7, letter8, letter9, letter10, letter11, letter12, letter13, letter14, letter15, letter16, nil];
    
    NSInteger boardNum;
    NSString *f;
    NSString *filepath;
    NSData *data;
//    board_num++;
    NSLog(@"%d", boardNum);
    BOOL flag = YES;
    do {
        boardNum = arc4random() % 10;
        flag = YES;
        filepath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"board_%d", boardNum] ofType:@"txt"];
        NSLog(@"fp%@", filepath);
        if (!filepath)
        {
            flag = NO;
            continue;
        }
        data = [NSData dataWithContentsOfFile:filepath];
        NSLog(@"data%@", data);
        if (!data)
        {
            flag = NO;
            continue;
        }
        f = [NSString stringWithUTF8String:[data bytes]];
        NSLog(@"ffff%@", f);
        if (!f)
        {
            flag = NO;
            continue;
        }
    } while (flag == NO);
    
    NSLog(@"%@", filepath);
    
    NSCharacterSet *cs = [NSCharacterSet newlineCharacterSet];
    NSScanner *scanner = [NSScanner scannerWithString:f];
    
    BOOL firstCopy = YES;
    
    NSString *line;
    NSString *boardLetters;
    while(![scanner isAtEnd]) {
        if([scanner scanUpToCharactersFromSet:cs intoString:&line]) {
            NSString *copy = [NSString stringWithString:line];
            if(firstCopy) {
                boardLetters = [NSString stringWithString:copy];
                firstCopy = NO;
            }
            else {
                [self.possibleWordList addObject:copy];
//                NSLog(@"%@", [self.possibleWordList lastObject]);
            }
        }
    }

//    boardLetters = [self.possibleWordList objectAtIndex:0];     //First line of text file has the grid letters
//    [self.possibleWordList removeLastObject];

//    NSLog(@"BOOYTEAH!%@", [self.possibleWordList objectAtIndex:1]);
    
    for(NSUInteger i = 0; i < 16; i++){
        const unichar charAtIndex = [boardLetters characterAtIndex:i];
        NSString *currChar = [NSString stringWithFormat:@"%C", charAtIndex];
        NSLog(@" Current character is: %@", currChar);
        [[array objectAtIndex:i] initializeWith:currChar at:i];
    }
    
    
    //    Old Positions
    //    letter1.position = ccp(47.5, 272.5);
    //    letter2.position = ccp(122.5, 272.5);
    //    letter3.position = ccp(197.5, 272.5);
    //    letter4.position = ccp(272.5, 272.5);
    //    letter5.position = ccp(47.5, 197.5);
    //    letter6.position = ccp(122.5, 197.5);
    //    letter7.position = ccp(197.5, 197.5);
    //    letter8.position = ccp(272.5, 197.5);
    //    letter9.position = ccp(47.5, 122.5);
    //    letter10.position = ccp(122.5, 122.5);
    //    letter11.position = ccp(197.5, 122.5);
    //    letter12.position = ccp(272.5, 122.5);
    //    letter13.position = ccp(47.5, 47.5);
    //    letter14.position = ccp(122.5, 47.5);
    //    letter15.position = ccp(197.5, 47.5);
    //    letter16.position = ccp(272.5, 47.5);
    
    return array;
}

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
	
    CGSize size = [[CCDirector sharedDirector] winSize];
    NSLog(@"Height yo! %f", size.height);
    if (size.height == 480)
    {
        CCSprite *background = [CCSprite spriteWithFile:@"background.png"];
        background.anchorPoint = ccp (0,0);
        [layer addChild:background z:-1];
    }
    else
    {
        CCSprite *background = [CCSprite spriteWithFile:@"background-568h.png"];
        background.anchorPoint = ccp (0,0);
        [layer addChild:background z:-1];
    }

    
    
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        isTouchEnabled_ = YES;
		
        //        self.board = [CCSprite spriteWithFile:@"BoggleTray.png"];
        //        self.board.position = ccp(160, 160);
        //        self.letters = [self lettersForBoard];
        //
        //        [self addChild:self.board z:0];
        //        for (int i = 0; i < 16; i++)
        //        {
        //            [self addChild:[self.letters objectAtIndex:i]];
        //        }
        
        [self.dict initializeDictionary];
        
        self.angle = 0;
        self.isPaused = NO;
        CCMenuItemImage *rotate = [CCMenuItemImage itemWithNormalImage:@"Rotate.png" selectedImage:@"Rotate.png" target:self selector:@selector(rotateClicked)];    //Rotate button
        CCMenuItemImage *pause = [CCMenuItemImage itemWithNormalImage:@"Pause.png" selectedImage:@"Pause.png" target:self selector:@selector(pauseGame)];        //Pause button
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCMenu *menu = [CCMenu menuWithItems:pause, rotate, nil];   //The top banner
        self.score = 0;
        [menu alignItemsHorizontallyWithPadding:0];
        menu.position = ccp(64, size.height - 30);
        [self addChild:menu];
        
        
        CCSprite *timerBorder = [CCSprite spriteWithFile:@"timer.png"];
        timerBorder.position = ccp(267, size.height - 30);
        [self addChild:timerBorder];
        
        
        self.userCanRotate = YES;                   //to be changed based on time remaining
        self.boardManager = [CCNode node];
        self.boardManager.position = ccp(160, 160);    //CGPointMake makes a new point at those coordinates
        [self addChild:self.boardManager];
        
        
        self.board = [CCSprite spriteWithFile:@"tray.png"];
        self.board.position = ccp(0, 0);        //The frame of reference for these coordinates is boardManager, not the
                                                //screen
        self.letters = [self lettersForBoard];
        
        [self.boardManager addChild:self.board z:0];    //Add board to boardManager
        for (int i = 0; i < 16; i++)        //Add each letter one by one to the board.
        {
            [self.boardManager addChild:[self.letters objectAtIndex:i]];
        }
        
        self.time = [[NSNumber alloc] initWithInt:120];      //to-do: Change to 300
        
        //[self schedule: @selector(tick:)];
        [self schedule: @selector(tick:) interval:1];
        
        self.timer = [CCLabelTTF labelWithString:@"Go!" fontName:@"open-dyslexic" fontSize:30];
        
        self.timer.position = ccp(267, size.height - 30);
        self.timer.color = ccYELLOW;
        [self addChild:self.timer];
        
        self.scoreLabel = [CCLabelTTF labelWithString:@"Score: " fontName:@"open-dyslexic" fontSize:30];
        
        self.scoreLabel.position = ccp(60, 360);
        self.timer.color = ccWHITE;
        [self addChild:self.scoreLabel];
        
        /////////////////////////////////////////////////////////////////////////////////
        // TODO                                                                        //
        // Cover the board with a cover and animate it going down when the game starts //
        /////////////////////////////////////////////////////////////////////////////////
        
        
	}
	return self;
}

- (void) pauseGame
{
    NSLog(@"Works!");
    if (!self.isPaused)
    {
        
        
        /////////////////////////////////////////////////////////////////////////////////
        // TODO                                                                        //
        // Place the layer to the north of the board and make it slide down for effect //
        /////////////////////////////////////////////////////////////////////////////////
        
        
        
        self.isPaused = YES;
        
        //[[CCDirector sharedDirector] pause];
        self.pauseLayer = [CCLayerColor layerWithColor: ccc4(0, 50, 0, 125) width: 300 height: 350];
        self.pauseLayer.position = ccp(10, 50);
        [self addChild: self.pauseLayer z:8];
        [CCMenuItemFont setFontName:@"open-dyslexic"];
        CCMenuItemFont *resume = [CCMenuItemFont itemWithString:@"Resume" target:self selector:@selector(resumeGame)];
		CCMenuItemFont *mainMenu = [CCMenuItemFont itemWithString:@"Main Menu" target:self selector:@selector(returnToMainMenu)];
		CCMenuItemFont *newGame = [CCMenuItemFont itemWithString:@"New Game" target:self selector:@selector(newGame)];
        CCMenuItemFont *playedWords = [CCMenuItemFont itemWithString:@"Played Words" target:self selector:@selector(playedWords)];
        self.pauseMenu = [CCMenu menuWithItems:resume, mainMenu, newGame, playedWords, nil];
        [self.pauseMenu alignItemsVertically];
        [self addChild:self.pauseMenu z:10];
    }
    else
    {
        [self resumeGame];
    }
    
}

- (void) resumeGame
{
    
    /////////////////////////////////////////////////////////////////////////////////
    // TODO                                                                        //
    // Make the pause menu slide up to the north od the board then disappear       //
    /////////////////////////////////////////////////////////////////////////////////
    
    
    [self removeChild:self.pauseMenu cleanup:YES];
    [self removeChild:self.pauseLayer cleanup:YES];
    //    [[CCDirector sharedDirector] resume];
    self.isPaused = NO;
    
}

- (void) returnToMainMenu
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:0.5 scene:[MainMenuLayer scene]]];
}

- (void) newGame
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFlipX transitionWithDuration:0.5 scene:[GameLayer scene]]];
}

- (void) playedWords
{
    //try the other thing also. Here http://tonyngo.net/2011/11/scrolling-ccnode-in-cocos2d/
    
    //this is from http://www.pkclsoft.com/wp/?cat=12
    ScrollingMenuScene *ns =
    [ScrollingMenuScene nodeWithForeground:@"Pause.png"
                             andBackground:@"Default.png"
                                   andRect:CGRectMake(50.0, 40.0, 200.0, 260.0)
                                  andItems:[NSArray arrayWithObjects:
                                            @"First", @"Second", @"Third", @"Fourth",
                                            @"Fifth", @"Sixth", @"Seventh", @"Eighth",
                                            @"Ninth", @"Tenth", @"Eleventh", @"Twelfth",
                                            @"Thirteenth", @"Fourteenth", @"Fifteenth", @"Sixteenth",
                                            @"Seventeenth", @"Eighteenth", @"Nineteenth", @"Twentieth",
                                            nil]];
    [[CCDirector sharedDirector] replaceScene:ns];
}

- (NSNumber *)decrement:(NSNumber *)number
{
    int val = [number integerValue];
    val--;
    return [NSNumber numberWithInt:val];
}

-(void) tick: (ccTime) dt
{
    self.time = [self decrement:self.time];
    long sec = (long)[self.time integerValue] % 60;
    if ( sec < 10 )
        [self.timer setString:[NSString stringWithFormat:@"%ld:0%ld", (long)[self.time integerValue]/60, sec]];
    else
        [self.timer setString:[NSString stringWithFormat:@"%ld:%ld", (long)[self.time integerValue]/60, sec]];
    
    NSLog(@"%ld", (long)[self.time integerValue]);
    if ([self.time integerValue] == 0) {
        [self.timer setString:[NSString stringWithFormat:@"Done!"]];
        [self.timer setFontSize:25];
        [self unschedule:@selector(tick:)]; //to stop the tick call
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFadeTR transitionWithDuration:0.5 scene:[ResultLayer sceneWith:self.score]]];
    }
}

-(void)disableRotate
{
    self.userCanRotate = NO;
    NSLog(@"Disabled");
}

- (void)enableRotate
{
    self.userCanRotate = YES;
    NSLog(@"Enabled");
}

- (void)rotateClicked
{
    if (self.userCanRotate)
        [self rotateBoard];
}

- (void)rotateBoard
{
    [self disableRotate];
    self.angle += 90;
    if (self.angle >= 360) self.angle -= 360;
    NSLog(@"Rotation = %f", [self.board rotation]);
    id enableRotateCallback = [CCCallFunc actionWithTarget:self selector:@selector(enableRotate)];
    id rotateAction = [CCRotateBy actionWithDuration:0.5 angle:-90];    //rotates the board by 90 deg anti-clockwise
    id sequence = [CCSequence actions:rotateAction, enableRotateCallback, nil];
    [self.boardManager runAction:sequence];
    for (int i = 0; i < [self.letters count]; i++)
    {
        Tile *tile = [self.letters objectAtIndex:i];
        id rotateLetter = [CCRotateBy actionWithDuration:0.01 angle:90]; //rotates each letter by 90 deg clockwise
        [tile runAction:rotateLetter];
        [tile updateActualLocationForAnticlockwiseRotationByNinetyDegrees];
//        if (i==1)
//        {
//            CCSprite *tile = [self.letters objectAtIndex:1];
//            NSLog(@"%f, %f", tile.position.x, tile.position.y);
//            NSLog(@"Rotation = %f", [tile rotation]);
//        }
    }
    NSLog(@"Rotation = %f", [self.board rotation]);
}

-(void) updateScoreLabel:(NSUInteger) wordLength {
    if (wordLength <= 4)
        self.score += 1;
    else if (wordLength == 5)
        self.score += 2;
    else if (wordLength == 6)
        self.score += 3;
    else if (wordLength == 7)
        self.score += 4;
    else if (wordLength >= 8)
        self.score += 11;
    
    [self.scoreLabel setString:[NSString stringWithFormat:@"%lu", (unsigned long)self.score]];
    
}


//Ensures only tiles adjacent to last chosen tile can be selected
- (BOOL)canChooseTileAt:(NSUInteger)position {
//    NSArray *validLetters;
    if ([self.pressedTiles count] == 0)
        return YES;
    NSUInteger lastIndex = [[self.pressedTiles lastObject] tileNumber];
//    NSMutableIndexSet *indicesOfValidTiles = [[NSMutableIndexSet alloc] init];
    switch (position) {
        case 0:
            return (lastIndex == 1 || lastIndex == 4 || lastIndex == 5);
            break;
        case 1:
            return (lastIndex == 0 || lastIndex == 2 || lastIndex == 4 || lastIndex == 5 || lastIndex == 6);
            //            [indicesOfValidTiles addIndex:0];
            //            [indicesOfValidTiles addIndex:2];
            //            [indicesOfValidTiles addIndex:4];
            //            [indicesOfValidTiles addIndex:5];
            //            [indicesOfValidTiles addIndex:6];
            //            validLetters = [NSArray arrayWithArray:[self.letters objectsAtIndexes:indicesOfValidTiles]];
            //            return (!([validLetters indexOfObject:[[self.pressedTiles lastObject] letter]] == NSNotFound));
            break;
        case 2:
            return (lastIndex == 1 || lastIndex == 3 || lastIndex == 5 || lastIndex == 6 || lastIndex == 7);
            
            //            [indicesOfValidTiles addIndex:1];
            //            [indicesOfValidTiles addIndex:3];
            //            [indicesOfValidTiles addIndex:5];
            //            [indicesOfValidTiles addIndex:6];
            //            [indicesOfValidTiles addIndex:7];
            //            validLetters = [NSArray arrayWithArray:[self.letters objectsAtIndexes:indicesOfValidTiles]];
            //            return (!([validLetters indexOfObject:[[self.pressedTiles lastObject] letter]] == NSNotFound));
            break;
        case 3:
            return (lastIndex == 2 || lastIndex == 6 || lastIndex == 7);
            //            [indicesOfValidTiles addIndex:2];
            //            [indicesOfValidTiles addIndex:6];
            //            [indicesOfValidTiles addIndex:7];
            //            validLetters = [NSArray arrayWithArray:[self.letters objectsAtIndexes:indicesOfValidTiles]];
            //            return (!([validLetters indexOfObject:[[self.pressedTiles lastObject] letter]] == NSNotFound));
            break;
        case 4:
            return (lastIndex == 0 || lastIndex == 1 || lastIndex == 5 || lastIndex == 8 || lastIndex == 9);
            
            //            [indicesOfValidTiles addIndex:0];
            //            [indicesOfValidTiles addIndex:1];
            //            [indicesOfValidTiles addIndex:5];
            //            [indicesOfValidTiles addIndex:8];
            //            [indicesOfValidTiles addIndex:9];
            //            validLetters = [NSArray arrayWithArray:[self.letters objectsAtIndexes:indicesOfValidTiles]];
            //            return (!([validLetters indexOfObject:[[self.pressedTiles lastObject] letter]] == NSNotFound));
            break;
        case 5:
            return (lastIndex == 0 || lastIndex == 1 || lastIndex == 2 || lastIndex == 4 || lastIndex == 6 || lastIndex == 8 || lastIndex == 9 || lastIndex == 10);
            //            [indicesOfValidTiles addIndex:0];
            //            [indicesOfValidTiles addIndex:1];
            //            [indicesOfValidTiles addIndex:2];
            //            [indicesOfValidTiles addIndex:4];
            //            [indicesOfValidTiles addIndex:6];
            //            [indicesOfValidTiles addIndex:8];
            //            [indicesOfValidTiles addIndex:9];
            //            [indicesOfValidTiles addIndex:10];
            //            validLetters = [NSArray arrayWithArray:[self.letters objectsAtIndexes:indicesOfValidTiles]];
            //            return (!([validLetters indexOfObject:[[self.pressedTiles lastObject] letter]] == NSNotFound));
            break;
        case 6:
            
            return (lastIndex == 1 || lastIndex == 2 || lastIndex == 3 || lastIndex == 5 || lastIndex == 7 || lastIndex == 9 || lastIndex == 10 || lastIndex == 11);
            
            //            [indicesOfValidTiles addIndex:1];
            //            [indicesOfValidTiles addIndex:2];
            //            [indicesOfValidTiles addIndex:3];
            //            [indicesOfValidTiles addIndex:5];
            //            [indicesOfValidTiles addIndex:7];
            //            [indicesOfValidTiles addIndex:9];
            //            [indicesOfValidTiles addIndex:10];
            //            [indicesOfValidTiles addIndex:11];
            //            validLetters = [NSArray arrayWithArray:[self.letters objectsAtIndexes:indicesOfValidTiles]];
            //            return (!([validLetters indexOfObject:[[self.pressedTiles lastObject] letter]] == NSNotFound));
            break;
        case 7:
            
            return (lastIndex == 2 || lastIndex == 3 || lastIndex == 6 || lastIndex == 10 || lastIndex == 11);
            
            //            [indicesOfValidTiles addIndex:2];
            //            [indicesOfValidTiles addIndex:3];
            //            [indicesOfValidTiles addIndex:6];
            //            [indicesOfValidTiles addIndex:10];
            //            [indicesOfValidTiles addIndex:11];
            //            validLetters = [NSArray arrayWithArray:[self.letters objectsAtIndexes:indicesOfValidTiles]];
            //            return (!([validLetters indexOfObject:[[self.pressedTiles lastObject] letter]] == NSNotFound));
            break;
        case 8:
            
            return (lastIndex == 4 || lastIndex == 5 || lastIndex == 9 || lastIndex == 12 || lastIndex == 13);
            
            //            [indicesOfValidTiles addIndex:4];
            //            [indicesOfValidTiles addIndex:5];
            //            [indicesOfValidTiles addIndex:9];
            //            [indicesOfValidTiles addIndex:12];
            //            [indicesOfValidTiles addIndex:13];
            //            validLetters = [NSArray arrayWithArray:[self.letters objectsAtIndexes:indicesOfValidTiles]];
            //            return (!([validLetters indexOfObject:[[self.pressedTiles lastObject] letter]] == NSNotFound));
            break;
        case 9:
            
            return (lastIndex == 4 || lastIndex == 5 || lastIndex == 6 || lastIndex == 8 || lastIndex == 10 || lastIndex == 12 || lastIndex == 13 || lastIndex == 14);
            
            //            [indicesOfValidTiles addIndex:4];
            //            [indicesOfValidTiles addIndex:5];
            //            [indicesOfValidTiles addIndex:6];
            //            [indicesOfValidTiles addIndex:8];
            //            [indicesOfValidTiles addIndex:10];
            //            [indicesOfValidTiles addIndex:12];
            //            [indicesOfValidTiles addIndex:13];
            //            [indicesOfValidTiles addIndex:14];
            //            validLetters = [NSArray arrayWithArray:[self.letters objectsAtIndexes:indicesOfValidTiles]];
            //            return (!([validLetters indexOfObject:[[self.pressedTiles lastObject] letter]] == NSNotFound));
            break;
        case 10:
            
            return (lastIndex == 5 || lastIndex == 6 || lastIndex == 7 || lastIndex == 9 || lastIndex == 11 || lastIndex == 13 || lastIndex == 14 || lastIndex == 15);
            
            
            //            [indicesOfValidTiles addIndex:5];
            //            [indicesOfValidTiles addIndex:6];
            //            [indicesOfValidTiles addIndex:7];
            //            [indicesOfValidTiles addIndex:9];
            //            [indicesOfValidTiles addIndex:11];
            //            [indicesOfValidTiles addIndex:13];
            //            [indicesOfValidTiles addIndex:14];
            //            [indicesOfValidTiles addIndex:15];
            //            validLetters = [NSArray arrayWithArray:[self.letters objectsAtIndexes:indicesOfValidTiles]];
            //            return (!([validLetters indexOfObject:[[self.pressedTiles lastObject] letter]] == NSNotFound));
            break;
        case 11:
            
            return (lastIndex == 6 || lastIndex == 7 || lastIndex == 10 || lastIndex == 14 || lastIndex == 15);
            
            //            [indicesOfValidTiles addIndex:6];
            //            [indicesOfValidTiles addIndex:7];
            //            [indicesOfValidTiles addIndex:10];
            //            [indicesOfValidTiles addIndex:14];
            //            [indicesOfValidTiles addIndex:15];
            //            validLetters = [NSArray arrayWithArray:[self.letters objectsAtIndexes:indicesOfValidTiles]];
            //            return (!([validLetters indexOfObject:[[self.pressedTiles lastObject] letter]] == NSNotFound));
            break;
        case 12:
            
            return (lastIndex == 8 || lastIndex == 9 || lastIndex == 13);
            
            //            [indicesOfValidTiles addIndex:8];
            //            [indicesOfValidTiles addIndex:9];
            //            [indicesOfValidTiles addIndex:13];
            //            validLetters = [NSArray arrayWithArray:[self.letters objectsAtIndexes:indicesOfValidTiles]];
            //            return (!([validLetters indexOfObject:[[self.pressedTiles lastObject] letter]] == NSNotFound));
            break;
        case 13:
            
            return (lastIndex == 8 || lastIndex == 9 || lastIndex == 10 || lastIndex == 12 || lastIndex == 14);
            
            //            [indicesOfValidTiles addIndex:8];
            //            [indicesOfValidTiles addIndex:9];
            //            [indicesOfValidTiles addIndex:10];
            //            [indicesOfValidTiles addIndex:12];
            //            [indicesOfValidTiles addIndex:14];
            //            validLetters = [NSArray arrayWithArray:[self.letters objectsAtIndexes:indicesOfValidTiles]];
            //            return (!([validLetters indexOfObject:[[self.pressedTiles lastObject] letter]] == NSNotFound));
            break;
        case 14:
            
            return (lastIndex == 9 || lastIndex == 10 || lastIndex == 11 || lastIndex == 13 || lastIndex == 15);
            
            
            //            [indicesOfValidTiles addIndex:9];
            //            [indicesOfValidTiles addIndex:10];
            //            [indicesOfValidTiles addIndex:11];
            //            [indicesOfValidTiles addIndex:13];
            //            [indicesOfValidTiles addIndex:15];
            //            validLetters = [NSArray arrayWithArray:[self.letters objectsAtIndexes:indicesOfValidTiles]];
            //            return (!([validLetters indexOfObject:[[self.pressedTiles lastObject] letter]] == NSNotFound));
            break;
        case 15:
            
            return (lastIndex == 10  || lastIndex == 11 || lastIndex == 14);
            
            //            [indicesOfValidTiles addIndex:10];
            //            [indicesOfValidTiles addIndex:11];
            //            [indicesOfValidTiles addIndex:14];
            //            validLetters = [NSArray arrayWithArray:[self.letters objectsAtIndexes:indicesOfValidTiles]];
            //            return (!([validLetters indexOfObject:[[self.pressedTiles lastObject] letter]] == NSNotFound));
            break;
            
        default:
            return NO;
            break;
    }
    
    return NO;
}

- (void)tileTouchedAt:(NSUInteger)position
{
    NSLog(@"Touched");
    Tile *tile = [self.letters objectAtIndex:position];
    // put a validity if here and make the next if an else
    NSLog(@"hello %c", [self canChooseTileAt:position]);
    NSLog(@"came here");
    if ([tile isActive])
    {
        if ([self canChooseTileAt:position])
        {
            NSLog(@"came here inside");
            [self.pressedTiles addObject:tile];
            [tile deactivate];
            NSLog(@"%@", tile.letter);
            
            
//            NSArray *a = [NSArray arrayWithObjects:@"1", @"2", nil];
//            if ([a indexOfObject:@"3"] == NSNotFound)
//                NSLog(@"works");
            
        }
    }
    else
    {
        //        while ([self.pressedTiles lastObject] != tile)
        //        {
        //            //convert to do-while
        //            [[self.pressedTiles lastObject] activate];
        //            [self.pressedTiles removeLastObject];
        //        }
        //        [tile activate];
        //        [self.pressedTiles removeLastObject];
        
        Tile *lastTile;
        do
        {
            lastTile = [self.pressedTiles lastObject];
            [lastTile activate];
            [self.pressedTiles removeLastObject];
        } while ( lastTile != tile);
    }
    [self updateCurrentWord];
}

- (void) updatePlayedWordList:(NSString *)currentWord{
    [self.playedWordsList addObject:currentWord];
}

- (void)updateCurrentWord
{
    // this is where we check if the word is a valid word. If it is, I call the clear function.
    // TODO - increase efficiency by maintaining a property and use this method to update.
    NSString *currentWord = @"";
    for (Tile *tile in self.pressedTiles)
    {
        currentWord = [currentWord stringByAppendingString:tile.letter];
    }
    NSLog(@"%@", currentWord);
    
    if ([self.dict validate:[currentWord uppercaseString]]
        && currentWord.length >= 3
        && ![self.playedWordsList containsObject:currentWord])//check validity here
    {
        //to-do: Implement the dictionary
        NSLog(@"Word valid");
        [self clearAllPressedTiles];
        [self updateScoreLabel:currentWord.length];
        [self updatePlayedWordList:currentWord];
    }
}

- (void) clearAllPressedTiles
{
    [self.pressedTiles removeAllObjects];
    for (int i = 0; i < 16; i++)
    {
        [[self.letters objectAtIndex:i] activate];
    }
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.isPaused)
    {
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInView:[touch view]];
        location = [[CCDirector sharedDirector] convertToGL:location];
        //[self rotateClicked];
        double distance = 0;
        for (int i = 0; i < 16; i++)
        {
            Tile *tile = [self.letters objectAtIndex:i];
            distance = powf(location.x - tile.actualLocation.x, 2) + powf(location.y - tile.actualLocation.y, 2);
            distance = powf(distance, 0.5);
            if (i==0)
            {
                NSLog(@"Distance = %f", distance);
                NSLog(@"Location = %f, %f", location.x, location.y);
                NSLog(@"Location = %f, %f", tile.actualLocation.x, tile.actualLocation.y);
            }
            if (distance <= 37.5)
            {
                NSLog(@"Tile - %d at distance %f", i, distance);
                [self tileTouchedAt:i];
            }
        }
    }
}

@end