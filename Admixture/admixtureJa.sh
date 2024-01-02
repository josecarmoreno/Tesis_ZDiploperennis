###Este script corre un admixture para datos de Zea diploperennis

##Hacer directorio para salvar el output
mkdir -p /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/admixtureJa 

##Correr el admixture para K 1-5
for K in 1 2 3 4 5 6 7 8 9 10 ; \
do ./admixture --cv -B100000 /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataJa.bed $K | tee /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/admixtureJa/log${K}.out;done

##Mover el output de Q y P al directorio de output
mv {*.P,*.Q} /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/admixtureJa

##Guardar los resultados de probailidad para cada K a un solo archivo

grep -h CV /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/admixtureJa/log*.out > /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/admixtureJa/zdiploperennisJa_Kerror.txt
