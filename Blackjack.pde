PImage card;
PImage dcard;

String[] tal = new String[52];
int kuloer =0;
int cardNumber=1;
int i=0;
int randomizer=0;
int dRandomizer=0;
int cardsDrawn = 0;
int cardPosition = 175;
int dCardPosition = 175;
boolean blackJack = true;
int cardCount = 0;
int cardCounter = 0;
boolean ace = false;
boolean dace = false;
boolean end = false;
boolean draw = false;
int dWins=0, wins=0; 
int dCard;

void setup()
{
  size(550, 900);
  background(4, 64, 8);
  noStroke();
  frameRate(60);
}

void tegnSpillePanel() {
  fill(149, 0, 0);
  rect(0, 750, 275, 150);
  fill(45, 58, 144);
  rect(275, 750, 275, 150);
  fill(4, 64, 8);
  rect(235, 75, 50, 30);
  rect(495, 75, 50, 30);
  fill(0);
  textSize(55);
  text("Hit", 100, 840);
  text("Stay", 345, 840);
  textSize(40);
  fill(255, 255, 255);
  text("Player: "+wins, 40, 720);
  text("Dealer: "+dWins, 305, 720);
  textSize(30);
  text("Card's value : "+cardCount, 40, 100); 
  text("Card's value : "+dCard, 300, 100);
}

void tegnResetKnap() {
  fill(51, 0, 0);
  rect(0, 750, 550, 150);
  fill(255, 255, 255);
  textSize(50);
  text("Play again", 155, 835);
}


void draw() {

  if (end==false) {
    tegnSpillePanel();

    if ((cardCount>=21) || (end==true)) {
      tegnResetKnap();
    }

    if (cardCount == 21) {
      textSize(50);
      text("BlackJack", 55, 400);
      wins +=1;
      end=true;
    }
    if ((cardCount>21) && (ace == false)) {
      end = true;
      dWins +=1;
    } 
    else if ((cardCount>21) && (ace == true)) {
      cardCount-=10;
      ace = false;
    }
    else if ((dCard>21) && (dace == true)) {
      dCard-=10;
      dace = false;
    }
  }
  while (cardNumber < 14) {
    tal[i] =cardNumber+""+kuloer;
    i++;
    if (kuloer== 3) {
      cardNumber+= 1;
      kuloer = -1;
    }
    kuloer += 1;
  }
}

void mouseReleased() {
  //stay
  if ((blackJack)&&(550 >= mouseX)&& (mouseX >= 275)&&(mouseY< 900)&&(mouseY>= 750)&&(end==false)&&(cardCount!=0)) {
    end=true;
    tegnResetKnap();
    while(cardCount>dCard){
    dHit();
    fill(4, 64, 8);
  rect(495, 75, 50, 30);
    textSize(30);
  fill(255, 255, 255);
  text("Card's value : "+dCard, 300, 100);
    }

    if (dCard >21) {
      textSize(25);
      text("Dealer busted with "+dCard, 130, 150);
       
      wins +=1;
    } 
    else if (dCard==21) {
      textSize(25);
      text("Dealer blackJack ", 150, 150);
      
      dWins +=1;
    } 
    else if (cardCount > dCard) {
      textSize(25);
      text("You won dealer had"+dCard, 150, 150);
      
      wins +=1;
    } 
    else if (cardCount < dCard) {
      textSize(25);
      text("You lost dealer had "+dCard, 150, 150);
      
      dWins +=1;
    } 
    else if (cardCount==dCard) {
      textSize(25);
      text("It's a tie", 150, 150);
      
      dWins +=1;
    }
    if ((cardCount==dCard) && (cardCount<12)){
      dHit();
    }
  }

//hit
  else if ((cardCount<21) && (275 >= mouseX)&& (mouseX >= 0)&&(mouseY<900 )&&(mouseY>= 750)&&(end ==false)) {
    Hit();
  } 
}

//reset
void mousePressed() {
 if (((end==true)) && ((550 >= mouseX)&& (mouseX >= 0)&&(mouseY<900 )&&(mouseY >= 750)&&(end==true))) {
    reset();
  }
}


void Hit() {


  randomizer = (int)random(0, 52);
  {
    card=loadImage(tal[randomizer]+".jpg");


    if (blackJack) {
      if (randomizer < 4)
      {
        if (ace == false) {
          {
            cardCount += 11;
            ace = true;
          }
        } else cardCount +=1;
      } else if (randomizer < 8)
        cardCount += 2;  
      else if (randomizer <12)
        cardCount +=3;
      else if (randomizer <16)
        cardCount +=4;
      else if (randomizer <20)
        cardCount += 5;
      else if (randomizer <24)
        cardCount += 6;
      else if (randomizer <28)
        cardCount += 7;
      else if (randomizer <32)
        cardCount += 8;
      else if (randomizer <36)
        cardCount += 9;
      else
        cardCount += 10;


      image(card, 40, cardPosition, 200, 350);
      cardPosition+=55;
    }
  }
}

void dHit() {


  randomizer = (int)random(0, 52);
  {
    dcard=loadImage(tal[randomizer]+".jpg");


    if (blackJack) {
      if (randomizer < 4)
      {
        if (dace == false) {
          {
            dCard += 11;
            dace = true;
          }
        } else dCard +=1;
      } else if (randomizer < 8)
        dCard += 2;  
      else if (randomizer <12)
        dCard +=3;
      else if (randomizer <16)
        dCard +=4;
      else if (randomizer <20)
        dCard += 5;
      else if (randomizer <24)
        dCard += 6;
      else if (randomizer <28)
        dCard += 7;
      else if (randomizer <32)
        dCard += 8;
      else if (randomizer <36)
        dCard += 9;
      else
        dCard += 10;


      image(dcard, 310, dCardPosition, 200, 350);
      dCardPosition+=55;
    }
  }
}


void reset() {
  kuloer= 0;
  cardsDrawn=0;
  i=0;
  cardNumber = 1;
  clear();
  background(4, 64, 8);
  cardPosition = 200;
  cardCount = 0;
  dCard=0;
  dCardPosition=200;
  ace = false;
  end= false;
}
