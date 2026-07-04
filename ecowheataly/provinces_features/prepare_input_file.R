library(dplyr)
abm_input0<-read.csv("/Users/gianfrancogiulioni/Documents/git/prin_2022/ecowheataly_repast4py_model/abm_input_provinces_params.csv")
abm_input_to_join<-abm_input0[,c(names(abm_input0)[1:4],names(abm_input0)[12:16])]
yield_params<-read.csv("/Users/gianfrancogiulioni/Documents/git/prin_2022/Rica-data-cleaning/output/estimations_provincial_altimetry_filled.csv")
yield_params_to_join<-yield_params[,names(yield_params)[1:9]]
names(yield_params_to_join)[1]<-"province"
names(yield_params_to_join)[9]<-"max_yield"
yield_params_to_join[which(yield_params_to_join$province=="Reggio di Calabria"),"province"]<-"Reggio Calabria"
glued<-right_join(yield_params_to_join,abm_input_to_join,by=c("province","altimetry"))
new_abm_input<-glued[,names(abm_input0)]
col_names<-c("province","altimetry","n_farms","tot_sau_ha","lambda1","lambda2","lambda3","s1","s2","s3","max_yield","risk","share of ladies","wheat acreage distribution","farm acreage distribution","age distribution")
names(new_abm_input)<-col_names
write.csv(new_abm_input,"abm_input_provinces_params.csv",row.names=F,quote=F)



