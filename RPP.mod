### INSIEMI 
set RETTANGOLI;

### PARAMETRI 
param W;
param h{i in RETTANGOLI} >= 0;
param w{i in RETTANGOLI} >= 0;
param UB=sum{i in RETTANGOLI}max(h[i],w[i]);

### VARIABILI 
var y{i in RETTANGOLI} >=0;										
var x{i in RETTANGOLI} >=0;	
var l{i in RETTANGOLI,j in RETTANGOLI:i!=j} binary;	
var b{i in RETTANGOLI,j in RETTANGOLI:i!=j} binary;	
var rot{i in RETTANGOLI} binary;									
var H>=0;				


### VINCOLI  
s.t. uno {i in RETTANGOLI}: H>=y[i]+h[i]*(1-rot[i])+w[i]*rot[i];

s.t. due {i in RETTANGOLI}: UB>=y[i]+h[i]*(1-rot[i])+w[i]*rot[i];

s.t. tre {i in RETTANGOLI}: W>=x[i]+w[i]*(1-rot[i])+h[i]*rot[i];

s.t. qua {i in RETTANGOLI,j in RETTANGOLI:i!=j}: UB*(1-b[i,j])+y[j]>=y[i]+h[i]*(1-rot[i])+w[i]*rot[i];

s.t. cin {i in RETTANGOLI,j in RETTANGOLI:i!=j}: W*(1-l[i,j])+x[j]>=x[i]+w[i]*(1-rot[i])+h[i]*rot[i];

s.t. sei {i in RETTANGOLI,j in RETTANGOLI:i<j}: l[i,j]+l[j,i]+b[i,j]+b[j,i]>=1;

minimize altezza_fin: H;



