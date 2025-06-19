![Pub](https://img.shields.io/pub/v/titled_navigation_bar) <a href="https://github.com/Solido/awesome-flutter">
   <img alt="Awesome Flutter" src="https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square" />
</a>

# Titled Bottom Navigation Bar

Une barre de navigation inférieure élégante, simple et personnalisable avec une animation fluide lors de la sélection. Ce package est hautement personnalisable et flexible, notamment pour l'affichage d'icônes ou d'images SVG.

Vous pouvez consulter le code source de cette bibliothèque dans le dossier [/lib](https://github.com/pedromassango/titled_navigation_bar/tree/master/lib).

### Montrez votre soutien :heart: en mettant une étoile au repo !

## Aperçu (mode par défaut)

![Default Mode Gif](screenshots/preview.gif "TitledNavigationBar")

## Aperçu (mode inversé)

![Reversed Mode Gif](screenshots/reverse.gif "TitledNavigationBar")

## Fonctionnalités principales

- [x] Couleur personnalisée pour l'icône
- [x] Couleur personnalisée pour l'indicateur
- [x] Support de deux à cinq items
- [x] Mode inversé (affiche l'élément sélectionné en icône ou en titre)
- [x] Couleur de fond personnalisable pour chaque item
- [x] Mise à jour via la propriété `currentIndex` (stateless)
- [x] Pas besoin de setState(...) pour changer l'index courant
- [x] Support du TextDirection RTL
- [x] Support de tout widget en tant qu'icône (Icon, SvgPicture, Image, ...)

## Installation

Ajoutez le plugin à votre fichier `pubspec.yaml` :

```yaml
dependencies:
  flutter:
    sdk: flutter
  titled_navigation_bar: ^5.0.0-nullsafety.0
  flutter_svg: ^2.0.0 # (optionnel, pour les SVG)
```

## Importation

```dart
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
// Pour les SVG :
import 'package:flutter_svg/flutter_svg.dart';
```

## Utilisation de base

```dart
bottomNavigationBar: TitledBottomNavigationBar(
  currentIndex: 2, // Position sélectionnée
  onTap: (index) {
    print("Selected Index: $index");
  },
  items: [
    TitledNavigationBarItem(title: Text('Home'), leading: Icon(Icons.home)),
    TitledNavigationBarItem(title: Text('Search'), leading: Icon(Icons.search)),
    TitledNavigationBarItem(title: Text('Bag'), leading: Icon(Icons.card_travel)),
    TitledNavigationBarItem(title: Text('Orders'), leading: Icon(Icons.shopping_cart)),
    TitledNavigationBarItem(title: Text('Profile'), leading: Icon(Icons.person_outline)),
  ],
)
```

## Utilisation avancée : SVG comme icône

```dart
import 'package:flutter_svg/flutter_svg.dart';

bottomNavigationBar: TitledBottomNavigationBar(
  currentIndex: 0,
  onTap: (index) {},
  items: [
    TitledNavigationBarItem(
      title: Text('SVG'),
      leading: SvgPicture.asset(
        'assets/icon.svg',
        width: 24,
        height: 24,
        color: Colors.blue, // Gérez la couleur manuellement pour les SVG
      ),
    ),
    // ... autres items
  ],
)
```

## Personnalisation

### TitledBottomNavigationBar
- **onTap** : Callback appelé lors du clic sur un item, retourne l'index sélectionné. (obligatoire)
- **items** : Liste des items à afficher (obligatoire, 2 à 5 items).
- **curve** : Courbe d'animation personnalisée.
- **reverse** : Si true, l'élément sélectionné affiche le texte, sinon l'icône (ou widget principal).
- **activeColor** : Couleur du texte/widget actif.
- **inactiveColor** : Couleur du texte/widget inactif.
- **indicatorColor** : Couleur de l'indicateur.
- **currentIndex** : Index de l'item sélectionné.
- **enableShadow** : Affiche ou non l'ombre sous la barre.
- **height** : Hauteur de la barre.
- **indicatorHeight** : Hauteur de l'indicateur.
- **inactiveStripColor** : Couleur de fond de la barre.

### TitledNavigationBarItem
- **leading** : Widget principal de l'item (Icon, SvgPicture, Image, ...). Si ce n'est pas un `Icon`, gérez la couleur manuellement.
- **title** : Titre de l'item (Widget).
- **backgroundColor** : Couleur de fond de l'item (optionnel, par défaut blanc).

## Bonnes pratiques
- Pour les SVG, utilisez le package [flutter_svg](https://pub.dev/packages/flutter_svg) et gérez la couleur via la propriété `color` du widget `SvgPicture`.
- Vous pouvez utiliser n'importe quel widget pour `leading` (Image, Icon, etc.), ce qui rend la barre très flexible.

---

Pour toute question ou suggestion, ouvrez une issue ou une PR sur le repo !
