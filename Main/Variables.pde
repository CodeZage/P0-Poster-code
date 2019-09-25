/*
This pages is for all the variables in the code
*/
//pageChanger
int pageNumber = 0;

//subjects
    boolean subjectChosen = false;
    char subject;
    boolean[] chosenSubjectLeft;
    boolean[] chosenSubjectRight;
    PImage[] subjectPictures;
    int subjectAmount = 3;
    
    //subject Size and position
        int sizeChanger = 0;
        int subjectStart = 300;
        int subjectSizeY = 150;
        int sizeChangerSpeed = 15;

//TextBox and Text
String[] subjectTexts;
int textDropDown = 0;
int textDropDownStart = -150;
int dropDownSpeed = 10;

//style
color highlight = (#ac0a56);
color loadingColor = 255;
color background = (#efebe2);

// loading button / arc
float radiant = 0;
int time;
int loadingButtonWidth = 55;
int loadingButtonHeight = 55;
int loadingStroke = 5;
int holdDownTime = 30;

//Style 
int highlightWeight = 5;
int widthStart = 0;

//Navigation button 
int navButtonY = 50;
int navButtonRadius = 75;

//Checks 
boolean navButtonClicked = false; 
boolean navThreshold = true;
