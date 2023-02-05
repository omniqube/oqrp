// Compatlib mod for OQRP Engine
// 1.0

#include "main.h"
#include <string>
#define GMEXPORT extern "C" __declspec (dllexport)

GMEXPORT std::string FileTypeDictionary(std::string suffix) {

if (suffix == ".dll") {return "Dynamic Link Library";}
else if (suffix == ".dll") {return "Dynamic Link Library";}
else if (suffix == ".exe") {return "Executable File";}
else if (suffix == ".inf") {return "Setup Information";}
else if (suffix == ".bat") {return "Batch File";}
else if (suffix == ".cmd") {return "Command Prompt Script";}
else if (suffix == ".png") {return "PNG Image File";}
else if (suffix == ".jpg") {return "JPEG Image File";}
else if (suffix == ".gif") {return "Image Sequence";}
else if (suffix == ".ogg") {return "OGG Audio File";}
else if (suffix == ".mp3") {return "MP3 Audio File";}
else if (suffix == ".wav") {return "Wave Audio File";}
else if (suffix == ".mp4") {return "MP4 Video File";}
else if (suffix == ".wmv") {return "Windows Movie Video File";}
else if (suffix == ".css") {return "CSS Style Sheet";}
else if (suffix == ".dat") {return "Data File";}
else if (suffix == ".sav") {return "Save File";}
else if (suffix == ".map") {return "Map File";}
else {return "Undefined";}

}
