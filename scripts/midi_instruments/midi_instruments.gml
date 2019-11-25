// midi_instruments()
// http://en.wikipedia.org/wiki/General_MIDI#Melodic_sounds
// https://jazz-soft.net/demo/GeneralMidi.html
var a;
a = 0

/*
0 = name
1 = instruments:
   0 = Harp
   1 = Double Bass
   2 = Bass Drum
   3 = Snare Drum
   4 = Click
   5 = Guitar
   6 = Flute
   7 = Bell
   8 = Chime
   9 = Xylophone
   10 = Iron Xylophone
   11 = Cow Bell
   12 = Didgeridoo
   13 = Bit
   14 = Banjo
   15 = Pling
2 = octave difference
3 = shortened name (optional)
*/

// Piano
midi_ins[a, 0] = "Acoustic Grand Piano" midi_ins[a, 3] = "Grand Piano"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Bright Acoustic Piano" midi_ins[a, 3] = "Acoustic Piano"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1 
midi_ins[a, 0] = "Electric Grand Piano" midi_ins[a, 3] = "E. Grand Piano"
midi_ins[a, 1] = 13 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Honky - tonk Piano" midi_ins[a, 3] = "H.T. Piano"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Electric Piano 1" midi_ins[a, 3] = "E. Piano 1"
midi_ins[a, 1] = 13 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Electric Piano 2" midi_ins[a, 3] = "E. Piano 2"
midi_ins[a, 1] = 13 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Harpsichord" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 1 a += 1
midi_ins[a, 0] = "Clavinet" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
// Chromatic Percussion
midi_ins[a, 0] = "Celesta" midi_ins[a, 3] = ""
midi_ins[a, 1] = 11 midi_ins[a, 2] = -1 a += 1
midi_ins[a, 0] = "Glockenspiel" midi_ins[a, 3] = ""
midi_ins[a, 1] = 11 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Music Box" midi_ins[a, 3] = ""
midi_ins[a, 1] = 11 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Vibraphone" midi_ins[a, 3] = ""
midi_ins[a, 1] = 11 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Marimba" midi_ins[a, 3] = ""
midi_ins[a, 1] = 11 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Xylophone" midi_ins[a, 3] = ""
midi_ins[a, 1] = 9 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Tubular Bells" midi_ins[a, 3] = "T. Bells"
midi_ins[a, 1] = 7 midi_ins[a, 2] = -1 a += 1
midi_ins[a, 0] = "Dulcimer" midi_ins[a, 3] = ""
midi_ins[a, 1] = 7 midi_ins[a, 2] = 0 a += 1
// Organ
midi_ins[a, 0] = "Drawbar Organ" midi_ins[a, 3] = "D. Organ"
midi_ins[a, 1] = 1 midi_ins[a, 2] = 1 a += 1
midi_ins[a, 0] = "Percussive Organ" midi_ins[a, 3] = "P. Organ"
midi_ins[a, 1] = 1 midi_ins[a, 2] = 1 a += 1
midi_ins[a, 0] = "Rock Organ" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Church Organ" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Reed Organ" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Accordion" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Harmonica" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Tango Accordion" midi_ins[a, 3] = "T. Accordion"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
// Guitar
midi_ins[a, 0] = "Acoustic Guitar (nylon)" midi_ins[a, 3] = "A.Guitar(nylon)"
midi_ins[a, 1] = 5 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Acoustic Guitar (steel)" midi_ins[a, 3] = "A.Guitar(steel)"
midi_ins[a, 1] = 5 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Electric Guitar (jazz)" midi_ins[a, 3] = "E.Guitar(jazz)"
midi_ins[a, 1] = 5 midi_ins[a, 2] = 1 a += 1
midi_ins[a, 0] = "Electric Guitar (clean)" midi_ins[a, 3] = "E.Guitar(clean)"
midi_ins[a, 1] = 5 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Electric Guitar (muted)" midi_ins[a, 3] = "E.Guitar(mute)"
midi_ins[a, 1] = -1 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Overdriven Guitar" midi_ins[a, 3] = "OD Guitar"
midi_ins[a, 1] = 5 midi_ins[a, 2] = -1 a += 1
midi_ins[a, 0] = "Distortion Guitar" midi_ins[a, 3] = "Dist. Guitar"
midi_ins[a, 1] = 5 midi_ins[a, 2] = -1 a += 1
midi_ins[a, 0] = "Guitar Harmonics" midi_ins[a, 3] = "Guitar H."
midi_ins[a, 1] = 5 midi_ins[a, 2] = 0 a += 1
// Bass
midi_ins[a, 0] = "Acoustic Bass" midi_ins[a, 3] = "A. Bass"
midi_ins[a, 1] = 1 midi_ins[a, 2] = 1 a += 1
midi_ins[a, 0] = "Electric Bass (finger)" midi_ins[a, 3] = "E.Bass (finger)"
midi_ins[a, 1] = 1 midi_ins[a, 2] = 2 a += 1
midi_ins[a, 0] = "Electric Bass (pick)" midi_ins[a, 3] = "E.Bass (pick)"
midi_ins[a, 1] = 1 midi_ins[a, 2] = 2 a += 1
midi_ins[a, 0] = "Fretless Bass" midi_ins[a, 3] = ""
midi_ins[a, 1] = 1 midi_ins[a, 2] = 2 a += 1
midi_ins[a, 0] = "Slap Bass 1" midi_ins[a, 3] = ""
midi_ins[a, 1] = 1 midi_ins[a, 2] = 2 a += 1
midi_ins[a, 0] = "Slap Bass 2" midi_ins[a, 3] = ""
midi_ins[a, 1] = 1 midi_ins[a, 2] = 2 a += 1
midi_ins[a, 0] = "Synth Bass 1" midi_ins[a, 3] = ""
midi_ins[a, 1] = 1 midi_ins[a, 2] = 2 a += 1
midi_ins[a, 0] = "Synth Bass 2" midi_ins[a, 3] = ""
midi_ins[a, 1] = 1 midi_ins[a, 2] = 2 a += 1
// Strings
midi_ins[a, 0] = "Violin" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Viola" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Cello" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Contrabass" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Tremolo Strings" midi_ins[a, 3] = "T. Strings"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Pizzicato Strings" midi_ins[a, 3] = "P. Strings"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Orchestral Harp" midi_ins[a, 3] = "O. Harp"
midi_ins[a, 1] = 8 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Timpani" midi_ins[a, 3] = ""
midi_ins[a, 1] = 3 midi_ins[a, 2] = 1 a += 1
// Ensemble
midi_ins[a, 0] = "String Ensemble 1" midi_ins[a, 3] = "String E. 1"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "String Ensemble 2" midi_ins[a, 3] = "String E. 2"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Synth Strings 1" midi_ins[a, 3] = "S. Strings 1"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Synth Strings 2" midi_ins[a, 3] = "S. Strings 2"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Choir Aahs" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Voice Oohs" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Synth Choir" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Orchestra hit" midi_ins[a, 3] = "O. Hit"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
// Brass
midi_ins[a, 0] = "Trumpet" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Trombone" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Tuba" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Muted Trumpet" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "French Horn" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Brass Section" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Synth Brass 1" midi_ins[a, 3] = "S. Brass 1"
midi_ins[a, 1] = 1 midi_ins[a, 2] = 1 a += 1
midi_ins[a, 0] = "Synth Brass 2" midi_ins[a, 3] = "S. Brass 2"
midi_ins[a, 1] = 1 midi_ins[a, 2] = 1 a += 1
// Reed
midi_ins[a, 0] = "Soprano Sax" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Alto Sax" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Tenor Sax" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Baritone Sax" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Oboe" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "English Horn" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Bassoon" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = -1 a += 1
midi_ins[a, 0] = "Clarinet" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = 0 a += 1
// Pipe
midi_ins[a, 0] = "Piccolo" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = -1 a += 1
midi_ins[a, 0] = "Flute" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = -1 a += 1
midi_ins[a, 0] = "Recorder" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = -1 a += 1
midi_ins[a, 0] = "Pan Flute" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = -1 a += 1
midi_ins[a, 0] = "Blown Bottle" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = -1 a += 1
midi_ins[a, 0] = "Shakuhachi" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = -1 a += 1
midi_ins[a, 0] = "Whistle" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = -1 a += 1
midi_ins[a, 0] = "Ocarina" midi_ins[a, 3] = ""
midi_ins[a, 1] = 6 midi_ins[a, 2] = -1 a += 1
// Synth Lead
midi_ins[a, 0] = "Lead 1 (square)" midi_ins[a, 3] = "L.1 (square)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Lead 2 (sawtooth)" midi_ins[a, 3] = "L.2 (sawtooth)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Lead 3 (calliope)" midi_ins[a, 3] = "L.3 (calliope)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Lead 4 (chiff)" midi_ins[a, 3] = "L.4 (chiff)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Lead 5 (charang)" midi_ins[a, 3] = "L.5 (charang)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Lead 6 (voice)" midi_ins[a, 3] = "L.6 (voice)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Lead 7 (fifths)" midi_ins[a, 3] = "L.7 (fifths)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Lead 8 (bass + lead)" midi_ins[a, 3] = "L.8 (bass + lead)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 1 a += 1
midi_ins[a, 0] = "Pad 1 (new age)" midi_ins[a, 3] = "P.1 (new age)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Pad 2 (warm)" midi_ins[a, 3] = "P.2 (warm)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Pad 3 (polysynth)" midi_ins[a, 3] = "P.3 (polysynth)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Pad 4 (choir)" midi_ins[a, 3] = "P.4 (choir)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Pad 5 (bowed)" midi_ins[a, 3] = "P.5 (bowed)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Pad 6 (metallic)" midi_ins[a, 3] = "P.6 (metallic)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Pad 7 (halo)" midi_ins[a, 3] = "P.7 (halo)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Pad 8 (sweep)" midi_ins[a, 3] = "P.8 (sweep)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
// Synth Effects
midi_ins[a, 0] = "FX 1 (rain)" midi_ins[a, 3] = "Fx (rain)"
midi_ins[a, 1] = -1 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "FX 2 (soundtrack)" midi_ins[a, 3] = "Fx (strack)"
midi_ins[a, 1] = -1 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "FX 3 (crystal)" midi_ins[a, 3] = "Fx (crystal)"
midi_ins[a, 1] = 13 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "FX 4 (atmosphere)" midi_ins[a, 3] = "Fx (atmosph.)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "FX 5 (brightness)" midi_ins[a, 3] = "Fx (bright.)"
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "FX 6 (goblins)" midi_ins[a, 3] = "Fx (goblins)"
midi_ins[a, 1] = -1 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "FX 7 (echoes)" midi_ins[a, 3] = "Fx (echoes)"
midi_ins[a, 1] = -1 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "FX 8 (sci - fi)" midi_ins[a, 3] = "Fx (sci - fi)"
midi_ins[a, 1] = -1 midi_ins[a, 2] = 0 a += 1
// Ethnic
midi_ins[a, 0] = "Sitar" midi_ins[a, 3] = ""
midi_ins[a, 1] = 14 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Banjo" midi_ins[a, 3] = ""
midi_ins[a, 1] = 14 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Shamisen" midi_ins[a, 3] = ""
midi_ins[a, 1] = 14 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Koto" midi_ins[a, 3] = ""
midi_ins[a, 1] = 14 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Kalimba" midi_ins[a, 3] = ""
midi_ins[a, 1] = 1 midi_ins[a, 2] = 1 a += 1
midi_ins[a, 0] = "Bagpipe" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Fiddle" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Shanai" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
// Percussive
midi_ins[a, 0] = "Tinkle Bell" midi_ins[a, 3] = ""
midi_ins[a, 1] = 7 midi_ins[a, 2] = -1 a += 1
midi_ins[a, 0] = "Agogo" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Steel Drums" midi_ins[a, 3] = ""
midi_ins[a, 1] = 10 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Woodblock" midi_ins[a, 3] = ""
midi_ins[a, 1] = 4 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Taiko Drum" midi_ins[a, 3] = ""
midi_ins[a, 1] = 3 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Melodic Tom" midi_ins[a, 3] = ""
midi_ins[a, 1] = 3 midi_ins[a, 2] = -1 a += 1
midi_ins[a, 0] = "Synth Drum" midi_ins[a, 3] = ""
midi_ins[a, 1] = 3 midi_ins[a, 2] = 0 a += 1
// Sound Effects
midi_ins[a, 0] = "Reverse Cymbal" midi_ins[a, 3] = "Rev. Cymbal"
midi_ins[a, 1] = -1 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Guitar Fret Noise" midi_ins[a, 3] = "Guitar F. Noise"
midi_ins[a, 1] = -1 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Breath Noise" midi_ins[a, 3] = ""
midi_ins[a, 1] = -1 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Seashore" midi_ins[a, 3] = ""
midi_ins[a, 1] = -1 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Bird Tweet" midi_ins[a, 3] = ""
midi_ins[a, 1] = -1 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Telephone Ring" midi_ins[a, 3] = "Telephone"
midi_ins[a, 1] = -1 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Helicopter" midi_ins[a, 3] = ""
midi_ins[a, 1] = -1 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Applause" midi_ins[a, 3] = ""
midi_ins[a, 1] = -1 midi_ins[a, 2] = 0 a += 1
midi_ins[a, 0] = "Gunshot" midi_ins[a, 3] = ""
midi_ins[a, 1] = 0 midi_ins[a, 2] = 0 a += 1
// Percussion

