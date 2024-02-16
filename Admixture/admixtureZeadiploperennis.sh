###Este script corre un admixture para datos de Zea diploperennis

##Hacer directorio para salvar el output
mkdir -p /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/admixtureZeadiploperennis 

##Correr el admixture para K 1-5
for K in 1 2 3 4 5 6 7 8 9 10 11 ; \
do ./admixture --cv /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/diploperennis_data_filtered.bed $K | tee /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/admixtureZeadiploperennis/log${K}.out;done

##Mover el output de Q y P al directorio de output
mv {*.P,*.Q} /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/admixtureZeadiploperennis

##Guardar los resultados de probailidad para cada K a un solo archivo

grep -h CV /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/admixtureZeadiploperennis/log*.out > /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/admixtureZeadiploperennis/zdiploperennis_Kerror.txt
