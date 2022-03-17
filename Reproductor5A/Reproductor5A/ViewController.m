//
//  ViewController.m
//  Reproductor5A
//
//  Created by Igmar Salazar on 14/03/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    self.imvSplash.frame = CGRectMake(self.imvSplash.frame.origin.x, self.view.frame.size.height, self.imvSplash.frame.size.width, self.imvSplash.frame.size.height);
    
    [UIView animateWithDuration:2 delay:.5 options:UIViewAnimationOptionCurveLinear animations:^{
        self.imvSplash.frame = CGRectMake(self.imvSplash.frame.origin.x, self.view.frame.size.height/2 - self.imvSplash.frame.size.height/2, self.imvSplash.frame.size.width, self.imvSplash.frame.size.height);
    } completion:^(BOOL finished) {
        [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(delaySplash:) userInfo:nil repeats:NO];
    }];
}

 - (void)delaySplash:(NSTimer *)timer
{
    [self performSegueWithIdentifier:@"sgSplash" sender:nil];
}

@end
