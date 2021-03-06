//
//  IntroLayer.m
//  DBoggle Test
//
//  Created by Arnav Kumar on 12/2/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "IntroLayer.h"
#import "MainMenuLayer.h"


#pragma mark - IntroLayer

// HelloWorldLayer implementation
@implementation IntroLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	IntroLayer *layer = [IntroLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

//
-(void) onEnter
{
	[super onEnter];
    
	// ask director for the window size
	CGSize size = [[CCDirector sharedDirector] winSize];
//    [[CCDirector sharedDirector] setDisplayFPS:NO];
    
	CCSprite *background;
	
    if (size.height == 568) {
        background = [CCSprite spriteWithFile:@"introscreen-568h.png"];
    }
    else {
        background = [CCSprite spriteWithFile:@"introscreen.png"];
    }
	background.position = ccp(size.width/2, size.height/2);
    
	// add the label as a child to this Layer
	[self addChild: background];
	
	// In one second transition to the new scene
	[self scheduleOnce:@selector(makeTransition:) delay:1];
}

-(void) makeTransition:(ccTime)dt
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[MainMenuLayer scene] withColor:ccWHITE]];
}
@end
