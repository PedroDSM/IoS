//
//  ViewController.h
//  Reproductor5A
//
//  Created by Igmar Salazar on 14/03/22.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imvSplash;

- (void)delaySplash:(NSTimer*)timer;

@end

