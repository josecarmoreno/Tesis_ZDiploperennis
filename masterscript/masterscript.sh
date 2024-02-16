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
##
Rscript meta_diploperennis.R
cat /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/T4174filtered.fam | awk '{print $1"\t"$2}' > keep_all.txt ##En este punto esto pareando mi base de de datos con la base de datos donde se eliminaron individuos con datos perdidos, por lo que mis individuos pasaron de 136 a 134
grep -Fwf id_diploperennis.txt keep_all.txt > keep_diploperennis.txt

###Extracción de datos genómicos de las muestras de Z. diploperennis
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/T4174filtered --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/meta/keep_diploperennis.txt --make-bed --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/diploperennis_data



###Filtros de variantes con datos perdidos y maf
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/diploperennis_data --maf 0.05 --geno 0.10 --mind 0.25 --recode --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/diploperennis_data_filtered
##Igual cree unos datos sin filtro de maf, para incluir en GONE
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/diploperennis_data --geno 0.10 --mind 0.25 --recode --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/diploperennis_data_filteredNomaf

Rscript metadatos_filtrados.R
grep Nayarit metadatos_Zdiploperennis.txt > meta_Nayarit.txt
cat /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/meta_Nayarit.txt | awk '{print $1}' > keep_Nayarit.txt
grep -Fwf keep_Nayarit.txt keep_diploperennis.txt > keep_NayaritP.txt

####Extraer los datos genómicos de las muestras de Nayarit
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/diploperennis_data_filtered --make-bed --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/keep_NayaritP.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/diploperennis_dataNa
###VCF
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/diploperennis_dataNa --recode vcf-iid --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/diploperennis_dataNa


####Extraer los datos genómicos de las muestras de Jalisco
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/diploperennis_data_filtered --make-bed --recode --remove /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/keep_NayaritP.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/diploperennis_dataJa
###VCF
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/diploperennis_dataJa --recode vcf-iid --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/diploperennis_dataJa

####Análisis exploratorios de estructuración genética
###PCA de todo Zea diploperennis
Rscript PCAnewdata.R

####Hice un PCA que gráfica el primer y segundo eigenvector para cada grupo (Nayarit y Jalisco)
Rscript PCAJa.R
Rscript PCANa.R
##Ahora la graficación para los eigenvectores 1:4
Rscript PCA1_4newdata.R

####Realicé un DAPC para cada población según según las localidades (usé 30 componentes principales para el DAPC)
#Jalisco
DAPCJa.R
#Nayarit
DAPCNa.R

####Corrí el admixture para Jalisco y Nayarit (K 1:10)
bash admixtureNa.sh
bash admixtureJa.sh
###Hice el plot para el admixture (K 2:5)
Rscript plotadmixture2.R

####De manera manual cree 10 archivos de texto, uno para cada localidad, donde están los ID de las muestras de su respectiva localidad
###Extracción de datos genómicos de cada localidad en PLINK 
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/diploperennis_dataJa --make-bed --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/IDCorralitos.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Corralitos_data 
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/diploperennis_dataJa --make-bed --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/IDSanMiguelC.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Cuzalapa_data
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/diploperennis_dataJa --make-bed --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/IDPlayas.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Playas_data  
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/diploperennis_dataJa --make-bed --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/IDManantlan.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Manantlan_data 
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/diploperennis_dataNa --make-bed --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/IDEmbocada.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Embocada_data 
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/diploperennis_dataNa --make-bed --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/IDTateposco.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Tateposco_data 
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/diploperennis_dataNa --make-bed --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/IDElRincon.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/ElRincon_data 
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/diploperennis_dataNa --make-bed --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/IDAserradero.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Aserradero_data 
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/diploperennis_dataNa --make-bed --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/IDPino.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Pino_data 
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/diploperennis_dataNa --make-bed --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/IDZapotes.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Zapotes_data
###VCF
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Corralitos_data --recode vcf-iid --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Corralitos_data
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Cuzalapa_data --recode vcf-iid --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Cuzalapa_data
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Playas_data --recode vcf-iid --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Playas_data
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Manantlan_data --recode vcf-iid --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Manantlan_data
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Embocada_data --recode vcf-iid --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Embocada_data
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Tateposco_data --recode vcf-iid --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Tateposco_data
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/ElRincon_data --recode vcf-iid --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/ElRincon_data
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Aserradero_data --recode vcf-iid --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Aserradero_data
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Pino_data --recode vcf-iid --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Pino_data
./plink --bfile /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Zapotes_data --recode vcf-iid --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Zapotes_data
###Use PGDSpider para transformar los archivos de formato VCF a formato GENEPOP (.txt)
###Obtuve el Ne actual para cada localidad (además de Jalisco y Nayarit) en NeEtimator usando el método de desequilibrio de ligamiento

###Obtuve una reconstrucción demográfica historica de cada localidad (además de Nayarit y Jalisco) en GONE
###Parametros: datos faseados, tasa de recombinación de 0.73 cm/mb con corrección de Haldane, analiza 10 cromosomas y un máximo de 3500 snps por cromosoma
#####GONE
###Extraer datos génomicos sin filtro MAF de cada localidad
###Primero hice un filtro para quitar los sitios que no están asignados a ningún cromosoma
./plink --file /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/diploperennis_data_filteredNomaf --not-chr 0 --recode --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/diploperennis_NoMAF

