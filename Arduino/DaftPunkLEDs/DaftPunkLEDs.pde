#include <Sprite.h>
#include <Matrix.h>
#include "LedControl.h"
//Control Switches
int switch0 = 0;
int switch1 = 1;
int switch2 = 2;
int switch3 = 3;

/* create a new Matrix instance
   pin 13: data  (din)
   pin 12: load  (load)
   pin 11: clock (clk)
*/

//                   DIN, CLK, LOAD, #chips
Matrix myLeds = Matrix(13, 12, 11, 3);

Sprite HeartFull = Sprite(8, 8,
  B01100110,
  B11111111,
  B11111111,
  B11111111,
  B01111110,
  B00111100,
  B00011000,
  B00000000
);

Sprite HeartEmpty = Sprite(8, 8,
  B01100110,
  B10011001,
  B10000001,
  B10000001,
  B01000010,
  B00100100,
  B00011000,
  B00000000
);

Sprite Bar = Sprite(4, 8,
  B1111,
  B1111,
  B1111,
  B1111,
  B1111,
  B1111,
  B1111,
  B1111
);
Sprite BarOff = Sprite(4, 8,
  B0000,
  B0000,
  B0000,
  B0000,
  B0000,
  B0000,
  B0000,
  B0000
);
Sprite EyesLH = Sprite(5,8,
  B00000,
  B00100,
  B01100,
  B11101,
  B01101,
  B01110,
  B00011,
  B00000
);
Sprite EyesRH = Sprite(5,8,
  B00000,
  B00100,
  B00110,
  B10111,
  B10110,
  B01110,
  B11000,
  B00000
);

void setup()
{
  pinMode(switch0,INPUT);
  pinMode(switch1,INPUT); 
  pinMode(switch2,INPUT); 
  pinMode(switch3,INPUT);  
  myLeds.clear();
}

void loop()
{
//**************************************************************
//Initializing
//**************************************************************
  int x,y,i;
  boolean c0 = digitalRead(switch0);
  boolean c1 = digitalRead(switch1);
  boolean c2 = digitalRead(switch2);
  boolean c3 = digitalRead(switch3);


//**************************************************************
//CLEAR, Control = 0
//**************************************************************
  while (c0 == LOW &&
         c1 == LOW &&
         c2 == LOW &&
         c3 == LOW    )
        { 
          myLeds.clear();
        }
//**************************************************************
//Clear END
//**************************************************************



//**************************************************************        
//Constant Beam, Control = 1
//**************************************************************
  while (c0 == HIGH &&
         c1 == LOW &&
         c2 == LOW &&
         c3 == LOW    )
         {
           for(x=2; x<=11; x++)
           {
             myLeds.write(x, 3, HIGH);
             myLeds.write(x, 4, HIGH);
          
             myLeds.write(24-x, 4, HIGH);
             myLeds.write(24-x, 4, HIGH);
             delay(100);
           }
         }
//**************************************************************         
//Constant Beam END
//**************************************************************


//**************************************************************
//Pulse Control = 2
//**************************************************************

  while (c0 == LOW&&
         c1 == HIGH &&
         c2 == LOW &&
         c3 == LOW    )
    {
      for(x=0; x<=6; x++)
        {
          myLeds.write(x, 3, HIGH);
          delay(100);
        }
      x=7;
      y=2;
      myLeds.write(x, y, HIGH);
      delay(100);
      x++;
      y--;
      myLeds.write(x, y, HIGH);
      delay(100);
      x++;
      y--;
      myLeds.write(x, y, HIGH);
      delay(100);
      for(x=9; x<=15; x++)
        {
          y++;
          myLeds.write(x, y, HIGH);
          delay(100);
        }
      x++;
      y--;
      myLeds.write(x, y, HIGH);
      delay(100);
      x++;
      y--;
      myLeds.write(x, y, HIGH);
      delay(100);
      
      for(x=18; x<=23; x++)
        {
          myLeds.write(x, 3, HIGH);
        delay(100);
        }
    }
//**************************************************************
//Pulse END
//**************************************************************


//**************************************************************
//4x8 Scanner Bar = 3
//**************************************************************
  while (c0 == HIGH &&
         c1 == HIGH &&
         c2 == LOW  &&
         c3 == LOW    )
         {
            for (i=0; i<=20; i++)
             {
              myLeds.write(0, 0, Bar);
              myLeds.write(i-1, 0, BarOff);
              delay(100);
             }
 
            for (i=20; i>=0; i--)
             {
              myLeds.write(i, 0, Bar);
              myLeds.write(i+1, 0, BarOff);
              delay(100);
             }
          }

//**************************************************************
//Scanner END
//**************************************************************

//**************************************************************
//Pulsing Heart = 4
//**************************************************************

  while (c0 == LOW &&
         c1 == LOW &&
         c2 == HIGH  &&
         c3 == LOW    )
         {
           myLeds.write(8,0, HeartEmpty);
           delay(3000);
           myLeds.write(8,0, HeartFull);
           delay(3000);
         }

//**************************************************************
//Pulsing Heart END
//**************************************************************

//**************************************************************
//Eyes = 5
//**************************************************************
  while (c0 == HIGH &&
         c1 == LOW &&
         c2 == HIGH  &&
         c3 == LOW    )
         {
           myLeds.write(0,0, EyesLH);
           myLeds.write(5,0, EyesRH);
           myLeds.write(14,0, EyesLH);
           myLeds.write(19,0, EyesRH);
         }
           
           
           
           
//**************************************************************
//Eyes END
//**************************************************************

}
