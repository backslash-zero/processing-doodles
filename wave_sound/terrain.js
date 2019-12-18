var windowWidth = window.innerWidth;
var windowHeight = window.innerHeight;
var w = width * 20;
var h = height * 20;
var dist = 90;
var flying = 0.0;
var tetha;

//Sound var
var amplitude;

function preload() {
	song = loadSound('./sleepy.mp3');
}

function setup() {
	createCanvas(windowWidth, windowHeight, WEBGL);
	amplitude = new p5.Amplitude();
	song.play();c
}

function draw() {
	background(0);
}

// Window resize
function windowResized() {
	resizeCanvas(windowWidth, windowHeight);
  }