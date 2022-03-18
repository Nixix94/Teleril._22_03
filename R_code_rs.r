#Questo è il primo script che useremo a lezione 
#install.packages ("rester")
library (raster)
 
#quando usiamo dati raster è importante impostare il workplace ogni volta, perchè R li carica in una cartella temporanea
#settaggio cartella di lavoro

setwd("C:/lab/") #windows
#dati da satellite landsat: immagini satelliteri ricavati tramite scanner, percorso del satelleti chiamato "path" (sinusoidi)
#inoltre, sono presenti righe (raw) e la coordinata che viene fuori mi da la posizione sul pianeta

#per ogni dato presente nella cartella lab ho varie estensioni
#.grd .gri .xml .hdr .stx

#aprire questi file
#ricordo: file raster sono composti da immagini che sono composte da singole bande, ovvero immagini con specifiche lunghezze d'onda
#lunghezze d'onda che rifanno alla riflettanza, ovvero la luce che non viene assorbita e riflessa 

#aprire questi file: brick <- creo un RasterBrick, oggetto che mi contiene vari raster
#brick("p224r63_2011.grd") funzione per caricare un blocco di dati, come immagini satellitari

landsat_2011 <- brick ("p224r63_2011.grd")

landsat_2011

#nlayers = numero di bande, ncell = dati per banda
#min. /max. values = valori di riflettanza, sre = ?controllo?

plot(landsat_2011)
#cambio la legenda di colori attraverso funzione colorRampPalette

cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(landsat_2011, col=cl)

#così ho potuto dare ad ogni singola banda il colore che ho scelto io 
