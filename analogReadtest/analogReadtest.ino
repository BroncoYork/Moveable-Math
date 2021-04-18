int analogPin = A0;
double val; 

void setup() {
  Serial.begin(9600);
  analogReference(DEFAULT);
}

void loop() {

    val = analogRead(analogPin);
    Serial.println(val);
    delay(1000);

}
