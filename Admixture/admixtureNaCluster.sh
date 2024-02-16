###Este script corre un admixture para datos de Zea diploperennis

##Hacer directorio para salvar el output
mkdir -p /LUSTRE/Genetica/jcarlos/out/AdmixtureCluster

##Correr el admixture para K 1-5
for K in 1 2 3 4 5 6 7 ; \
do ./admixture --cv -B100000 /LUSTRE/Genetica/jcarlos/data/dataAdmixture/diploperennis_dataNa.bed $K -j15 | tee /LUSTRE/Genetica/jcarlos/out/AdmixtureCluster/log${K}.out;done

##Mover el output de Q y P al directorio de output
mv {*.P,*.Q} /LUSTRE/Genetica/jcarlos/out/AdmixtureCluster

##Guardar los resultados de probailidad para cada K a un solo archivo

grep -h CV /LUSTRE/Genetica/jcarlos/out/AdmixtureCluster/log*.out > /LUSTRE/Genetica/jcarlos/out/AdmixtureCluster/zdiploperennisNa_Kerror.txt
