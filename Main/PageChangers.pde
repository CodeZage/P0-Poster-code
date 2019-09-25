/*
This page is for everything concerning changes of page, in terms of resetting so the page to back to what it was before it was used.
*/
//GoBack button
void reloadButton() {
  push();
  fill(highlight);
  noStroke();
  circle (width/2, subjectStart + (subjectAmount* subjectSizeY), navButtonRadius);
  push();
  stroke (highlight);
  strokeWeight (highlightWeight);
  line (0, subjectStart + (subjectAmount* subjectSizeY), width, subjectStart + (subjectAmount* subjectSizeY));
  pop();
  
  
  // if mousex and mousey is equal to button coordinates and mouse is pressed the animation starts with time + 1 
  if (dist(width/2, subjectStart + (subjectAmount* subjectSizeY),mouseX,mouseY)<navButtonRadius/2 && mousePressed==true)
  {
    time += 1;
    
    // this is the drawing and arc
    noFill();
    strokeWeight(loadingStroke);
    stroke(loadingColor);
    arc(width/2, subjectStart + (subjectAmount* subjectSizeY), loadingButtonWidth, loadingButtonHeight, 0, radiant);
    
    // animation starts here
    if(time>0)
      {
      radiant += TWO_PI/holdDownTime;
      }
  }
  pop();
}
void dragMenu() {
  push();
  stroke (highlight);
  fill (highlight);
  strokeWeight (highlightWeight);
  line (widthStart, navButtonY, width, navButtonY);
  circle (width/2, navButtonY, navButtonRadius);
  pop();
  if (navThreshold == false && navButtonY >= 120){
    navButtonY -= 30;
  } else if (navThreshold == false && navButtonY >= 100){
    navButtonY -= 20;  
  } else if (navThreshold == false && navButtonY >= 80){
    navButtonY -= 10;
  } else {
    navThreshold = true; 
  }
}
