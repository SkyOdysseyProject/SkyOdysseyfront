# Utiliser une image Node.js comme image de base
FROM node:20.18 as build

RUN npm install -g @angular/cli

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install --silent

# Copier tout le reste des fichiers
COPY . ./

EXPOSE 4200

# Démarrer le serveur de développement Angular
CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "4200", "--poll", "2000"]
