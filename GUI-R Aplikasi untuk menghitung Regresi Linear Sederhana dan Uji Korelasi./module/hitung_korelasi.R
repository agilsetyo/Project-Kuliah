#awal#

### KORELASI ####


hitung_korelasi <-function(dataku, desimal)
{
  
  my_data= dataku
  
  ######### Pearson and Spearman Correlation###########
  
  save_name_variable = vector(mode="character")
  save_t_statistic_Pearson = vector(mode = "numeric")
  save_pearson_correlation = vector(mode = "numeric")
  save_p_value_pearson_correlation  = vector(mode = "numeric")
  save_df_pearson = vector(mode = "numeric")
  
  save_Spearman_correlation = vector(mode = "numeric")
  save_Spearman_P_value = vector(mode = "numeric")
  
  
  n_length = length(my_data)
  k = 0
  
  for(i in 1 : n_length)
  {
    for(j in i : n_length)
    {   
      if(i!=j)
      { 
        
        k = k + 1
        x = my_data[,i]
        y = my_data[,j]
        
        name_x = colnames(my_data) [i]
        name_y = colnames(my_data) [j]
        
        name_variable = paste0(name_x, "&",name_y)
        save_name_variable[k] = name_variable
        
        Pearson_result = cor.test(x,y, method = c("pearson"))
        
        t_statistic = Pearson_result$statistic
        save_t_statistic_Pearson[k] = t_statistic
        
        Pearson_correlation = Pearson_result$estimate
        save_pearson_correlation[k] = Pearson_correlation
        
        Pearson_P_value = Pearson_result$p.value
        save_p_value_pearson_correlation[k] = Pearson_P_value
        
        Pearson_df = Pearson_result$parameter
        save_df_pearson[k] = Pearson_df
        
        
        Spearman_result = cor.test(x,y, method = c("spearman"))
        
        Spearman_correlation = Spearman_result$estimate
        save_Spearman_correlation[k] = Spearman_correlation
        
        Spearman_P_value = Spearman_result$p.value
        save_Spearman_P_value[k] = Spearman_P_value
        
        
        
      }
      
    }#End for ALL
    
    save_pearson_correlation = round(save_pearson_correlation, digits = desimal)
    save_t_statistic_Pearson = round(save_t_statistic_Pearson, digits = desimal)
    save_p_value_pearson_correlation = round(save_p_value_pearson_correlation, digits = desimal)
    
    dat_Pearson = data.frame(save_name_variable, save_pearson_correlation, save_df_pearson,save_t_statistic_Pearson,save_p_value_pearson_correlation)
    
    colnames(dat_Pearson) = c("Correlation","Pearson Correlation","Degree Of Freedom (df)","Statistic of t","P-Value")
    
    save_Spearman_correlation = round(save_Spearman_correlation, digits = desimal)
    save_Spearman_P_value = round(save_Spearman_P_value, digits = desimal)
    
    dat_Spearman = data.frame(save_name_variable, save_Spearman_correlation, save_Spearman_P_value)
    colnames(dat_Spearman) = c("Correlation","Spearman Correlation","P-Value")
    
    
    list_korelasi = list(dat_Pearson, dat_Spearman)
    
    return(list_korelasi)
    
  }}


#aKHIR#