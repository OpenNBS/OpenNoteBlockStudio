var temp = 0
if (tempo >= 20) temp = 1
if (tempo < 20) temp = 1
if (tempo < 15) temp = 2
if (tempo < 10) temp = 2
if(tempo < 8.33) temp = 3
if(tempo < 5.83) temp = 4
if(tempo < 4.5) temp = 5
if(tempo < 3.66) temp = 6
if(tempo < 3.1) temp = 7
if(tempo < 2.68) temp = 8
return temp