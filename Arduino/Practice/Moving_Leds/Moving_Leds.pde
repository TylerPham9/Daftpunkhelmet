int Led0 = 0;
int Led1 = 1;
int Led2 = 2;
int Led3 = 3;
int Led4 = 4;
int Led5 = 5;
int Led6 = 6;

void setup()
{
  pinMode(Led0,OUTPUT);
  pinMode(Led1,OUTPUT);
  pinMode(Led2,OUTPUT);
  pinMode(Led3,OUTPUT);
  pinMode(Led4,OUTPUT);
  pinMode(Led5,OUTPUT);
  pinMode(Led6,OUTPUT);
  pinMode(7,INPUT);
  pinMode(8,INPUT);
}

void loop ()
{
 
  int i;
 
 while(digitalRead(7)==0  &&
       digitalRead(8)==0)
    {   
       for (i=0; i<=6; i++)
       {
         digitalWrite(i,LOW);
       }
    }
 //Pulse Back and Forth
 
 while(digitalRead(7)==0  &&
       digitalRead(8)==1)
    {   
 for (i=0; i<=6; i++)
   {
     digitalWrite(i,HIGH);
     digitalWrite(i-1,LOW);
     delay(100);
   }
 
  for (i=6; i>=0; i--)
   {
     digitalWrite(i,HIGH);
     digitalWrite(i+1,LOW);
     delay(100);
   }
    }
  //Full Back and forth
  while(digitalRead(7)==1  &&
       digitalRead(8)==0)
    {   
 
 
  for (i=0; i<=6; i++)
    {
    digitalWrite(i,HIGH);
 
    delay(100);
    }
    for (i=6; i>=0; i--)
    {
    digitalWrite(i,LOW);
 
    delay(100);
    }
    
   delay(1000);
    }
}
