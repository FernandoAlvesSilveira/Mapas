library(geobr)
library(tidyverse)
library(ggspatial)
install.packages("ggspatial")


mun_uber <- c("Campinas", "Santos", "Goiânia", "Curitiba", "Natal", "Brasília",
              "Campo Grande", "Cuiabá", "Fortaleza", "Maceió", "Porto Alegre",
              "Recife", "Salvador", "Jundiaí", "Uberlândia", "Vitória", "Sorocaba",
              "Juiz de Fora", "São Bernardo do Campo", "Osasco", "Barueri", "Guarulhos",
              "São Caetano do Sul", "Santo André", "Diadema", "Mauá", "Carapicuíba",
              "Cotia", "Suzano", "Mogi das Cruzes", "Aracajú", "Florianópolis", 
              "João Pessoa", "Londrina", "Montes Claros", "Ribeirão Preto",
              "São José dos Campos", "São Luís", "Teresina", "Uberaba", "São Paulo",
              "Rio de Janeiro", "Belo Horizonte")

cit <- tabela3421$`Tabela 3421 - Unidades locais, empresas e outras organizações atuantes, pessoal ocupado total, pessoal ocupado assalariado, pessoal assalariado médio, salários e outras remunerações e salário médio mensal, por seção e divisão da classificação de atividades (CNAE 2.0), para os municípios com 50.000 habitantes ou mais`
cit <- cit
cidades <- cit[5:682]
cidades <- str_sub(cidades, end = -6)
cidades <- cidadesbkp
cidades2 <- data.frame(cidades, "Cities with more 50k inhabitants")
colnames(cidades2)[1] <- c("name_muni")
colnames(cidades2)[2] <- c("Cities with more 50k inhabitants")
cidades2 <- NA
length(municipio_uber$name_muni)

municipio_uber2 <- data.frame(mun_uber, "Uber entry in 2016")
municipio_uber2 <- municipio_uber
municipio_uber2 <- NA
colnames(municipio_uber2)[1] <- "name_muni"
colnames(municipio_uber2)[2] <- "Uber entry in 2016"




city <- data.frame(cidades)
colnames(city)[1] <- "name_muni"

mun <- read_municipality(code_muni = "all", year = 2018)
br <- read_country(year = 2018)

head(city)
head(mun)
length(mun$name_muni)
length(city$name_muni)

municipio_uber
dados_plot_uber$name_muni


dados_plot <- inner_join(mun, cidades, by = "name_muni")
dados_plot_uber <- inner_join(mun, municipio_uber, by ="name_muni")
length(dados_plot$name_muni)
length(dados_plot_uber$name_muni)
dados_plot_uber$name_muni

cidadesplot <- inner_join(mun, municipio_uber2, by = c("name_muni"))

cidadesplottotal <- inner_join(mun, cidades2, by = c("name_muni"))

cidadesplot$`Uber entry in 2016`

#plot 
ggplot() +
  geom_sf(data=mun, fill="white", color="#2D3E50", size=.0005, show.legend = FALSE) +
  geom_sf(data=dados_plot, aes(fill="Observed cities")) +
  geom_sf(data=dados_plot_uber, aes(fill="Cities where uber operates")) +
  labs(fill = "Cities analyzed",subtitle="Brazilian cities with more than 50k inhabitants", size=12) +
  annotation_north_arrow(style = north_arrow_fancy_orienteering) +
  annotation_scale(location = "br") +
  theme_bw()












