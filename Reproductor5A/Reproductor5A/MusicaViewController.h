//
//  MusicaViewController.h
//  Reproductor5A
//
//  Created by Mac06 on 16/03/22.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MusicaViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *sldCancion;
@property (weak, nonatomic) IBOutlet UILabel *lblTiempo;
@property (weak, nonatomic) IBOutlet UIImageView *imgCancion;
@property (weak, nonatomic) IBOutlet UILabel *lblTrack;
@property (nonatomic, strong)AVAudioPlayer * reproductor;
@property (nonatomic, strong)NSTimer * tiempo;
@property (nonatomic, strong)NSArray * canciones;
@property (nonatomic, strong)NSArray * imagenes;
@property (nonatomic, strong)NSArray * webs;

- (IBAction)cambiarTrack;
- (IBAction)cambiarVelocidad;
- (IBAction)playPausa:(UIButton *)sender;
- (IBAction)cambiarvolumen:(UISlider *)sender;
- (IBAction)panearTrack:(UISegmentedControl *)sender;
- (IBAction)ifAnterior:(UISwipeGestureRecognizer *)sender;
- (IBAction)ifSiguiente:(UISwipeGestureRecognizer *)sender;
- (void)setearTrack;
- (void)cronometrarTrack: (NSTimer *) timer;
@end

NS_ASSUME_NONNULL_END
