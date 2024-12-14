# Chargeons les bibliothèques nécessaires
library(ggplot2)
library(dplyr)

# Créons un jeu de données simulé
set.seed(123)  # Pour la reproductibilité
regions <- c("Moyen-Orient", "Europe", "Asie", "Amérique du Nord", "Afrique", "Amérique du Sud")
nb_etudes <- c(5, 50, 30, 20, 15, 10)  # Nombres d'études simulées pour chaque région

data <- data.frame(region = regions, nb_etudes = nb_etudes)

# Calculons le pourcentage d'études par région
data <- data %>%
  mutate(pourcentage = nb_etudes / sum(nb_etudes) * 100)

# Affichons les données
print(data)

# Créons un graphique pour visualiser la répartition des études par région
ggplot(data, aes(x = region, y = pourcentage, fill = region)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Répartition des études géopolitiques par région",
       x = "Région",
       y = "Pourcentage d'études") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_brewer(palette = "Set3")

# Vérifions spécifiquement le nombre d'études dans le Moyen-Orient
if (data$nb_etudes[data$region == "Moyen-Orient"] < 10) {
  message("Il semble y avoir peu d'études géopolitiques sur le Moyen-Orient.")
} else {
  message("Le nombre d'études géopolitiques sur le Moyen-Orient est acceptable.")
}
