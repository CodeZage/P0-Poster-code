void subjectBoxes() {
      //Draws the boxes on the left side
    if (pageNumber == 1) {
      for (int i = 0; i < subjectAmount; i++) {
        if (!chosenSubjectLeft[i]) {
        image(subjectPictures[i], 0, subjectStart + (i * subjectSizeY),width/2,subjectSizeY);
        }
      }

      //Draws the boxes on the right side
      for (int i = 0; i < subjectAmount; i++) {
        if (!chosenSubjectRight[i]) {
        image(subjectPictures[i + subjectAmount],width/2, subjectStart + (i * subjectSizeY),width/2,subjectSizeY);
        }
      }

    } else if(pageNumber == 0) {
      //Draws the boxes on the left side and make them follow the dragging motion
      for (int i = 0; i < subjectAmount; i++) {
        if (!chosenSubjectLeft[i]) {
        image(subjectPictures[i],0,navButtonY - ((subjectAmount-i) * subjectSizeY),width/2,subjectSizeY);
        }
      }

      //Draws the boxes on the right side and make them follow the dragging motion
      for (int i = 0; i < subjectAmount; i++) {
        if (!chosenSubjectRight[i]) {
        image(subjectPictures[i + subjectAmount], width/2, navButtonY - ((subjectAmount-i)* subjectSizeY),width/2,subjectSizeY);
        }
      }
    }
}

void subjects() {
    subjectBoxes();
    //Draws the chosen box if the chosen box is on the left side
    for (int i = 0; i < subjectAmount; i++) {

      //Scales and move the chosen box to the top and fit the screens width
      if (chosenSubjectLeft[i] && sizeChanger < sizeChangerSpeed){
        image(subjectPictures[i], 0, (subjectStart + (i * subjectSizeY)) - map(sizeChanger, 0, sizeChangerSpeed, 0, (subjectStart + (i * subjectSizeY))), map(sizeChanger, 0, sizeChangerSpeed, width / 2, width), map(sizeChanger, 0, sizeChangerSpeed, subjectSizeY, subjectStart));
        sizeChanger++;

      //when the box is in the top
      } else if (chosenSubjectLeft[i] && sizeChanger == sizeChangerSpeed) {

        //begins to animate the textbox to dropdown
        if ( textDropDown < textEnd) {
          rect(0, textDropDown, width, subjectStart - textDropDownStart);
          push();
          fill(0);
          textSize(50);
          text(subjectTexts[i],10,textDropDown, width-20,subjectStart - textDropDownStart);
          pop();
          textDropDown += dropDownSpeed;

          //when the textbox has dropped down to the specific point keep drawing it there
        } else {
          rect(0, textDropDown, width, subjectStart - textDropDownStart);
          push();
          fill(0);
          textSize(50);
          text(subjectTexts[i],10,textDropDown, width-20,subjectStart - textDropDownStart);
          text(subjectTexts[i], 100,100);
          pop();
          pageNumber = 2;
        }

        //Draws the subject in the top
        image(subjectPictures[i], 0,0,map(sizeChanger,0,sizeChangerSpeed,width/2,width), map(sizeChanger,0,sizeChangerSpeed,subjectSizeY,subjectStart));
      }

      //Draws the chosen box if the chosen box is on the left side
      if (chosenSubjectRight[i] && sizeChanger < sizeChangerSpeed){

        //Scales and move the chosen box to the top and fit the screens width
        image(subjectPictures[i + subjectAmount], width/2 - map(sizeChanger, 0, sizeChangerSpeed, 0, width/2), (subjectStart + (i * subjectSizeY)) - map(sizeChanger, 0, sizeChangerSpeed, 0, (subjectStart + (i * subjectSizeY))), map(sizeChanger, 0, sizeChangerSpeed, width / 2, width), map(sizeChanger, 0, sizeChangerSpeed, subjectSizeY, subjectStart));
        sizeChanger++;

      //when the box is in the top
      } else if (chosenSubjectRight[i] && sizeChanger == sizeChangerSpeed) {

        //begins to animate the textbox to dropdown
        if ( textDropDown < textEnd) {
          rect(0, textDropDown, width, subjectStart - textDropDownStart);
          push();
          fill(0);
          textSize(50);
          text(subjectTexts[i + subjectAmount],10,textDropDown, width-20,subjectStart - textDropDownStart);
          pop();
          textDropDown += dropDownSpeed;

        //when the textbox has dropped down to the specific point keep drawing it there
        } else {
          rect(0, textDropDown, width, subjectStart - textDropDownStart);
          push();
          fill(0);
          textSize(50);
          text(subjectTexts[i + subjectAmount],10,textDropDown, width-20,subjectStart - textDropDownStart);
          pop();
          pageNumber = 2;
        }

        //Draws the subject in the top
        image(subjectPictures[i + subjectAmount], 0,0,map(sizeChanger,0,sizeChangerSpeed,width/2,width), map(sizeChanger,0,sizeChangerSpeed,subjectSizeY,subjectStart));
      }
    }
}

void subjectText() {
  rect(0, textDropDown, width, subjectStart - textDropDownStart);
  for(int i = 0; i < subjectAmount; i++){
    if(chosenSubjectLeft[i] == true) {
      push();
      fill(0);
      textSize(50);
      text(subjectTexts[i],10,textDropDown, width-20,subjectStart - textDropDownStart);
      pop();
      image(subjectPictures[i], 0,0,map(sizeChanger,0,sizeChangerSpeed,width/2,width), map(sizeChanger,0,sizeChangerSpeed,subjectSizeY,subjectStart));
    } else if (chosenSubjectRight[i] == true) {
      push();
      fill(0);
      textSize(50);
      text(subjectTexts[i + subjectAmount],10,textDropDown, width-20,subjectStart - textDropDownStart);
      pop();
      image(subjectPictures[i + subjectAmount], 0,0,map(sizeChanger,0,sizeChangerSpeed,width/2,width), map(sizeChanger,0,sizeChangerSpeed,subjectSizeY,subjectStart));
    }  
  }
}

// resets a boolean array to all false
void Reset(boolean[] d) {
  for (int i = 0; i < d.length; i++) { // For each array element,
    
    d[i] = false;//set the element to false
  }
}
