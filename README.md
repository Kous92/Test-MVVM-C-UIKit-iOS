# iOS (Swift 5): Test MVVM-C avec UIKit

L'architecture **MVVM** est une des architectures utilisées dans le développement iOS, mais parmi les plus populaires en entreprise.
Ici, voici un exemple simple où j'implémente l'architecture **MVVM** avec UIKit, avec le pattern **Coordinator**, résultant ainsi de l'architecture variante **MVVM-C**.

Le Coordinator est un pattern qui organise la logique de flux de navigation entre les différents écrans (`ViewController`) et qui isole la logique de navigation de l'interface utilisateur.

L'objectif principal du Coordinator est de rendre le code plus modulaire et plus facilement testable en réduisant la dépendance entre les différents composants de l'application. Il permet également de réduire la complexité de l'architecture de l'application en divisant les responsabilités de chaque composant.

Le coordinator se met en place avec une classe contenant des méthodes pour afficher le premier écran, naviguer d'un écran à un autre, et des attributs pour gérer les références entre les différents coordinators. Le principe de communication entre la vue et le coordinator se fait avec la délégation (`delegate`).