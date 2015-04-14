//
//  ViewController.m
//  mtg_gameView
//
//  Created by Michael Osiecki on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"



@implementation ViewController
@synthesize playerLibraryDrawCard;
@synthesize playerLibrary, playerHand;
@synthesize popoverController;



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
	// User Code
    Card *testCard1 = [[Card alloc] initWithCardID: 1];
    Card *testCard2 = [[Card alloc] initWithCardID: 2];
    Card *testCard3 = [[Card alloc] initWithCardID: 3];
    Card *testCard4 = [[Card alloc] initWithCardID: 4];
    Card *testCard5 = [[Card alloc] initWithCardID: 5];
    
    [self.view addSubview:testCard1];
    [self.view addSubview:testCard2]; 
    [self.view addSubview:testCard3];
    [self.view addSubview:testCard4];
    [self.view addSubview:testCard5];
    
    // Test deck
    playerLibrary = [[Deck alloc] init];
    
    [playerLibrary addCard:testCard1];
    [playerLibrary addCard:testCard2];
    [playerLibrary addCard:testCard3];
    [playerLibrary addCard:testCard4];
    [playerLibrary addCard:testCard5];
    [playerLibrary printDeck];
    
    // Test Hand
    playerHand = [[Deck alloc] init];
    
    // Draw from library
    [playerLibraryDrawCard addTarget:self action:@selector(drawCard) forControlEvents:UIControlEventTouchUpInside];
    

}
-(void) drawCard
{
    [playerLibrary drawCard];
   
    
}
- (void)viewDidUnload{
    playerLibraryDrawCard = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
