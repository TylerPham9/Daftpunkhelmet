#include <LedControl.h>
//Control Switches
int switch0 = 6;
int switch1 = 7;
int switch2 = 8;
int switch3 = 9;
/*
                 Dig/Row  Seg/Col
setLed(int addr, int row, int col, boolean state);

*/
/* 
 * Create a new LedControl. 
 * We use pins 12,11 and 10 for the SPI interface
 * With our hardware we have connected pin 12 to the DATA IN-pin (1) of the first MAX7221
 * pin 11 is connected to the CLK-pin(13) of the first MAX7221
 * pin 10 is connected to the LOAD-pin(12) of the first MAX7221	 	
 * We will only have a single MAX7221 attached to the arduino 
 */
LedControl lc=LedControl(12,11,10,1); 

void setup() 
  {
    
    pinMode(switch0,INPUT);
    pinMode(switch1,INPUT); 
    pinMode(switch2,INPUT); 
    pinMode(switch3,INPUT);  
    lc.shutdown(0,false);
    lc.setIntensity(0,8);
    lc.clearDisplay(0);

  }
void loop() 
  {
    int x,y,i;
    boolean c0 = digitalRead(switch0);
    boolean c1 = digitalRead(switch1);
    boolean c2 = digitalRead(switch2);
    boolean c3 = digitalRead(switch3);
    lc.setIntensity(0,8);
    lc.clearDisplay(0);
//**************************************************************
//CLEAR, Control = 0
//**************************************************************
    while (digitalRead(switch0) == LOW &&
           digitalRead(switch1) == LOW &&
           digitalRead(switch2) == LOW &&
           digitalRead(switch3) == LOW    )
          { 
            lc.clearDisplay(0);
           //lc.shutdown(0,true);
          }

//**************************************************************
//Clear END
//**************************************************************

//**************************************************************
//FULL SCREEN BACK AND FORTH = 1
//**************************************************************

    while (c0 == HIGH &&
           c1 == LOW  &&
           c2 == LOW  &&
           c3 == LOW    )
          { 
               for(x=0; x<8; x++)
               {
                 lc.setLed(0,0,x,true);
                 delay(50);
               }
               for(x=7; x>0; x--)
               {
                 lc.setLed(0,0,x,false);
                 delay(50);
               }
             lc.clearDisplay(0);
          break;
          }
//**************************************************************
//FULL SCREEN BACK AND FORTH END
//**************************************************************

//**************************************************************
//BOUNCING BAR = 2
//**************************************************************
    while (digitalRead(switch0) == LOW &&
           digitalRead(switch1) == HIGH &&
           digitalRead(switch2) == LOW  &&
           digitalRead(switch3) == LOW    )
           {
           //  for(y=0; y<8; y++)
          //   {
               for(x=0; x<8; x++)
               {
                 lc.setLed(0,0,x,true);
                 delay(25);
                 lc.setLed(0,0,x-1,true);
                 delay(25);
                 lc.setLed(0,0,x-1,false);
                 delay(25);

               }
               for(x=7; x>0; x--)
               {
                 lc.setLed(0,0,x,true);
                 delay(25);
                 lc.setLed(0,0,x-1,true);
                 delay(25);
                 lc.setLed(0,0,x,false);
                 delay(25);

               }
             //}
           break;
           }
//**************************************************************
//BOUNCING BAR END
//**************************************************************


//**************************************************************
//BREATHING  = 3
//**************************************************************
    while (digitalRead(switch0) == HIGH &&
           digitalRead(switch1) == HIGH &&
           digitalRead(switch2) == LOW  &&
           digitalRead(switch3) == LOW    )
           {
             for(x=0; x<8; x++)
              {
                lc.setLed(0,0,x,true);
              }
             for(x=0; x<12; x++)
              {
                lc.setIntensity(0,x);
                delay(100);
              }
             for(x=12; x>0; x--)
              {
                lc.setIntensity(0,x);
                delay(100);
              }
              break;
           }
  lc.clearDisplay(0);
  }
