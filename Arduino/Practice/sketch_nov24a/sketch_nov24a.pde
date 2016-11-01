#include "LedControl.h" //  need the library
LedControl lc=LedControl(12,11,10,1); // lc is our object
// pin 12 is connected to the MAX7219 pin 1
// pin 11 is connected to the CLK pin 13
// pin 10 is connected to LOAD pin 12
// 1 as we are only using 1 MAX7219
void setup()
{
// the zero refers to the MAX7219 number, it is zero for 1 chip
lc.shutdown(0,false);// turn off power saving, enables display
lc.setIntensity(0,8);// sets brightness (0~15 possible values)
lc.clearDisplay(0);// clear screen
}
void loop()
{/*
for (int row=0; row<8; row++)
{
for (int col=0; col<8; col++)
{
lc.setLed(0,col,row,true); // turns on LED at col, row
delay(100);
lc.setLed(0,col,row,false); // turns off LED at col, row
delay(10);
}
}*/

for (int y = 0; y < 8 ; y++)
{
  lc.setLed(0,0,y,true);
  delay(50);
}
for (int x = 8; x > 0 ; x--)
{
  lc.setLed(0,0,x,false);
  delay(50);
}
/*lc.setLed(0,0,0,true);
delay(100);
lc.setLed(0,0,0,false);
delay(100);

lc.setLed(0,0,1,true);
delay(100);
lc.setLed(0,0,1,false);
delay(100);
lc.setLed(0,0,2,true);
delay(100);
lc.setLed(0,0,2,false);
delay(100);*/
}
