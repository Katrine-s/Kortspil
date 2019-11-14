PImage card;

String[] tal = new String[52];
int kuloer =0;
int cardNumber=1;
int i=0;
int randomizer=0;
int cardsDrawn = 0;
int cardPosition = 200;
boolean blackJack = true;
int cardCount = 0;
int cardCounter = 0;
boolean ace = false;
boolean end = false;
boolean draw = false;
int dWins=0,wins=0; 
int dCard;

void setup()
{
  size(550, 900);
  background(180, 180, 180);
  noStroke();
  frameRate(60);
}

void tegnSpillePanel(){
    fill(200, 100, 100);
  rect(0, 750, 275, 150);
  fill(45, 58, 142);
  rect(275, 750, 275, 150);
  fill(0);
  textSize(55);
  text("Hit", 100, 840);
  text("Stay", 345, 840);
  textSize(45);
  text("Player: "+wins,35,720);
  text("Dealer: "+dWins,305,720);
  textSize(30);
  text("Cards value : "+cardCount, 40, 100);
  text("Cards value : "+dCard, 300, 100);
}

void draw()
{
if(end==false){
  tegnSpillePanel();
  
if(cardCount == 21){
  textSize(50);
text("BlackJack",55,400);
wins +=1;
end=true;
}
  if((cardCount>21) && (ace == false)){
  end = true;
  textSize(50);
text("Loss",125,150);
dWins +=1;
}
else if((cardCount>21) && (ace == true)){
cardCount-=10;
ace = false;
  
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
  if((blackJack)&&(550 >= mouseX)&& (mouseX >= 275)&&(mouseY< 900)&&(mouseY>= 750)&&(end== false)){
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
 
  if ((275 >= mouseX)&& (mouseX >= 0)&&(mouseY<900 )&&(mouseY>= 750)&&((end ==true) || blackJack == true)){
    
blackJack = true;
fill(0);
Hit();}
  }


void Hit(){


    randomizer = (int)random(0, 52);{
      card=loadImage(tal[randomizer]+".jpg");

          
    if(blackJack){
      if(randomizer < 4)
      {
        if(ace == false){
      {
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
    
    
          image(card, 40, cardPosition, 200,400);
                cardPosition+=30;
    }
  }
  }


void reset(){
    kuloer= 0;
    cardsDrawn=0;
    i=0;
    cardNumber = 1;
    clear();
    background(180, 180, 180);
    cardPosition = 200;
    cardCount = 0;
    ace = false;
    end= false;

}
