library(shiny)
library(ggplot2)
library(plotly)
library(rmarkdown)
library(knitr)
library(pander)
library(openintro ) 
library(plotrix)
library(shinythemes)
library(openxlsx)

source("module/hitung_korelasi.r")
source("module/cetak_hasil_excel.r")


#untuk UI GUI#

ui <- fluidPage(
  
  theme = shinytheme("flatly"),
  
  h3("PENGUKURAN NILAI RISIKO KREDIT OBLIGASI EXPECTED DEFAULT FREQUENCY (EDF) DENGAN PENDEKATAN MODEL KMV MERTON BERBASIS GUI R  ", style= "font-family: 'arial', cursive;
     color:navy; text-align:center"),
  
  h3("24050118140083", style= "font-family: 'arial', cursive;
     color:navy; text-align:center"),
  
  h4(" Ujian Akhir Semester : Komputasi Statistika Lanjut", style="
font-family:'cursive';
color: #ad1d28;
text-align:center
"),

#menampilkan gambar
  HTML('<center><img src="logo.png" width="200"></center>'),
 
  
  h2("REGRESI SEDERHANA & UJI KORELASI", style= "font-family: 'arial', cursive;
     color:dark; text-align:center"),
  
  
  navbarPage("", 
             tabPanel("Beranda",
                      
                      h3("PENGUKURAN NILAI RISIKO KREDIT OBLIGASI EXPECTED DEFAULT FREQUENCY (EDF) DENGAN PENDEKATAN MODEL KMV MERTON BERBASIS GUI R  ", style= "font-family: 'arial', cursive;
     color:navy; text-align:center"),
                      
                      h2("Pearson Correlation",style="
font-family: 'Lobster' , cursive;
color: blue;
text-align:center
"),
                      
                      h4("Decimal:",style="color:orange; text-shadow: -1px 0 black,
0 1px black, 1px 0 black, 0 -1px black; text-align:left", align = "left"),
                      sliderInput("seting_desimal","", 1,10,3, step = 1),
                      
                      DT::DTOutput("hasil_korelasi_pearson"),
                      
                      
                      
                      br(),
                      br(),
                      
                      h2("Spearman Correlations", style="
                                 font-family: 'Lobster',cursive;
                                 color: blue;
                                 text-align:center
                                 "),
                      
                      DT::DTOutput("hasil_korelasi_spearman"),     
                      
                      br()
                      
             ),
             
             
  tabPanel("Import Data",
           sidebarPanel(
             fileInput("ambil_file_data"," Pilih File Format .txt atau .csv",
                       accept = c (
                         "text/csv",
                         "text/comma-separated-values, text/plain",
                         ".csv")
             ),
             
             radioButtons("pemisah_variabel", "Separator",
                          choices = c(Comma = ",",
                                      Semicolon = ";",
                                      Tab = "\t"),
                          selected = ",", inline = TRUE),
             
           ),
           
           mainPanel(
             DT::DTOutput("tampilkan_data"),
             
           ),
           
           br()
           
  ),
  
  
  tabPanel("Select Variabel",
           
           
           sidebarPanel(
             
             shinyAce::aceEditor("pilih_variabel", value="1\n2\n", mode="r", theme="cobalt", height = 380),
             
             br()
             
           ),
           
           mainPanel(
             
             verbatimTextOutput("pilihan_variabel_anda"),
             
             br()
             
           ),
           
           br()
  ),
  
  
  tabPanel("RINGKASAN DATA PERUSAHAAN ",
           
           
           h2("Pearson Correlation",style="
font-family: 'Lobster' , cursive;
color: blue;
text-align:center
"),
           
           h4("Decimal:",style="color:orange; text-shadow: -1px 0 black,
0 1px black, 1px 0 black, 0 -1px black; text-align:left", align = "left"),
           sliderInput("seting_desimal","", 1,10,3, step = 1),
           
           DT::DTOutput("hasil_korelasi_pearson"),
           
           
           
           br(),
           br(),
           
           h2("Spearman Correlations", style="
                                 font-family: 'Lobster',cursive;
                                 color: blue;
                                 text-align:center
                                 "),
           
           DT::DTOutput("hasil_korelasi_spearman"),     
           
           br()
           
  ),
  
  tabPanel("Uji Normalitas",
           
          
           h2("Pearson Correlation",style="
font-family: 'Lobster' , cursive;
color: blue;
text-align:center
"),
           
           h4("Decimal:",style="color:orange; text-shadow: -1px 0 black,
0 1px black, 1px 0 black, 0 -1px black; text-align:left", align = "left"),
           sliderInput("seting_desimal","", 1,10,3, step = 1),
           
           DT::DTOutput("hasil_korelasi_pearson"),
           
           
           
           br(),
           br(),
           
           h2("Spearman Correlations", style="
                                 font-family: 'Lobster',cursive;
                                 color: blue;
                                 text-align:center
                                 "),
           
           DT::DTOutput("hasil_korelasi_spearman"),     
           
           br()
           
  ),
  
  
  tabPanel("Uji Korelasi",
           
           
           h2("Pearson Correlation",style="
font-family: 'Lobster' , cursive;
color: blue;
text-align:center
"),
           
           h4("Decimal:",style="color:orange; text-shadow: -1px 0 black,
0 1px black, 1px 0 black, 0 -1px black; text-align:left", align = "left"),
           sliderInput("seting_desimal","", 1,10,3, step = 1),
           
           DT::DTOutput("hasil_korelasi_pearson"),
           
           
           
           br(),
           br(),
           
           h2("Spearman Correlations", style="
                                 font-family: 'Lobster',cursive;
                                 color: blue;
                                 text-align:center
                                 "),
           
           DT::DTOutput("hasil_korelasi_spearman"),     
           
           br()
           
  ),
  
tabPanel("About",
             
        
             
             h2("PENYUSUN PROGRAM", style= "font-family: 'Times New Roman', cursive;
     color:navy; text-align:center"),
             
             h4(" Ujian Akhir Semester : Komputasi Statistika Lanjut", style="
font-family:'cursive';
color: #ad1d28;
text-align:center
"),
             
         HTML('<center><img src="FSM.png" width="400"></center>'),
         
             br(),  
             
             h3("Program ini dibuat dan disusun oleh:"),
             
             
             h3("Agil Setyo Anggoro (24050118140083)", style= "font-family: 'times new roman', cursive;
                color:Dark; text-align:start"),
             
         h4("program studi S1 Statistika, Fakultas Sains dan Matematika, 
Universitas Diponegoro 
Semarang, 2021

Semoga program yang telah dibuat ini dapat bermanfaat bagi memakainya, terima kasih mohon maaf bila masih ada banyak kekurangannya", style= "font-family: 'Times New Roman', cursive;
     color:black; text-align:start"),
             
             h4(" Semoga program yang telah dibuat ini dapat bermanfaat bagi memakainya, terima kasih mohon maaf bila masih ada banyak kekurangannya", style= "font-family: 'Times New Roman', cursive;
     color:black; text-align:start")     
             
  ) 
  
  ),             
  br()                   
  
)

  
#untuk Server GUI#

server <- function(input, output) {
  extract <- function(text) {
    text <- gsub(" ", "", text)
    split <- strsplit(text, ",", fixed = FALSE)[[1]]
    as.numeric(split)
  }

    


  
  ######### Select Varibel ##########
  
  kirim_pilih_variabel <- reactive({
    
    indeks_pilihan_variabel <- read.csv(text=input$pilih_variabel, header = F, sep="",na.strings=c("","NA","."))
    indeks_pilihan_variabel = unlist(indeks_pilihan_variabel)
    indeks_pilihan_variabel = as.numeric(indeks_pilihan_variabel)
    
    return(indeks_pilihan_variabel)
    
  })
  
  output$pilihan_variabel_anda <- renderPrint({
    
    ambil_data <- data_ku()
    nama_variabel <- colnames(ambil_data)
    
    indeks_pilih_variabel <- kirim_pilih_variabel()
    
    cat(sprintf("selected variable(s):\n\n"))
    
    print(nama_variabel[c(indeks_pilih_variabel)])
    
    
  })
  
  
  ######### Hasil Korelasi ##########
  
  output$hasil_korelasi_pearson <- DT::renderDT({
    
    ambil_data <- data_ku()
    
    indeks_pilih_variabel <- kirim_pilih_variabel()
    
    hasil_perhitungan_korelasi <- hitung_korelasi(ambil_data[indeks_pilih_variabel], input$seting_desimal)

    cetak_hasil_excel(hasil_perhitungan_korelasi[[1]]) 
    
    DT::datatable(hasil_perhitungan_korelasi[[1]])
    
  })
  
  
  output$hasil_korelasi_spearman <- DT::renderDT({
    
    ambil_data <- data_ku()
    
    indeks_pilih_variabel <- kirim_pilih_variabel()
    
    hasil_perhitungan_korelasi <- hitung_korelasi(ambil_data[indeks_pilih_variabel], input$seting_desimal)
    
    cetak_hasil_excel(hasil_perhitungan_korelasi[[2]]) 
   
    DT::datatable(hasil_perhitungan_korelasi[[2]])
    
  })
  
   
#untuk run GUI#
}

shinyApp(ui = ui, server = server)