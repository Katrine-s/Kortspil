PImage card;

String[] tal = new String[52];
int kuloer =0;
int cardNumber=1;
int i=0;
int randomizer=21;
int cardsDrawn = 0;
int cardPosition = 200;
boolean blackJack = false;
int cardCount = 0;
int cardCounter = 0;
boolean ace = false;
boolean end = false;
boolean draw = false;
int dWins=0,wins=0; 

void setup()
{
  size(550, 900);
  background(255);
  noStroke();
  textSize(50);
  frameRate(60);
}

void draw()
{
if(end==false){
  fill(0, 255, 0);
  rect(0, 750, 275, 150);
  rect(275, 750, 275, 150);
  fill(0);
  text("Hit", 125, 840);
   text("BlackJack", 660, 565);
  text("Reset", 705, 365);
  if(blackJack==false)
  text("Cards Drawn : "+cardsDrawn, 500, 100);
    if (blackJack==true){
 
    fill(0, 255, 0);
rect(490,670,130,160);
fill(0);
 text("BlackJack",650,200);
text("Stay",490,765);
text("Dealer: "+dWins,49,130);
text("Player: "+wins,50,80);
    }
if(cardCount == 21){
  textSize(200);
text("BlackJack",80,300);
textSize(50);
wins +=1;
end=true;
}
  if((cardCount>21) && (ace == false)){
  end = true;
  textSize(200);
text("Bust",300,300);
textSize(50);
dWins +=1;
}
else if(cardCount>21){
cardCount-=10;
ace = false;
      fill(255);
rect(500,50,450,100);
fill(0);
       text("Cards Count : "+cardCount, 500, 100);
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
    if ((890 >= mouseX)&& (mouseX >= 650)&&(mouseY< 830)&&(mouseY>= 670)&&(end == false)) 
drawButton();
  //stay
  if((blackJack)&&(620 >= mouseX)&& (mouseX >= 490)&&(mouseY< 830)&&(mouseY>= 670)&&(end== false)){
end=true;
    int dCard = (int)random(17,24);
   
    if(dCard >21){
       textSize(80);
text("Dealer busted with "+dCard,80,300);
textSize(50); 
wins +=1;
   }
   else if(dCard==21){
          textSize(100);
text("Dealer blackJack ",80,300);
textSize(50);
dWins +=1;
} 
    else if(cardCount > dCard){
      textSize(80);
text("You won dealer had"+dCard,80,300);
textSize(50);
wins +=1;
} 
    else if(cardCount < dCard){
      textSize(80);
text("You lost dealer had "+dCard,80,300);
textSize(50);
dWins +=1;
} 
else if (cardCount==dCard){
      textSize(100);
text("It's a tie",80,300);
textSize(50);
dWins +=1;
  }}
  
  if ((890 >= mouseX)&& (mouseX >= 650)&&(mouseY< 430)&&(mouseY>= 270)) {
reseti();
blackJack= false;
  dWins = 0;
  wins = 0;
  }
  if ((890 >= mouseX)&& (mouseX >= 650)&&(mouseY<630 )&&(mouseY>= 470)&&((end ==true) || blackJack == false)){
reseti();
blackJack = true;
fill(255);
rect(500,50,450,100);
fill(0);
       text("Cards Count : "+cardCount, 500, 100);
drawButton();}
  }


void drawButton(){


    randomizer = (int)random(0, 52);
    if ((cardsDrawn != 52) || (blackJack)) {
      if(blackJack == false){
      clear();
      background(255);
      }
      while (tal[randomizer] == "-1") {
        randomizer = (int)random(0, 52);
      }
      card=loadImage(tal[randomizer]+".jpg");
      tal[randomizer] ="-1";
      cardsDrawn += 1;
if (blackJack == false)
          image(card, 80, cardPosition);
    if(blackJack){
      if(randomizer < 4)
      {
        if(ace == false){
      if (cardCount +11  >21)
      cardCount+=1;
      else{
         cardCount += 11;
    ace = true;  
      }
      }
      else cardCount +=1;
  }else if(randomizer < 8)
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
    

      fill(255);
rect(500,50,450,100);
fill(0);
       text("Cards Count : "+cardCount, 500, 100);


          image(card, 80, cardPosition);
                cardPosition+=100;
          draw= false;
    }
  }
  }



void reseti(){
    kuloer= 0;
    cardsDrawn=0;
    i=0;
    cardNumber = 1;
    clear();
    background(255);
    cardPosition = 200;
    cardCount = 0;
    ace = false;
    end= false;

}
