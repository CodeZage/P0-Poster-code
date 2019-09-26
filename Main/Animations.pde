/*
This is the arrow animation
*/
void arrowAnimation(int position) {

    if (frame < arrowArray.length * 2) {
        image(arrowArray[frame/2], (width / 2)-navButtonRadius/2, navButtonRadius + position, navButtonRadius, navButtonRadius * arrowRatio);
        frame ++;
    } else if (frame < arrowArray.length * arrowPause){
        frame ++;
    } else {
        frame = 0;
    }
}