# list2venn.pl list_msigdb.txt

require("Vennerable") 
require("gplots") 

par(ps=10)

## lists

E2F_targets=c("AK2","ANP32E","ASF1A","ASF1B","ATAD2","AURKA","AURKB","BARD1","BIRC5","BRCA1","BRCA2","BRMS1L","BUB1B","CBX5","CCNB2","CCNE1","CCP110","CDC20","CDC25A","CDC25B","CDCA3","CDCA8","CDK1","CDK4","CDKN1A","CDKN1B","CDKN2A","CDKN2C","CDKN3","CENPE","CENPM","CHEK1","CHEK2","CIT","CKS1B","CKS2","CSE1L","CTCF","CTPS","DCK","DCLRE1B","DCTPP1","DDX39A","DEK","DEPDC1","DIAPH3","DLGAP5","DNMT1","DONSON","DSCC1","DUT","E2F8","EED","EIF2S1","ESPL1","EXOSC8","EZH2","GINS1","GINS3","GINS4","GSPT1","H2AFX","H2AFZ","HELLS","HMGA1","HMGB2","HMGB3","HMMR","HN1","HNRNPD","HUS1","ILF3","ING3","IPO7","KIF18B","KIF22","KIF2C","KIF4A","KPNA2","LBR","LIG1","LMNB1","LUC7L3","LYAR","MAD2L1","MCM2","MCM3","MCM4","MCM5","MCM6","MCM7","MELK","MKI67","MLH1","MMS22L","MRE11A","MSH2","MTHFD2","MXD3","MYBL2","MYC","NAA38","NAP1L1","NASP","NBN","NCAPD2","NME1","NOLC1","NOP56","NUDT21","NUP107","NUP153","NUP205","ORC2","ORC6","PA2G4","PAICS","PAN2","PCNA","PDS5B","PHF5A","PLK1","PLK4","PMS2","PNN","POLA2","POLD1","POLD2","POLD3","POLE","POLE4","POP7","PPM1D","PPP1R8","PRDX4","PRIM2","PRKDC","PRPS1","PSIP1","PSMC3IP","PTTG1","RACGAP1","RAD1","RAD21","RAD50","RAD51AP1","RAD51C","RAN","RANBP1","RBBP7","RFC1","RFC2","RFC3","RNASEH2A","RPA1","RPA2","RPA3","RQCD1","RRM2","SHMT1","SLBP","SMC1A","SMC3","SMC4","SMC6","SNRPB","SPAG5","SPC24","SPC25","SRSF1","SRSF2","SSRP1","STAG1","STMN1","SUV39H1","SYNCRIP","TACC3","TBRG4","TCF19","TFRC","TIMELESS","TIPIN","TK1","TMPO","TOP2A","TP53","TRA2B","TRIP13","TUBB","TUBG1","UBE2S","UBE2T","UBR7","UNG","USP1","WDR90","WEE1","XPO1","XRCC6","ZW10")
MYC_targets=c("ABCE1","ACP1","AIMP2","AP3S1","APEX1","BUB3","C1QBP","CAD","CANX","CBX3","CCNA2","CCT2","CCT3","CCT4","CCT5","CCT7","CDC20","CDC45","CDK2","CDK4","CLNS1A","CNBP","COPS5","COX5A","CSTF2","CTPS","CUL1","CYC1","DDX18","DDX21","DEK","DHX15","DUT","EEF1B2","EIF1AX","EIF2S1","EIF2S2","EIF3B","EIF3D","EIF3J","EIF4A1","EIF4E","EIF4G2","EIF4H","EPRS","ERH","ETF1","EXOSC7","FAM120A","FBL","G3BP1","GLO1","GNB2L1","GNL3","GOT2","GSPT1","H2AFZ","HDAC2","HDDC2","HDGF","HNRNPA1","HNRNPA2B1","HNRNPA3","HNRNPC","HNRNPD","HNRNPR","HNRNPU","HPRT1","HSP90AB1","HSPD1","HSPE1","IARS","IFRD1","ILF2","IMPDH2","KARS","KPNA2","KPNB1","LDHA","LSM2","LSM7","MAD2L1","MCM2","MCM4","MCM5","MCM6","MCM7","MRPL23","MRPL9","MRPS18B","MYC","NAP1L1","NCBP1","NCBP2","NDUFAB1","NHP2","NME1","NOLC1","NOP16","NOP56","NPM1","ODC1","ORC2","PA2G4","PABPC1","PABPC4","PCBP1","PCNA","PGK1","PHB","PHB2","POLD2","POLE3","PPIA","PPM1G","PRDX3","PRDX4","PRPF31","PRPS2","PSMA1","PSMA2","PSMA4","PSMA6","PSMA7","PSMB2","PSMB3","PSMC4","PSMC6","PSMD1","PSMD14","PSMD3","PSMD7","PSMD8","PTGES3","PWP1","RAD23B","RAN","RANBP1","RFC4","RNPS1","RPL14","RPL18","RPL22","RPL34","RPL6","RPLP0","RPS10","RPS2","RPS3","RPS5","RPS6","RRM1","RRP9","RSL1D1","RUVBL2","SERBP1","SET","SF3A1","SF3B3","SLC25A3","SMARCC1","SNRPA","SNRPA1","SNRPB2","SNRPD1","SNRPD2","SNRPD3","SNRPG","SRM","SRPK1","SRSF1","SRSF2","SRSF3","SRSF7","SSB","SSBP1","STARD7","SYNCRIP","TARDBP","TCP1","TFDP1","TOMM70A","TRA2B","TRIM28","TUFM","TXNL4A","TYMS","U2AF1","UBA2","UBE2E1","UBE2L3","USP1","VBP1","VDAC1","VDAC3","XPO1","XPOT","XRCC6","YWHAE","YWHAQ")
up_E2=c("ABHD2","ADCY1","AMZ1","ANLN","AREG","ARHGAP11A","ARL3","ARMCX6","ASF1B","ASPM","ATAD2","ATAD5","AURKA","AURKB","BARD1","BCL2","BIRC5","BLM","BRCA1","BRCA2","BRI3BP","BRIP1","BUB1","BUB1B","C11orf82","C15orf23","C15orf42","C18orf45","C1QTNF6","C21orf58","CA12","CASC5","CBX5","CCDC34","CCDC99","CCNA2","CCNB2","CCNE2","CD320","CDC45","CDC6","CDCA2","CDCA4","CDCA5","CDCA7","CDCA7L","CDK1","CDK2","CDT1","CELSR2","CENPI","CENPJ","CENPL","CENPM","CENPN","CENPO","CEP55","CEP78","CEP85","CHAF1A","CHAF1B","CHEK1","CHPT1","CHRNA5","CHTF18","CIT","CLSPN","CNIH2","COL12A1","CTSD","CXCL12","DARS2","DCLRE1B","DDX10","DEGS2","DEPDC1B","DEPTOR","DHRS2","DHTKD1","DLGAP5","DNA2","DNMT1","DSCAM","DSCC1","DSN1","DTL","DUT","E2F1","E2F2","E2F7","E2F8","EBP","ELOVL2","EPS15L1","ESCO2","ESPL1","EXO1","EXOSC2","EXOSC5","FAM111B","FAM46C","FAM54A","FAM83D","FANCA","FANCC","FANCD2","FANCG","FANCI","FBXO5","FEN1","FIGNL1","FKBP4","FKBP5","FOXM1","FREM2","GAS2L3","GFRA1","GGH","GINS1","GINS2","GINS3","GLA","GLB1L2","GLT25D1","GMNN","GREB1","GTSE1","H19","H2AFX","HAUS4","HAUS8","HELLS","HIST1H1C","HIST1H1E","HPRT1","HR","IFITM10","IGFBP4","IL17RB","IL1RAP","IMPA2","INCENP","IQGAP3","JAK2","JPH1","KCNK15","KCNK5","KCNK6","KIAA0101","KIAA1524","KIF11","KIF23","KIF2C","KIF4A","KIFC1","KNTC1","KRT13","L2HGDH","LIG1","LMNB1","LOC81691","LRIG1","LRR1","LSM4","LYPD6","MAN1A1","MANEAL","MAP6D1","MASTL","MCM10","MCM2","MCM3","MCM4","MCM5","MCM6","MCM7","MCM8","MELK","MGP","MICB","MIS18A","MKI67","MLF1IP","MMS22L","MPHOSPH9","MRE11A","MTHFD1","MYB","MYBL1","MYBL2","MYO19","NASP","NCAPD2","NCAPD3","NCAPG","NCAPG2","NCAPH","NCAPH2","NFATC2","NME1","NOS1AP","NPY1R","NR2C2AP","NRIP1","NUP107","NUP85","NUSAP1","NXNL2","PAQR4","PBK","PCNA","PCP4","PDSS1","PGR","PKIB","PKMYT1","PLK1","PLK4","POLA1","POLA2","POLD1","POLD2","POLD3","POLE","POLE2","POLQ","PPIF","PRC1","PRIM1","PRR11","PSMC3IP","PTTG1","RAB31","RACGAP1","RAD18","RAD51","RAD54B","RAD54L","RAPGEFL1","RBBP8","RBL1","RECQL4","RERG","RET","RFC2","RFC3","RFC4","RFC5","RMI1","RNASEH2A","RPA3","RRM1","RRM2","SEMA3B","SFXN2","SGK3","SHCBP1","SIAH2","SKA3","SKP2","SLC22A5","SLC26A2","SLC27A2","SLC29A1","SLC2A1","SLC39A6","SLC39A8","SLC7A5","SLC9A3R1","SMC2","SNRNP25","SPAG5","SPC24","STC1","STC2","STIL","STMN1","SULF1","SUV39H1","SUV39H2","SYTL5","TACC3","TCF19","TET2","TFAP4","TFDP1","TFF1","TIMELESS","TK1","TMED8","TMEM120B","TMEM164","TMEM194A","TMEM38B","TMPO","TONSL","TOP2A","TPD52L1","TPX2","TRAIP","TREX2","TRIP13","TROAP","TST","TTF2","TTK","TYMS","UBE2C","UBE2T","UHRF1","UNG","VRK1","WDHD1","WDR34","WDR62","WDR76","WISP2","XBP1","XRCC2","XRCC3","XYLB","ZNF367","ZWILCH","ZWINT")


