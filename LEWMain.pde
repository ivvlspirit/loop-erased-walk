/*

Created by Ivan Vlahov
u/spiritcs

If you want to share anything made using this program,
please give me credit by linking my Youtube channel
and the video link below:

https://www.youtube.com/user/ivanvlahov922
https://youtu.be/elUhI09UdtI

*/


int cols = 160;
int rows = 90;

LEWClass lew;

void setup() {
	// size(1920, 1080);
	size(960, 540);
	// fullScreen();
	// frameRate(10);

	lew = new LEWClass(cols, rows);
	lew.setColor(#98fb98);
	lew.setDotVisibility(false);
}

void draw() {
	background(0);

	lew.displayLEW();
	lew.iterateLEW();

	//saveFrame("/" + cols + "x" + rows + "/" + nf(1+frameCount/3600, 3) + "/######.png");

	if(frameCount == 36000) noLoop();
}