int v0, v1, v2, v3, v4, v5, v6, v7;

void setup() {
  Serial.begin(9600);
  analogReference(EXTERNAL);
}

void loop() {
  v0 = 1023-analogRead(A0);
  v1 = 1023-analogRead(A1);
  v2 = 1023-analogRead(A2);
  v3 = 1023-analogRead(A3);
  v4 = 1023-analogRead(A4);
  v5 = 1023-analogRead(A5);
  v6 = 1023-analogRead(A6);
  v7 = 1023-analogRead(A7);
  
  Serial.print(v0);
  Serial.print(",");
  Serial.print(v1);
  Serial.print(",");
  Serial.print(v2);
  Serial.print(",");
  Serial.print(v3);
  Serial.print(",");
  Serial.print(v4);
  Serial.print(",");
  Serial.print(v5);
  Serial.print(",");
  Serial.print(v6);
  Serial.print(",");
  Serial.print(v7);
  Serial.println();
  delay(250);
}
