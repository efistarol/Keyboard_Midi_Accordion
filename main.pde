import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus

static int noteOffset = 48; 
boolean[] active = new boolean[33];

void setup() {
  size(200, 200);
  background(0);
  MidiBus.list();
  myBus = new MidiBus(this, -1, 1); //Create a new MIDI-Bus with no input and an output on channel 1

}

void keyPressed() {
  int code = keyCode;
  if (lookUP(code)!=-1 && !active[lookUP(code)]) {
    active[lookUP(code)]=true;
    myBus.sendNoteOn(1, lookUP(code)+noteOffset, 127);
  }
}

void keyReleased() {
  int code = keyCode;
  if (lookUP(code)!=-1) {
    active[lookUP(code)]=false;
    myBus.sendNoteOff(1, lookUP(code)+noteOffset, 0);
  }
}

void draw() {
}

static int lookUP(int index) {
  switch (index) {
  case 192: return 0;
  case 65: return 1;
  case 87: return 2;
  case 89: return 3;
  case 83: return 4;
  case 69: return 5;
  case 88: return 6;
  case 68: return 7;
  case 82: return 8;
  case 67: return 9;
  case 70: return 10;
  case 84: return 11;
  case 86: return 12;
  case 71: return 13;
  case 90: return 14;
  case 66: return 15;
  case 72: return 16;
  case 85: return 17;
  case 78: return 18;
  case 74: return 19;
  case 73: return 20;
  case 77: return 21;
  case 75: return 22;
  case 79: return 23;
  case 44: return 24;
  case 76: return 25;
  case 80: return 26;
  case 46: return 27;
  case 59: return 28;
  case 91: return 29;
  case 47: return 30;
  case 222: return 31;
  case 135: return 32;

  default:
    return -1;
  }
}
