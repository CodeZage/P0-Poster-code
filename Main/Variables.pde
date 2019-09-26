/*
This pages is for all the variables in the code
*/
//pageChanger
int pageNumber = 0;
int idleTimer = 0;
int resetTime = 18000;

//Indicators
PImage handPoint;
PImage handGrab;
PImage arrowNext;
PImage arrowPrevious;
int nextPreviousWidth = 50;
color nextPreviousColor = color(0);//color(172, 10, 86);
PImage hold;

//Arrow
boolean drawArrow = false;
int frame = 0;
PImage[] arrowArray;
int arrowAnimationLength = 36;
float arrowRatio = 1.7;
int arrowPause = 3;

//subjects
    boolean subjectChosen = false;
    boolean[] chosenSubjectLeft;
    boolean[] chosenSubjectRight;
    PImage[] subjectPictures;
    int subjectAmount = 3;
    boolean resizeSubject = false;
    
    //subject Size and position
        int sizeChanger = 0;
        int subjectStart = 300;
        int subjectSizeY = 150;
        int sizeChangerSpeed = 15;

//TextBox and Text
int fontSize = 24;
PImage[] textImages;
int textDropDown = 0;
int textDropDownStart = -150;
int dropDownSpeed = 10;

//style
color highlight = (#ac0a56);
color loadingColor = 255;
color background = (#efebe2);
int highlightWeight = 5;
int widthStart = 0;
PImage frontPage;
PImage medialogiLogo;

// loading button / arc
float radiant = 0;
int time;
int loadingButtonWidth = 55;
int loadingButtonHeight = 55;
int loadingStroke = 5;
int holdDownTime = 20;

//Navigation button 
int navButtonY = 75;
int navButtonRadius = 75;

//Checks for the navButton 
boolean navButtonClicked = false; 
boolean navThreshold = true;
