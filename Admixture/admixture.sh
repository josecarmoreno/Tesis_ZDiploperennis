###Este script corre un admixture para datos de Zea diploperennis

##Hacer directorio para salvar el output
mkdir -p /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/out/admixture 

##Correr el admixture para K 1-5
for K in 1 2 3 4 5; \
do ./admixture --cv /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/data/datosZdiploperennis/bytaxa_diploperennis.bed $K | tee /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/out/admixture/log${K}.out;done

##Mover el output de Q y P al directorio de output
mv {*.P,*.Q} /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/out/admixture/

##Guardar los resultados de probailidad para cada K a un solo archivo

grep -h CV /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/out/admixture/log*.out > /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/out/admixture/zdiploperennis_Kerror.txt

