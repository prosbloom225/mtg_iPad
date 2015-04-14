//
//  ViewController.h
//  mtg_gameView
//
//  Created by Michael Osiecki on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "Card.h"

#define myAppDelegate [[UIApplication sharedApplication] delegate]

@interface ViewController : UIViewController
{
    IBOutlet UIButton *playerLibraryDrawCard;
    Deck *playerLibrary;
    Deck *playerHand;
    UIPopoverController *popoverController;
}

@property (nonatomic, retain) UIButton *playerLibraryDrawCard;
@property (nonatomic, retain) Deck *playerLibrary;
@property (nonatomic, retain) Deck *playerHand;
@property (nonatomic, retain) UIPopoverController *popoverController;



-(void) drawCard;

@end
