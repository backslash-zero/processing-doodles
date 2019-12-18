var song;
var amplitude;
var growth;

var W = window.innerWidth;
var H = window.innerHeight;

function preload() {
	song = loadSound('./sleepy.mp3');
}

function setup() {
	createCanvas(W, H, WEBGL);
	amplitude = new p5.Amplitude();
	song.play();
}

function draw() {	
	var i = 0;

	background (255);
	song.setVolume(0.5);
	stroke(0);
	fill(255);
	growth = map(amplitude.getLevel(), 0, 1, 1, 1.15);
	//translate(W / 2 + sin(growth) * tan(i) * W / 3, H / 2 + sin(growth) * tan(i) * W / 3);
	//rotate(360 * growth)
	/*for (i = 0; i < 7; i++)
	{
		//ellipse(W / 4 * sin(i), H / 4 * cos(i), W / 20 * cos(growth) * i, W / 20 * cos(growth) * i);
	}å*/
	rotateY(millis() / 1000);
	//translate(W / 2, H / 2 , [z])
	scale(growth, growth, growth);
	sphere(100);
}