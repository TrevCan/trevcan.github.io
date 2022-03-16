Debugging FRC Pneumatics 

Shame on me. Shame on my team. I lead the software team @ tecbot. Includes
programming.

Pneumatics did not work. The compressor would not turn on.

We did not have any good solenoids to test it on.

Guess the culprit. Me, myself, and I.

I never created a solenoid object. If I don't use pneumatics, the 
thread to keep the compressor at the necessary pressure will never start.

AAAHHHHhhhh! shame on me ! shame on wpilib ! how dare you guys code 
that in ?

;tags: tecbot debugging

