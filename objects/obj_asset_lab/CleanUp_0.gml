/// Release owned runtime systems and sound voices on destruction and room restart.
av_cleanup();
if (web_camera_owned!=-1) camera_destroy(web_camera_owned);
