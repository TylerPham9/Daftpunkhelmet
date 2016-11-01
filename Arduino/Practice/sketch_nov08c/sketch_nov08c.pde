int sensePin = 0;
int ledPin = 9;
void setup()
{
  analogReference(DEFAULT);
  pinMode(ledPin, OUTPUT);

  Serial.begin(9600);
}

void loop()
{
  int val = analogRead(sensePin);
  int ledLevel = map(val, 650, 1000, 255, 0);

  val = constrain(val, 750, 900);
  analogWrite(ledPin, ledLevel);
  delay(500);
}
