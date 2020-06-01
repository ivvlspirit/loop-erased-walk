/*

Created by Ivan Vlahov
u/spiritcs

If you want to share anything made using this program,
please give me credit by linking my Youtube channel
and the video link below:

https://www.youtube.com/user/ivanvlahov922
https://youtu.be/elUhI09UdtI

*/

public class LEWClass {

	int cols;
	int rows;
	float verDotDist;
	float horDotDist;
	color c;
	boolean dotsVisibilty;

	ArrayList<DotData> walk;

	LEWClass(int cols, int rows){
		this.cols = cols;
		this.rows = rows;

		horDotDist = width/this.cols;
		verDotDist = height/this.rows;

		walk = new ArrayList<DotData>();
		ArrayList<PVector> dir = new ArrayList<PVector>();

		PVector newPV = new PVector(floor(random(cols)), floor(random(rows)));

		if(newPV.x != cols-1) dir.add(new PVector(newPV.x+1, newPV.y));
		if(newPV.x != 0) dir.add(new PVector(newPV.x-1, newPV.y));
		if(newPV.y != rows-1) dir.add(new PVector(newPV.x, newPV.y+1));
		if(newPV.y != 0) dir.add(new PVector(newPV.x, newPV.y-1));
		
		walk.add(new DotData((int)newPV.x, (int)newPV.y, dir));

		c = #fe7f9c; // default color
		dotsVisibilty = true; // default dot visibility
	}

	public void setColor(color c){
		this.c = c;
	}

	public void setDotVisibility(boolean dotsVisibilty){
		this.dotsVisibilty = dotsVisibilty;
	}

	public void displayLEW(){
		float circleRadius = (verDotDist<horDotDist) ? verDotDist/5 : horDotDist/5;
		fill(c);
		stroke(c);
		if(dotsVisibilty){
			strokeWeight(circleRadius/2);
		}else{
			strokeWeight(circleRadius*1.5);
		}

		if(dotsVisibilty){
			for(float i=0; i<cols; i++){
				for(float j=0; j<rows; j++){
					ellipse(horDotDist*(i+0.5), verDotDist*(j+0.5), circleRadius, circleRadius);
				}
			}
		}

		for(int i = 1; i < walk.size(); i++){
			PVector v1 = walk.get(i-1).coord;
			PVector v2 = walk.get(i).coord;
			line((v1.x+0.5)*horDotDist, (v1.y+0.5)*verDotDist, (v2.x+0.5)*horDotDist, (v2.y+0.5)*verDotDist);
		}
	}

	public void iterateLEW(){
		
		int loopStart = walk.indexOf(walk.get(walk.size()-1));

		if(loopStart != walk.size()-1){
			for(int i=walk.size()-1; i>loopStart; i--){
				walk.remove(i);
			}
		}else{
			int dirSize = walk.get(walk.size()-1).directions.size();

			int randDir = floor(random(dirSize));
			
			ArrayList<PVector> dir = new ArrayList<PVector>();

			PVector newPV = walk.get(walk.size()-1).getDirElement(randDir);
					
			if(newPV.x != cols-1 && !walk.get(walk.size()-1).equals(new DotData((int)newPV.x+1, (int)newPV.y, dir))) dir.add(new PVector(newPV.x+1, newPV.y));
			if(newPV.x != 0	     && !walk.get(walk.size()-1).equals(new DotData((int)newPV.x-1, (int)newPV.y, dir))) dir.add(new PVector(newPV.x-1, newPV.y));
			if(newPV.y != rows-1 && !walk.get(walk.size()-1).equals(new DotData((int)newPV.x, (int)newPV.y+1, dir))) dir.add(new PVector(newPV.x, newPV.y+1));
			if(newPV.y != 0		 && !walk.get(walk.size()-1).equals(new DotData((int)newPV.x, (int)newPV.y-1, dir))) dir.add(new PVector(newPV.x, newPV.y-1));

			walk.add(new DotData((int)newPV.x, (int)newPV.y, dir));
		}
	}


}