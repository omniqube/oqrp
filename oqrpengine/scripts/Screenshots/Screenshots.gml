function CaptureScreenshot() {

	var i,fname;
    i = 0;
    do {
        fname = global.oqrp.dir.screenshot+"\\"+"screenshot"+"_"+string(i)+".png";
        i += 1;
    } until (!file_exists(fname))
    screen_save(fname);
    return file_exists(fname);
	
}