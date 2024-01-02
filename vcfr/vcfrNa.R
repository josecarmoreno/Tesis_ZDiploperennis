#Primero vamos a cargar mi archivo vcf
library(dplyr)
library(Rcpp)
library(vcfR)
library(adegenet)

vcf_diploNa <- read.vcfR("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/data/datosZdiploperennis/diploperennisNa_maf5_missing10.recode.vcf", verbose = FALSE)
diploNa_genind <- vcfR2genind(vcf_diploNa, return.alleles = TRUE)
diploNa_genind @pop <- as.factor(diploNa_pop$ID)

###Estadísticos de resumen

basic_diploNa = hierfstat::basic.stats(diploNa_genind, diploid = TRUE)
basic_diploNa$overall
