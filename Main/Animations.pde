/*
This is the arrow animation
*/
void arrowAnimation(int position) {

    if (frame < arrowArray.length * 2) {
        image(arrowArray[frame/2], (width / 2)-navButtonRadius/2, navButtonRadius + position, navButtonRadius, navButtonRadius * 1.7);
        frame ++;
    } else if (frame < arrowArray.length * 3){
        frame ++;
    } else {
        frame = 0;
    }
}