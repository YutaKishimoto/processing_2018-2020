// REAL TIME RENDERING

//  Minim Setting
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.spi.*;
Minim minim;
AudioPlayer player;


// loading File. (.wav does not work....why....? i try only .mp3)
String _audioFile = "Kin-Niku_03.mp3";
//String _audioFile = "KG_TokyoRV_piano_short_01.mp3";
//String _audioFile = "kinggnu_prayerX_pianosolo.mp3";
//String _audioFile = "tmge_malion_stringQ_ver2.mp3";
//String _audioFile = "Drum_Groove_01.mp3";
//String _audioFile = "ksmt_moondrop_20170804.mp3";

// WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

boolean T = true; // FIXED
boolean F = false; // FIXED

// ----- your order ------------- //

boolean render = F; // VERY HEAVY

int _fRate = 25; // Fix 25 or 50
int spf = width;
// how many samples uses for calculate average : Divisor of _spf(882 or 960) is good. 1(ampL), 2,3,4,5,6,8,10.....
float _avgAmp = 5; 
int _bufferSize = 2048; // buffer need to be pow(2,n) in Minim.

// WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
// rendering image filename.
String _fileName = "Export/" + _audioFile + "/" + _audioFile + "_#####.jpg";
color _black;
color _white;

// video frameRate. i think 50 is best for sound and video.
// 20 ms per 1frame.  and 44.1 kHz = 44.1 sample per 1 ms.
// then, 882 samples per 1 frame
// (960 samples per 1 frame when sampleRate is 48kHz) 
// i think 1920*1080, 50fps is best for 2019. maybe....

// WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
// Global Setting : NOT Input value
// WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
//   image and video settings
// WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

// frame settings
int _totalFrames; // (musiclength /1000 / 50) + 1  ( ... " + 1 " is the last frame for remain sample under 20 samples)
int _max_spf; // samples per frames = 1000(ms) * sampleRate(samples per 1000 ms) / frameRate(frames per 1000 ms)

// audio meta data
float _sRate; //sample rate fixed by audioFile
float _length;  // Musicfile length(ms) fixed by audioFile
int _halfBuffer = _bufferSize / 2;