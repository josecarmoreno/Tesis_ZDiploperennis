## Hacer directorio para salvar el output
mkdir -p /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture

## Correr el admixture para K 1-5
for K in 1 2 3 4 5; do
    ./admixture --cv /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/diploperennis_data_filtered.bed $K | tee /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/log${K}.out
done

## Mover el output de Q y P al directorio de output
mv *.P *.Q /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture

## Guardar los resultados de probabilidad para cada K a un solo archivo
grep -h CV /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/log*.out > /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/zdiploperennis_Kerror.txt

