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
#min. /max. values = valori di riflettanza, sre = ?controllo? lez10/3

plot(landsat_2011)
#cambio la legenda di colori attraverso funzione colorRampPalette

cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
#100 sta ad indicare la quantità di variazioni di colore (tonalità)
plot(landsat_2011, col=cl)

#così ho potuto dare ad ogni singola banda il colore che ho scelto io 
#lez 18/3
 
#min values = 0 mi dice che la luce è completamente assorbita
#??controllo lez 16:30 lez 18/3
#Banda1=Blu, Banda2=Verde, Banda3=Rosso, Banda4=Infrarosso vicino (NIR near infrared)

#plotiamo una singola banda
#conoscere il nome della banda = interrogo l'oggetto
landsat_2011

#Banda1 si chiama B1_sre
plot(landsat_2011$B1_sre)
#lego argomenti con $
#B1_sre è anche il primo elemento, questi nella formunla si racchiudono in doppia [[]]
plot(landsat_2011[[1]])
#è uguale usare uno dei due metodi
 
#ora si colora, vedi cl
plot(landsat_2011$B1_sre, col=cl)
cl_b <- colorRampPalette(c("darkblue", "blue", "lightblue")) (100)
plot(landsat_2011$B1_sre, col=cl_b)
 
#esportare immagini con funzione: pdf
#diamo nome ed esportiamo in cartella "lab"
pdf("banda1.pdf")
plot(landsat_2011$B1_sre, col=cl_b)
dev.off()
 
#all'inizio del codice abbiamo impostato la working directory
#altrimenti si può cambiare la path all'interno della funzione pdf
#esportare con funzione: png
png("banda1.png")
plot(landsat_2011$B1_sre, col=cl_b)
dev.off()

#per esportare il dataset raster, funzione: writeRaster, quindi formato geotiff/tiff
#raster con bamda scelta oppure pacchetto
 
#fare plot di più immagini satellitari selezionandole
#esempio blue e verde
 
cl_g <- colorRampPalette(c("darkgreen", "green", "chartreuse")) (100)
plot(landsat_2011$B2_sre, col=cl_g)
 
#metto insieme blu e verde
#multiframe (mf) per mettere i plot uno affianco all'altro con funzione: par
par(mfrow=c(1, 2))
plot(landsat_2011$B1_sre, col=cl_b)
plot(landsat_2011$B2_sre, col=cl_g)
dev.off()
 
#esportazione multiframe in pdf
pdf("multiframe.pdf")
par(mfrow=c(1, 2))
plot(landsat_2011$B1_sre, col=cl_b)
plot(landsat_2011$B2_sre, col=cl_g)
dev.off()
 
#attenzione! devo impostare le dimensione e la risoluzione, vado a guardare online

#multiframe con le immagini una sopra l'altra, invertendo i valori di row
par(mfrow=c(2, 1))
plot(landsat_2011$B1_sre, col=cl_b)
plot(landsat_2011$B2_sre, col=cl_g)
