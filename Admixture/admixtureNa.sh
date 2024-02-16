###Este script corre un admixture para datos de Zea diploperennis

##Hacer directorio para salvar el output
mkdir -p /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/admixtureNa2 

##Correr el admixture para K 1-5
for K in 1 2 3 4 5 6 7 ; \
do ./admixture --cv -B100000 ~/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataNa.bed $K -j8 | tee /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/admixtureNa2/log${K}.out;done

##Mover el output de Q y P al directorio de output
mv {*.P,*.Q} /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/admixtureNa2

##Guardar los resultados de probailidad para cada K a un solo archivo

grep -h CV /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/admixtureNa2/log*.out > /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/admixtureNa2/zdiploperennisNa_Kerror.txt