x = list(
  E2F_targets,MYC_targets,up_E2
 )

category = c("E2F_targets","MYC_targets","up_E2")

if(length(category) < 2){
  stop( "need at least 2 lists...")
}

##########################################
#  gplots : max 5
#  https://cran.r-project.org/web/packages/gplots

d = read.table(file="list_msigdb.gplot",row.names=1,sep="	",header=TRUE)

if(length(category) <= 5){

  try({ 
    venn(d) 
  },silent=TRUE)

}else{ print("skipping gplots (> 5 lists) ...")}

###########################################
#  Vennerable :  max 9
# https://github.com/js229/Vennerable
 
if(length(category) <= 9){

  w <- Venn(Sets=x,SetNames=c("E2F_targets","MYC_targets","up_E2") )
  # param:  type = "circles" , "squares", "ellipses", "triangles" , "AWFE"  or  "ChowRuskey"

 
  try({ plot(w, doWeights = FALSE) },silent=TRUE)
  try({ plot(w, doWeights = TRUE,type = "circles") },silent=TRUE)
  try({ plot(w, doWeights = FALSE,type = "circles") },silent=TRUE)
  try({ plot(w, doWeights = TRUE,type = "squares") },silent=TRUE)
  try({ plot(w, doWeights = TRUE,type = "ellipses")},silent=TRUE)
  try({ plot(w, doWeights = TRUE,type = "triangles") },silent=TRUE)
  try({ plot(w, doWeights = TRUE,type = "AWFE") },silent=TRUE)
  try({ plot(w, doWeights = TRUE,type = "ChowRuskey") },silent=TRUE)
  
 }else{ print("skipping Vennerable (> 9 lists) ...")}

##########################################
# heatmap

# par(ps=13)
# corgene = cor(x=d,y=NULL, use = "complete.obs",method = c("pearson"))
# nrcol <- 24
# heatmap.2(corgene,revC=TRUE, margins =c(12,9),cellnote = format(round(corgene, digits=2), nsmall = 2),notecol="darkgray", col =  rev(colorRampPalette(brewer.pal(10, "RdBu"))(nrcol)), scale="none",  key=TRUE, symkey=FALSE, density.info="none", trace="none", cexRow=0.70,cexCol=0.70, tracecol = "black", dendrogram=c("row"), main="heatmap pearson correlation" )
# heatmap.2(corgene,revC=TRUE, margins =c(12,9),cellnote = format(round(corgene, digits=2), nsmall = 2),notecol="black", col=topo.colors(nrcol), scale="none",  key=TRUE, symkey=FALSE, density.info="none",trace="none", tracecol="black", dendrogram=c("row"),cexRow=0.70,cexCol=0.70, main="heatmap pearson correlation")

# q(status = 1)

