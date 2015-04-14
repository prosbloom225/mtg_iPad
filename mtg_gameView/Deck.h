//
//  Deck.h
//  mtg_gameView
//
//  Created by Michael Osiecki on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
{
    NSMutableArray *stack;
}

@property (retain, nonatomic) NSMutableArray *stack;

-(void) addCard: (Card *) cardToAdd;
-(void) printDeck;
-(void) drawCard;
@end

