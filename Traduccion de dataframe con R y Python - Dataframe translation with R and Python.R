# install.packages("reticulate")
# install.packages("rjson") #ya ni me acuerdo si este es necesario pero yolo

library(reticulate)
library(rjson)

## funcionamiento reticulate/python
py <- rminiconda::find_miniconda_python("viflo")
reticulate::use_python(py, required = TRUE)

pd <- import("pandas") #importación librería
pd$array(c(1, 2, 3)) #prueba de funcionamiento

### pip install -U deep-translator #instalación librería via el terminal

dt <- import("deep_translator") #importación librería de traducción

#from deep_translator import GoogleTranslator #python
#GoogleTranslator(source='auto', target='es').translate("keep it up, you are awesome") #python

## para traducir un string
## especificar lenguajes -> source = lenguaje de entrada, target = lenguaje de salida
## código lenguaje: https://www.labnol.org/code/19899-google-translate-languages

dt$GoogleTranslator(source='en', target='es')$translate("hello") #español
dt$GoogleTranslator(source='en', target='fi')$translate("goodbye") #finnish
dt$GoogleTranslator(source='en', target='vi')$translate("gracias") #vietnamese

## para traducir un dataframe

translator <-  dt$GoogleTranslator(source='en', target='es')
translator$translate("sky")

# Creating a fake R dataframe with categories in English ## gracias chat gpt
fake_data <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Category = c("Fruit", "Vegetable", "Fruit", "Vegetable", "Fruit"),
  Value = c(15, 20, 12, 18, 25)
)

print(fake_data)

## df['Traducción'] = df['Employment Title'].apply(lambda x: translator.translate(x, dest='es')) #python
## dataframe$Columna_traducida  <- sapply(dataframe$Columna_a_traducir , function(x) translator$translate(x, dest = "es")) #R

fake_data$Categoría  <- sapply(fake_data$Category , function(x) translator$translate(x, dest = "es")) #R

#listo
#-vf