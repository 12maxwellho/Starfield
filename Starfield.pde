NormalParticle bob;
Particle[] stars;
int check = 1;
void setup()
{
	size(500,500);
	background(175,238,238);
	bob = new NormalParticle();
	stars = new Particle[1000];
	for(int i=0;i<stars.length;i++)
	{
		stars[i] = new NormalParticle();
	}
	for(int j=0;j<stars.length/10;j++)
	{
		stars[j] = new JumboParticle();
	}
	stars[0] = new OddballParticle();
}
void draw()
{
	background(175,238,238);
	bob.move();
	bob.show();
	for(int i=0;i<stars.length;i++)
	{	
		stars[i].move();
		stars[i].show();
	}
	if(((Math.abs(mouseX-((OddballParticle)stars[0]).myX)<10)&&mousePressed==true)&&((Math.abs(mouseY-((OddballParticle)stars[0]).myY)<10)&&mousePressed==true))
	{
		check = 2;
	}
	if(check==2)
	{
		background(0);
		textSize(30);
		textAlign(CENTER);
		fill(175,238,238);
		text("You win the match!",250,250);
	}
}
class NormalParticle implements Particle
{
	int myColor;
	double theta, myX, myY, speed;
	NormalParticle()
	{
		myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
		theta = Math.random()*2*Math.PI;
		speed = (Math.random()*2)+0.1;
		myX = 250;
		myY = 250;
	}
	public void move()
	{
		myX = myX+speed*Math.cos(theta);
		myY = myY+speed*Math.sin(theta);
		if((Math.abs(myX-250)>250)||(Math.abs(myY-250)>250))
		{ 
 			speed=speed*-1; 
 		} 

	}
	public void show()
	{
		fill(myColor);
		ellipse((float)myX,(float)myY,15,15);
	}
}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	int myColor, myX, myY;
	OddballParticle()
	{
		myX = 250;
		myY = 250;
	}
	public void move()
	{
		if(myX>0 && myX<501)
 		{
 			myX = myX + ((int)(Math.random()*15)-7);
 		}
 		else if(myX>500)
 		{
 			myX=myX-1;
 		}
 		else
 		{
 			myX=myX+1;
 		}
 		if(myY>0 && myY<501)
 		{
 			myY = myY + ((int)(Math.random()*15)-7);
 		}
 		else if(myY>500)
 		{
 			myY=myY-1;
 		}
 		else
 		{
 			myY=myY+1;
 		}
	}
	public void show()
	{
		fill(255);
		ellipse(myX-5,myY,10,2);
		ellipse(myX+5,myY,10,2);
		fill(255,215,0);
		ellipse(myX,myY,10,10);
	}
}
class JumboParticle extends NormalParticle
{
	JumboParticle()
	{
		myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
		theta = Math.random()*2*Math.PI;
		myX = 250;
		myY = 250;
		speed = (Math.random()*20)+0.1;
	}
	public void show()
	{
		fill(myColor);
		ellipse((float)myX,(float)myY,30,30);
	}
}