###Extracción de datos génomicos por localidad
./plink --file /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/diploperennis_NoMAF0 --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/IDCorralitos.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/CorralitosNoMAF_data 
./plink --file /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/diploperennis_NoMAF0 --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/IDSanMiguelCuzalapa.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/CuzalapaNoMAF_data 
./plink --file /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/diploperennis_NoMAF0 --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/IDPlayas.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/PlayasNoMAF_data 
./plink --file /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/diploperennis_NoMAF0 --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/IDManantlan.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/ManantlanNoMAF_data 
./plink --file /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/diploperennis_NoMAF0 --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/IDEmbocada.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/EmbocadaNoMAF_data 
./plink --file /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/diploperennis_NoMAF0 --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/IDTateposco.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/TateposcoNoMAF_data 
./plink --file /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/diploperennis_NoMAF0 --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/IDElRincon.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/ElRinconNoMAF_data 
./plink --file /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/diploperennis_NoMAF0 --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/IDAserradero.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/AserraderoNoMAF_data 
./plink --file /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/diploperennis_NoMAF0 --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/IDPino.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/PinoNoMAF_data 
./plink --file /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/diploperennis_NoMAF0 --recode --keep /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/IDZapotes.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/LocalidadesNoMAF/ZapotesNoMAF_data 


bash script_GONE.sh CorralitosNoMAF_data
bash script_GONE.sh CuzalapaNoMAF_data
bash script_GONE.sh PlayasNoMAF_data
bash script_GONE.sh ManantlanNoMAF_data
bash script_GONE.sh EmbocadaNoMAF_data
bash script_GONE.sh TateposcoNoMAF_data
bash script_GONE.sh ElRinconNoMAF_data
bash script_GONE.sh AserraderoNoMAF_data
bash script_GONE.sh PinoNoMAF_data
bash script_GONE.sh ZapotesNoMAF_data

##Luego hice las gráficas de las primeras 200 generaciones hacia el pasado
Rscript plot_NeNoMAF.R
Rscript plot_NeLocalidades2.R

###Hice las Fst pareadas entre todas las localidades (45 comparaciones en total), siguiendo este formato
vcftools --vcf diploperennis_dataJa.vcf --weir-fst-pop IDCorralitos.txt --weir-fst-pop IDManantlan.txt --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Fst/Jalisco/Corralitos_Manantlan

###Calcule la endogamia para cada población
##Jalisco
vcftools --vcf diploperennis_dataJa.vcf --het --out endogamiaJalisco
##Nayarit
vcftools --vcf diploperennis_dataNa.vcf --het --out endogamiaJalisco

##Pruebas estadísticas para comprobar que las endogamias de las localidades son distintas
Rscript pruebas_estadisticasJa.R
Rscript pruebas_estadisticasNa.R
##Boxplot de las endogamias por localidad
Rscript endogamiaJa.R
Rscript endogamiaNa.R

###Calcule la D de tajima para Nayarit, Jalisco y cada localidad
vcftools --vcf diploperennis_dataJa --TajimaD 500 --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Jalisco500
vcftools --vcf diploperennis_dataNa --TajimaD 500 --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Nayarit500
vcftools --vcf Corralitos_data --TajimaD 500 --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Corralitos500 
vcftools --vcf SanMiguelC_data --TajimaD 500 --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Cuzalapa500 
vcftools --vcf Playas_data --TajimaD 500 --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Playas500 
vcftools --vcf Manantlan_data --TajimaD 500 --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Manantlan500
vcftools --vcf Embocada_data --TajimaD 500 --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Embocada500
vcftools --vcf Tateposco_data --TajimaD 500 --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Tateposco500
vcftools --vcf ElRincon_data --TajimaD 500 --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/ElRincon500
vcftools --vcf Aserradero_data --TajimaD 500 --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Aserradero500
vcftools --vcf Pino_data --TajimaD 500 --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Pino500
vcftools --vcf Zapotes_data --TajimaD 500 --out /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Zapotes500

###Hice boxplots de ja D de tajima por cromosoma en cada localidad
##Jalisco
Rscript plotTajimaJa.R
##Nayarit
Rscript plotTajimaNa.R
##Todas las localidades
Rscript plotTajimaLocalidades.R

###Hice pruebas estadísticas para observar si las D de tajima son estadísticamente distintas de 0
Rscript pruebasDTajima.R



####CurrentNe
./currentNe -k 0 -o CurrentCorralitos /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Corralitos_data.ped 10
./currentNe -k 0 -o CurrentCuzalapa /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/SanMiguelC_data.ped 10
./currentNe -k 0 -o CurrentPlayas /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Playas_data.ped 10
./currentNe -k 0 -o CurrentManantlan /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Manantlan_data.ped 10
./currentNe -k 0 -o CurrentEmbocada /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Embocada_data.ped 10
./currentNe -k 0 -o CurrentTateposco /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Tateposco_data.ped 10
./currentNe -k 0 -o CurrentElRincon /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/ElRincon_data.ped 10
./currentNe -k 0 -o CurrentAserradero /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Aserradero_data.ped 10
./currentNe -k 0 -o CurrentPino /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Pino_data.ped 10
./currentNe -k 0 -o CurrentZapotes /home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Localidades/Zapotes_data.ped 10
