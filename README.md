# Joyeux_Noel

Application mobile pour souhaiter un joyeux Noël.

## Description

`Joyeux_Noel` est une application mobile développée avec Flutter qui permet de souhaiter un joyeux Noël de manière interactive. L'application inclut des fonctionnalités telles que des citations aléatoires, des animations de neige, et la lecture de vidéos festives.

- **Procurer un déblocage et continuer son propre code** en se référant juste aux multiples codes présents ici.
- **Aller plus rapidement avec des moyens de bord.**
- **Lire les ressources et comprendre son code de fond en comble.**

## Fonctionnalités

### 1. Écran de démarrage (HelloScreen)
Affiche une vidéo de Noël et redirige automatiquement vers l'écran principal après la fin de la vidéo.

### 2. Écran principal (HomeScreen)
Permet aux utilisateurs de saisir leur nom et de générer des citations de Noël aléatoires.

### 3. Écran de citations (QuoteScreen)
Affiche des citations de Noël aléatoires et des animations de neige.

### 4. Écran de vidéo (VideoScreen)
Lit une vidéo de Noël et redirige vers l'écran principal après 10 secondes.

## Utilisation

### 1. Choix de la Méthode

L'utilisateur peut choisir parmi les différentes fonctionnalités de l'application pour célébrer Noël de manière interactive. Les entrées de l'utilisateur sont vérifiées pour assurer la validité et la précision des affichages.

### 2. Exemples de Fonctions

Voici quelques exemples de fonctionnalités que vous pouvez utiliser :
- **Citations aléatoires** : Génère des citations inspirantes pour Noël.
- **Animations de neige** : Affiche des animations de neige pour une ambiance festive.
- **Lecture de vidéos** : Lit des vidéos festives pour célébrer Noël.

## Structure du projet

- `lib/`
    - `main.dart` : Point d'entrée de l'application.
    - `hello_screen.dart` : Écran de démarrage avec lecture de vidéo.
    - `home_screen.dart` : Écran principal avec formulaire de saisie de nom.
    - `quote_screen.dart` : Écran affichant des citations de Noël aléatoires.
    - `splash_screen.dart` : Écran de démarrage avec animation de neige.
    - `audio_provider.dart` : Gestion de la lecture audio.
    - `video_screen.dart` : Écran de lecture vidéo.

## Prérequis

- Flutter SDK : [Installation de Flutter](https://flutter.dev/docs/get-started/install)
- Android Studio ou Visual Studio Code avec les extensions Flutter et Dart

## Installation

1. Clonez le dépôt :
   ```sh
   git clone https://github.com/HordRic/Noel_APK.git