// 0 = name
// 1 = instrument
// 2 = instrument pitch

a = 24
midi_drum[a, 0] = "Zap"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
midi_drum[a, 0] = "Brush hit hard"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
midi_drum[a, 0] = "Brush circle"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
midi_drum[a, 0] = "Brush hit soft"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
midi_drum[a, 0] = "Brush hit and circle"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
midi_drum[a, 0] = "Drumroll"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
midi_drum[a, 0] = "Castanets"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
midi_drum[a, 0] = "Snare Drum 3"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
midi_drum[a, 0] = "Drumsticks hitting"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
midi_drum[a, 0] = "Bass Drum 3"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
midi_drum[a, 0] = "Hard hit snare"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
// 35
midi_drum[a, 0] = "Bass Drum 2"
midi_drum[a, 1] = 2 midi_drum[a, 2] = 10 a += 1
midi_drum[a, 0] = "Bass Drum 1"
midi_drum[a, 1] = 2 midi_drum[a, 2] = 6 a += 1
midi_drum[a, 0] = "Side Stick"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 6 a += 1
midi_drum[a, 0] = "Snare Drum 1"
midi_drum[a, 1] = 3 midi_drum[a, 2] = 8 a += 1
midi_drum[a, 0] = "Hand Clap"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 6 a += 1
midi_drum[a, 0] = "Snare Drum 2"
midi_drum[a, 1] = 3 midi_drum[a, 2] = 4 a += 1
midi_drum[a, 0] = "Low Tom 2"
midi_drum[a, 1] = 2 midi_drum[a, 2] = 6 a += 1
// 42
midi_drum[a, 0] = "Closed Hi - hat"
midi_drum[a, 1] = 3 midi_drum[a, 2] = 22 a += 1
midi_drum[a, 0] = "Low Tom 1"
midi_drum[a, 1] = 2 midi_drum[a, 2] = 13 a += 1
midi_drum[a, 0] = "Pedal Hi - hat"
midi_drum[a, 1] = 3 midi_drum[a, 2] = 22 a += 1
midi_drum[a, 0] = "Mid Tom 2"
midi_drum[a, 1] = 2 midi_drum[a, 2] = 15 a += 1
midi_drum[a, 0] = "Open Hi - hat"
midi_drum[a, 1] = 3 midi_drum[a, 2] = 18 a += 1
midi_drum[a, 0] = "Mid Tom 1"
midi_drum[a, 1] = 2 midi_drum[a, 2] = 20 a += 1
midi_drum[a, 0] = "High Tom 2"
midi_drum[a, 1] = 2 midi_drum[a, 2] = 23 a += 1
// 49
midi_drum[a, 0] = "Crash Cymbal 1"
midi_drum[a, 1] = 3 midi_drum[a, 2] = 17 a += 1
midi_drum[a, 0] = "High Tom 1"
midi_drum[a, 1] = 2 midi_drum[a, 2] = 23 a += 1
midi_drum[a, 0] = "Ride Cymbal 1"
midi_drum[a, 1] = 3 midi_drum[a, 2] = 24 a += 1
midi_drum[a, 0] = "Chinese Cymbal"
midi_drum[a, 1] = 3 midi_drum[a, 2] = 8 a += 1
midi_drum[a, 0] = "Ride Bell"
midi_drum[a, 1] = 3 midi_drum[a, 2] = 13 a += 1
midi_drum[a, 0] = "Tambourine"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 18 a += 1
midi_drum[a, 0] = "Splash Cymbal"
midi_drum[a, 1] = 3 midi_drum[a, 2] = 18 a += 1
// 56
midi_drum[a, 0] = "Cowbell"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 1 a += 1
midi_drum[a, 0] = "Crash Cymbal 2"
midi_drum[a, 1] = 3 midi_drum[a, 2] = 13 a += 1
midi_drum[a, 0] = "Vibra Slap"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 2 a += 1
midi_drum[a, 0] = "Ride Cymbal 2"
midi_drum[a, 1] = 3 midi_drum[a, 2] = 13 a += 1
midi_drum[a, 0] = "High Bongo"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 9 a += 1
midi_drum[a, 0] = "Low Bongo"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 2 a += 1
midi_drum[a, 0] = "Mute High Conga"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 8 a += 1
// 63
midi_drum[a, 0] = "Open High Conga"
midi_drum[a, 1] = 2 midi_drum[a, 2] = 22 a += 1
midi_drum[a, 0] = "Low Conga"
midi_drum[a, 1] = 2 midi_drum[a, 2] = 15 a += 1
midi_drum[a, 0] = "High Timbale"
midi_drum[a, 1] = 3 midi_drum[a, 2] = 13 a += 1
midi_drum[a, 0] = "Low Timbale"
midi_drum[a, 1] = 3 midi_drum[a, 2] = 8 a += 1
midi_drum[a, 0] = "High Agog�"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 8 a += 1
midi_drum[a, 0] = "Low Agog�"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 3 a += 1
midi_drum[a, 0] = "Cabasa"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 20 a += 1
// 70
midi_drum[a, 0] = "Maracas"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 23 a += 1
midi_drum[a, 0] = "Short Whistle"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
midi_drum[a, 0] = "Long Whistle"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
midi_drum[a, 0] = "Short G�iro"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 17 a += 1
midi_drum[a, 0] = "Long G�iro"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 11 a += 1
midi_drum[a, 0] = "Claves"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 18 a += 1
midi_drum[a, 0] = "High Wood Block"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 9 a += 1
// 77
midi_drum[a, 0] = "Low Wood Block"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 5 a += 1
midi_drum[a, 0] = "Mute Cu�ca"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
midi_drum[a, 0] = "Open Cu�ca"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
midi_drum[a, 0] = "Mute Triangle"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 17 a += 1
midi_drum[a, 0] = "Open Triangle"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 22 a += 1
midi_drum[a, 0] = "Shaker"
midi_drum[a, 1] = 3 midi_drum[a, 2] = 22 a += 1
midi_drum[a, 0] = "Jingle bell"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
// 84
midi_drum[a, 0] = "Bell tree"
midi_drum[a, 1] = -1 midi_drum[a, 2] = 0 a += 1
midi_drum[a, 0] = "Castanets"
midi_drum[a, 1] = 4 midi_drum[a, 2] = 21 a += 1
midi_drum[a, 0] = "Mute Surdo"
midi_drum[a, 1] = 2 midi_drum[a, 2] = 14 a += 1
midi_drum[a, 0] = "Open Surdo"
midi_drum[a, 1] = 2 midi_drum[a, 2] = 7 a += 1
