//
//  MusicaViewController.m
//  Reproductor5A
//
//  Created by Mac06 on 16/03/22.
//

#import "MusicaViewController.h"

@interface MusicaViewController ()
{
    int indice, paneo;
    float volumen, velocidad;
}

@end

@implementation MusicaViewController

@synthesize reproductor, tiempo, imagenes, webs, canciones;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    canciones = [NSArray arrayWithObjects:@"Back in black",@"Crazy",@"Let It Be", nil];
    imagenes = [NSArray arrayWithObjects:@"Back in black.jpg",@"Crazy.jpg",@"Let It Be.jpg", nil];
    webs = [NSArray arrayWithObjects:@"https://www.acdc.com",@"https://www.aerosmith.com",@"https://www.thebeatles.com", nil];
    indice = 0;
    paneo = 0;
    volumen = 1.0;
    velocidad = 1.0;
    
    [self setearTrack];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ifSiguiente:(UISwipeGestureRecognizer *)sender
{
    indice++;
    if(indice == canciones.count)
        indice = (int)canciones.count-1;
    else
        [self setearTrack];
}

- (IBAction)ifAnterior:(UISwipeGestureRecognizer *)sender
{
    indice--;
    if(indice < 0)
        indice = 0;
    else
        [self setearTrack];
}

- (IBAction)panearTrack:(UISegmentedControl *)sender
{
    paneo = reproductor.pan = sender.selectedSegmentIndex - 1;
}

- (IBAction)cambiarvolumen:(UISlider *)sender
{
    volumen = reproductor.volume = sender.value;
}

- (IBAction)playPausa:(UIButton *)sender
{
    if([reproductor isPlaying])
    {
        [reproductor pause];
        [sender setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    }
    else
    {
        [reproductor play];
        [sender setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)cambiarVelocidad {
}

- (IBAction)cambiarTrack {
}

- (void)setearTrack
{
    BOOL estado = [reproductor isPlaying];
    NSString * rutaTrack = [[NSBundle mainBundle]pathForResource: canciones[indice] ofType:@"mp3"];
    NSURL  * urlTrack = [NSURL fileURLWithPath:rutaTrack];
    reproductor = [[AVAudioPlayer alloc] initWithContentsOfURL:urlTrack error:nil];
    
    reproductor.enableRate = YES;
    reproductor.volume = volumen;
    reproductor.pan = paneo;
    reproductor.rate = velocidad;
    
    self.imgCancion.image = [UIImage imageNamed:imagenes[indice]];
    self.lblTrack.text = [NSString stringWithFormat:@"%i/%i",indice+1,(int)canciones.count];
    
    if(estado)
        [reproductor play];
}
- (void)cronometrarTrack:(NSTimer *)timer{

}
@end
