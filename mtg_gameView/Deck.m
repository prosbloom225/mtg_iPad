//
//  Deck.m
//  mtg_gameView
//
//  Created by Michael Osiecki on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Deck.h"

@implementation Deck
@synthesize stack;

-(id) init
{
    stack = [[NSMutableArray alloc] initWithObjects: nil];
    return self;
}
-(void) addCard:(Card *)cardToAdd
{
    [self.stack addObject:cardToAdd];
    NSLog(@"Card added");
}
-(void) printDeck
{
    for (id obj in self.stack)
        NSLog(@"Card: %@", obj);
}

-(void) drawCard
{
    NSLog(@"Drawing card");
    // Pop card off stack
    Card *tmp = [stack lastObject];
    [stack removeLastObject];
    tmp.inBattlefield = YES;
    tmp.hidden = NO;    
}
@end
