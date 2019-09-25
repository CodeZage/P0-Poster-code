void arrowAnimation() {
    if (drawArrow && frame < arrowArray.length * 2) {
        image(arrowArray[frame/2], (width / 2)-navButtonRadius/2, navButtonRadius, navButtonRadius, navButtonRadius * 1.7);
        frame ++;
    } else if (drawArrow && frame < arrowArray.length * 3){
        frame ++;
    } else {
        frame = 0;
    }
}