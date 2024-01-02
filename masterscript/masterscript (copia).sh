#
##Primero realicé un filtrado por sitios en TASSEL usando un mínimo de 3,400 sitios y una minor allele frequency de 0.05
###Luego en TASSEL, hice un filtrado por Taxa (0.3)
###A continuación, exporté el resultado en formato .vcf


##Filtre las variantes multialélicas (es decir, solo conservamos las bialélicas) y transformamos el archivo a formato plink 1 binario
plink2 --vcf T4356_57279.vcf --max-alleles 2 --make-bed --out T4356bi


##Filtre a los individuos con más de 25% de datos perdidos
plink2 --bfile T4356bi --mind .25 --make-bed --out T4174filtered


##Convertí el plink 1 binario a texto plink 
###Primero copie los archivos input al mismo directorio que PLINK
cp T4174filtered* /home/genconser/Descargas/PLINK

###Cambio de formato  (Plink 1.9)
cd /home/genconser/Descargas/PLINK
./plink --bfile T4174filtered --recode --out T4174filtered

###Extraje los metadatos de las muestras de Z. diploperennis
cd /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/meta
##Pero primero hice una corrección de formato al archivo ADN_pasap_3604.txt
iconv -f latin1 -t utf8 ADN_pasap_3604.txt | tr '\r' '\n' > ADN_pasap_3604cc.txt
grep diploperennis ADN_pasap_3604cc.txt > ADN_pasap_diploperennis.txt
Rscript meta_diploperennis.R
cat /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/T4174filtered.fam | awk '{print $1"\t"$2}' > keep_all.txt ##En este punto esto pareando mi base de de datos con la base de datos donde se eliminaron individuos con datos perdidos, por lo que mis individuos pasaron de 136 a 134
grep grep -Fwf id_diploperennis.txt keep_all.txt > keep_diploperennis.txt

###Extracción de datos genómicos de las muestras de Z. diploperennis
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/T4174filtered --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/meta/keep_diploperennis.txt --make-bed --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/diploperennis_data

###Filtros de variantes con datos perdidos y maf
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/diploperennis_data --maf 0.05 --geno 0.10 --mind 0.25 --recode --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/diploperennis_data_filtered
##Igual cree unos datos sin filtro de maf, para incluir en GONE
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/diploperennis_data --geno 0.10 --mind 0.25 --recode --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/diploperennis_data_filteredNomaf


















