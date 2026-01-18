import 'dart:math';

import 'package:quiz_ai/models/category.dart';
import 'package:quiz_ai/models/difficulty.dart';
import 'package:quiz_ai/models/question.dart';

class QuestionRepository {
  final _random = Random();

  List<Question> getQuestions({
    required Category category,
    required Difficulty difficulty,
    required int count,
    required bool shuffleAnswers,
  }) {
    final filtered = _questions
        .where((question) =>
            question.category == category && question.difficulty == difficulty)
        .toList();
    if (filtered.isEmpty) {
      return [];
    }
    filtered.shuffle(_random);
    final selected = filtered.take(count).toList();
    if (!shuffleAnswers) {
      return selected;
    }
    return selected.map(_shuffleQuestionAnswers).toList();
  }

  Question _shuffleQuestionAnswers(Question question) {
    final indices = List<int>.generate(question.answers.length, (index) => index);
    indices.shuffle(_random);
    final shuffledAnswers =
        indices.map((index) => question.answers[index]).toList();
    final newCorrectIndex = indices.indexOf(question.correctIndex);
    return Question(
      category: question.category,
      difficulty: question.difficulty,
      text: question.text,
      answers: shuffledAnswers,
      correctIndex: newCorrectIndex,
      explanation: question.explanation,
    );
  }

  static const List<Question> _questions = [
    // Culture générale
    Question(
      category: Category.general,
      difficulty: Difficulty.facile,
      text: 'Quelle est la capitale de la France ?',
      answers: ['Paris', 'Lyon', 'Marseille', 'Toulouse'],
      correctIndex: 0,
      explanation: 'Paris est la capitale et la plus grande ville de France.',
    ),
    Question(
      category: Category.general,
      difficulty: Difficulty.facile,
      text: 'Quelle est la plus grande planète du système solaire ?'
      ,
      answers: ['Jupiter', 'Saturne', 'Neptune', 'Mars'],
      correctIndex: 0,
      explanation: 'Jupiter est la plus massive et la plus grande planète.',
    ),
    Question(
      category: Category.general,
      difficulty: Difficulty.facile,
      text: 'Combien y a-t-il de continents sur Terre ?'
      ,
      answers: ['7', '5', '6', '8'],
      correctIndex: 0,
      explanation: 'On compte traditionnellement 7 continents.',
    ),
    Question(
      category: Category.general,
      difficulty: Difficulty.facile,
      text: 'Quel est le symbole chimique de l’eau ?'
      ,
      answers: ['H2O', 'O2', 'CO2', 'NaCl'],
      correctIndex: 0,
      explanation: 'L’eau est composée de deux hydrogènes et un oxygène.',
    ),
    Question(
      category: Category.general,
      difficulty: Difficulty.facile,
      text: 'Qui a écrit « Le Petit Prince » ?'
      ,
      answers: [
        'Antoine de Saint-Exupéry',
        'Victor Hugo',
        'Jules Verne',
        'Albert Camus'
      ],
      correctIndex: 0,
      explanation: 'Le roman a été publié en 1943 par Saint-Exupéry.',
    ),
    Question(
      category: Category.general,
      difficulty: Difficulty.moyen,
      text: 'En quelle année a eu lieu la Révolution française ?'
      ,
      answers: ['1789', '1815', '1848', '1914'],
      correctIndex: 0,
      explanation: 'La prise de la Bastille en 1789 marque le début.',
    ),
    Question(
      category: Category.general,
      difficulty: Difficulty.moyen,
      text:
          'Quelle est la vitesse approximative de la lumière dans le vide ?'
      ,
      answers: ['300 000 km/s', '150 000 km/s', '30 000 km/s', '3 000 km/s'],
      correctIndex: 0,
      explanation: 'Elle est d’environ 299 792 km/s.',
    ),
    Question(
      category: Category.general,
      difficulty: Difficulty.moyen,
      text: 'Quelle est la plus longue rivière du monde ?'
      ,
      answers: ['Nil', 'Amazone', 'Mississippi', 'Yangtsé'],
      correctIndex: 0,
      explanation: 'Le Nil est traditionnellement cité comme la plus longue.',
    ),
    Question(
      category: Category.general,
      difficulty: Difficulty.moyen,
      text: 'Quel organe produit l’insuline ?'
      ,
      answers: ['Pancréas', 'Foie', 'Cœur', 'Rate'],
      correctIndex: 0,
      explanation: 'Le pancréas sécrète l’insuline pour réguler la glycémie.',
    ),
    Question(
      category: Category.general,
      difficulty: Difficulty.moyen,
      text: 'Quelle est la langue maternelle la plus parlée au monde ?'
      ,
      answers: ['Mandarin', 'Anglais', 'Espagnol', 'Hindi'],
      correctIndex: 0,
      explanation: 'Le mandarin compte le plus grand nombre de locuteurs natifs.',
    ),
    Question(
      category: Category.general,
      difficulty: Difficulty.difficile,
      text: 'Qui a peint « La Nuit étoilée » ?'
      ,
      answers: [
        'Vincent van Gogh',
        'Claude Monet',
        'Pablo Picasso',
        'Salvador Dalí'
      ],
      correctIndex: 0,
      explanation: 'Van Gogh a réalisé cette œuvre en 1889.',
    ),
    Question(
      category: Category.general,
      difficulty: Difficulty.difficile,
      text: 'Quel est le numéro atomique du carbone ?'
      ,
      answers: ['6', '8', '12', '14'],
      correctIndex: 0,
      explanation: 'Le carbone a 6 protons, donc un numéro atomique de 6.',
    ),
    Question(
      category: Category.general,
      difficulty: Difficulty.difficile,
      text: 'En quelle année l’homme a-t-il marché sur la Lune ?'
      ,
      answers: ['1969', '1965', '1972', '1959'],
      correctIndex: 0,
      explanation: 'Apollo 11 a atterri le 20 juillet 1969.',
    ),
    Question(
      category: Category.general,
      difficulty: Difficulty.difficile,
      text: 'Quelle est la plus haute montagne du monde ?'
      ,
      answers: ['Everest', 'K2', 'Kangchenjunga', 'Lhotse'],
      correctIndex: 0,
      explanation: 'L’Everest culmine à 8 849 m.',
    ),
    Question(
      category: Category.general,
      difficulty: Difficulty.difficile,
      text: 'Quel élément chimique a pour symbole Au ?'
      ,
      answers: ['Or', 'Argent', 'Aluminium', 'Osmium'],
      correctIndex: 0,
      explanation: 'Au est le symbole de l’or (aurum en latin).',
    ),
    // Football
    Question(
      category: Category.football,
      difficulty: Difficulty.facile,
      text: 'Combien de joueurs par équipe sont sur le terrain ?'
      ,
      answers: ['11', '10', '9', '12'],
      correctIndex: 0,
      explanation: 'Chaque équipe aligne 11 joueurs.',
    ),
    Question(
      category: Category.football,
      difficulty: Difficulty.facile,
      text: 'Quelle compétition a lieu tous les 4 ans ?'
      ,
      answers: ['Coupe du Monde', 'Ligue des champions', 'Euro U21', 'Copa América'],
      correctIndex: 0,
      explanation: 'La Coupe du Monde FIFA se joue tous les quatre ans.',
    ),
    Question(
      category: Category.football,
      difficulty: Difficulty.facile,
      text: 'Quel pays a remporté la Coupe du Monde 2018 ?'
      ,
      answers: ['France', 'Croatie', 'Brésil', 'Allemagne'],
      correctIndex: 0,
      explanation: 'La France a battu la Croatie 4-2 en finale.',
    ),
    Question(
      category: Category.football,
      difficulty: Difficulty.facile,
      text: 'Quel joueur est surnommé « le Roi Pelé » ?'
      ,
      answers: ['Pelé', 'Maradona', 'Zidane', 'Ronaldo'],
      correctIndex: 0,
      explanation: 'Pelé est une légende du football brésilien.',
    ),
    Question(
      category: Category.football,
      difficulty: Difficulty.facile,
      text: 'Que signifie un carton rouge ?'
      ,
      answers: ['Expulsion du joueur', 'Avertissement simple', 'Pénalty', 'Temps mort'],
      correctIndex: 0,
      explanation: 'Le joueur est expulsé et ne peut être remplacé.',
    ),
    Question(
      category: Category.football,
      difficulty: Difficulty.moyen,
      text: 'Quel club a remporté la Ligue des champions 2020 ?'
      ,
      answers: ['Bayern Munich', 'Paris SG', 'Liverpool', 'Chelsea'],
      correctIndex: 0,
      explanation: 'Le Bayern a battu le PSG en finale à Lisbonne.',
    ),
    Question(
      category: Category.football,
      difficulty: Difficulty.moyen,
      text: 'Qui est le meilleur buteur de l’histoire de la Coupe du Monde ?'
      ,
      answers: ['Miroslav Klose', 'Ronaldo', 'Gerd Müller', 'Just Fontaine'],
      correctIndex: 0,
      explanation: 'Klose a marqué 16 buts en Coupe du Monde.',
    ),
    Question(
      category: Category.football,
      difficulty: Difficulty.moyen,
      text: 'Quel pays a remporté l’Euro 2016 ?'
      ,
      answers: ['Portugal', 'France', 'Allemagne', 'Espagne'],
      correctIndex: 0,
      explanation: 'Le Portugal a gagné 1-0 contre la France.',
    ),
    Question(
      category: Category.football,
      difficulty: Difficulty.moyen,
      text: 'Qui a gagné le Ballon d’Or 2006 ?'
      ,
      answers: ['Fabio Cannavaro', 'Ronaldinho', 'Zidane', 'Kaká'],
      correctIndex: 0,
      explanation: 'Cannavaro a été récompensé après le Mondial 2006.',
    ),
    Question(
      category: Category.football,
      difficulty: Difficulty.moyen,
      text: 'Dans quelle ville se trouve le stade d’Anfield ?'
      ,
      answers: ['Liverpool', 'Manchester', 'Londres', 'Birmingham'],
      correctIndex: 0,
      explanation: 'Anfield est le stade historique du Liverpool FC.',
    ),
    Question(
      category: Category.football,
      difficulty: Difficulty.difficile,
      text: 'Quel club a remporté la première Coupe d’Europe des clubs champions ?'
      ,
      answers: ['Real Madrid', 'AC Milan', 'Benfica', 'Juventus'],
      correctIndex: 0,
      explanation: 'Le Real Madrid a gagné l’édition 1955-1956.',
    ),
    Question(
      category: Category.football,
      difficulty: Difficulty.difficile,
      text: 'Quel joueur français a marqué en finale des Coupes du Monde 1998 et 2006 ?'
      ,
      answers: ['Zinedine Zidane', 'Thierry Henry', 'Didier Deschamps', 'David Trezeguet'],
      correctIndex: 0,
      explanation: 'Zidane a marqué en 1998 et sur penalty en 2006.',
    ),
    Question(
      category: Category.football,
      difficulty: Difficulty.difficile,
      text: 'Quel sélectionneur a remporté la Coupe du Monde 2014 avec l’Allemagne ?'
      ,
      answers: ['Joachim Löw', 'Jürgen Klopp', 'Ottmar Hitzfeld', 'Jupp Heynckes'],
      correctIndex: 0,
      explanation: 'Joachim Löw était le sélectionneur en 2014.',
    ),
    Question(
      category: Category.football,
      difficulty: Difficulty.difficile,
      text: 'Quel pays a remporté la CAN 2019 ?'
      ,
      answers: ['Algérie', 'Sénégal', 'Nigeria', 'Égypte'],
      correctIndex: 0,
      explanation: 'L’Algérie a gagné 1-0 contre le Sénégal.',
    ),
    Question(
      category: Category.football,
      difficulty: Difficulty.difficile,
      text: 'Quel joueur a marqué 36 buts en Premier League 2022-2023 ?'
      ,
      answers: ['Erling Haaland', 'Harry Kane', 'Mohamed Salah', 'Kevin De Bruyne'],
      correctIndex: 0,
      explanation: 'Haaland a battu le record sur une saison à 38 matches.',
    ),
    // Cinéma / Séries
    Question(
      category: Category.cinema,
      difficulty: Difficulty.facile,
      text: 'Qui a réalisé le film « Titanic » ?'
      ,
      answers: ['James Cameron', 'Steven Spielberg', 'Ridley Scott', 'Peter Jackson'],
      correctIndex: 0,
      explanation: 'James Cameron a réalisé et coécrit Titanic.',
    ),
    Question(
      category: Category.cinema,
      difficulty: Difficulty.facile,
      text: 'Comment s’appelle le jeune sorcier de J.K. Rowling ?'
      ,
      answers: ['Harry Potter', 'Ron Weasley', 'Frodon', 'Percy Jackson'],
      correctIndex: 0,
      explanation: 'Harry Potter est le héros principal de la saga.',
    ),
    Question(
      category: Category.cinema,
      difficulty: Difficulty.facile,
      text: 'Comment s’appelle l’anneau à détruire dans Le Seigneur des Anneaux ?'
      ,
      answers: ['L’Anneau Unique', 'L’Anneau d’Émeraude', 'L’Anneau du Roi', 'L’Anneau des Elfes'],
      correctIndex: 0,
      explanation: 'L’Anneau Unique doit être détruit au Mordor.',
    ),
    Question(
      category: Category.cinema,
      difficulty: Difficulty.facile,
      text: 'Quelle série met en scène Walter White ?'
      ,
      answers: ['Breaking Bad', 'Dexter', 'Lost', 'The Wire'],
      correctIndex: 0,
      explanation: 'Walter White est le personnage principal de Breaking Bad.',
    ),
    Question(
      category: Category.cinema,
      difficulty: Difficulty.facile,
      text: 'Quel film d’animation met en scène un ogre vert ?'
      ,
      answers: ['Shrek', 'Toy Story', 'Cars', 'Kung Fu Panda'],
      correctIndex: 0,
      explanation: 'Shrek est l’ogre vert emblématique de DreamWorks.',
    ),
    Question(
      category: Category.cinema,
      difficulty: Difficulty.moyen,
      text: 'Quel acteur incarne Iron Man dans le MCU ?'
      ,
      answers: ['Robert Downey Jr.', 'Chris Evans', 'Chris Hemsworth', 'Mark Ruffalo'],
      correctIndex: 0,
      explanation: 'Robert Downey Jr. joue Tony Stark.',
    ),
    Question(
      category: Category.cinema,
      difficulty: Difficulty.moyen,
      text: 'Quelle série se déroule à Hawkins et parle de l’Upside Down ?'
      ,
      answers: ['Stranger Things', 'Dark', 'The OA', 'The X-Files'],
      correctIndex: 0,
      explanation: 'La série Netflix se déroule à Hawkins, Indiana.',
    ),
    Question(
      category: Category.cinema,
      difficulty: Difficulty.moyen,
      text: 'Quel film a remporté l’Oscar du meilleur film 2020 ?'
      ,
      answers: ['Parasite', '1917', 'Joker', 'Once Upon a Time in Hollywood'],
      correctIndex: 0,
      explanation: 'Parasite de Bong Joon-ho a gagné l’Oscar du meilleur film.',
    ),
    Question(
      category: Category.cinema,
      difficulty: Difficulty.moyen,
      text: 'Quel réalisateur est à l’origine de la trilogie « Le Parrain » ?'
      ,
      answers: ['Francis Ford Coppola', 'Martin Scorsese', 'Brian De Palma', 'Sergio Leone'],
      correctIndex: 0,
      explanation: 'Coppola a réalisé les trois films.',
    ),
    Question(
      category: Category.cinema,
      difficulty: Difficulty.moyen,
      text: 'Quel film français a remporté la Palme d’Or 2013 ?'
      ,
      answers: ['La Vie d’Adèle', 'Amour', 'The Artist', 'Intouchables'],
      correctIndex: 0,
      explanation: 'La Vie d’Adèle a remporté la Palme d’Or 2013.',
    ),
    Question(
      category: Category.cinema,
      difficulty: Difficulty.difficile,
      text: 'Quel est le nom de l’IA dans « 2001 : l’Odyssée de l’espace » ?'
      ,
      answers: ['HAL 9000', 'GLaDOS', 'Skynet', 'Mother'],
      correctIndex: 0,
      explanation: 'HAL 9000 est l’ordinateur de bord du film.',
    ),
    Question(
      category: Category.cinema,
      difficulty: Difficulty.difficile,
      text: 'Quel film a popularisé la réplique « Voici Johnny ! » ?'
      ,
      answers: ['Shining', 'Psychose', 'Scarface', 'Taxi Driver'],
      correctIndex: 0,
      explanation: 'Jack Nicholson prononce cette réplique dans Shining.',
    ),
    Question(
      category: Category.cinema,
      difficulty: Difficulty.difficile,
      text: 'Dans Inception, quel est le totem de Cobb ?'
      ,
      answers: ['Une toupie', 'Un dé', 'Un pion d’échecs', 'Une pièce de monnaie'],
      correctIndex: 0,
      explanation: 'La toupie permet à Cobb de vérifier la réalité.',
    ),
    Question(
      category: Category.cinema,
      difficulty: Difficulty.difficile,
      text: 'Quelle série suit la famille Shelby à Birmingham ?'
      ,
      answers: ['Peaky Blinders', 'The Crown', 'Boardwalk Empire', 'Narcos'],
      correctIndex: 0,
      explanation: 'Peaky Blinders suit la famille Shelby.',
    ),
    Question(
      category: Category.cinema,
      difficulty: Difficulty.difficile,
      text: 'Quel studio japonais a produit « Le Voyage de Chihiro » ?'
      ,
      answers: ['Studio Ghibli', 'Toei Animation', 'Madhouse', 'Sunrise'],
      correctIndex: 0,
      explanation: 'Le film est réalisé par Hayao Miyazaki chez Ghibli.',
    ),
    // Technologie
    Question(
      category: Category.technologie,
      difficulty: Difficulty.facile,
      text: 'Que signifie USB ?'
      ,
      answers: ['Universal Serial Bus', 'Unified System Bus', 'Ultra Speed Bridge', 'User Service Band'],
      correctIndex: 0,
      explanation: 'USB signifie Universal Serial Bus.',
    ),
    Question(
      category: Category.technologie,
      difficulty: Difficulty.facile,
      text: 'Quel système d’exploitation mobile est développé par Google ?'
      ,
      answers: ['Android', 'iOS', 'Windows Phone', 'HarmonyOS'],
      correctIndex: 0,
      explanation: 'Android est l’OS mobile de Google.',
    ),
    Question(
      category: Category.technologie,
      difficulty: Difficulty.facile,
      text: 'Quel langage est principalement utilisé côté client sur le Web ?'
      ,
      answers: ['JavaScript', 'Python', 'C++', 'Ruby'],
      correctIndex: 0,
      explanation: 'JavaScript est exécuté dans le navigateur.',
    ),
    Question(
      category: Category.technologie,
      difficulty: Difficulty.facile,
      text: 'Quelle entreprise fabrique l’iPhone ?'
      ,
      answers: ['Apple', 'Samsung', 'Google', 'Huawei'],
      correctIndex: 0,
      explanation: 'Apple conçoit l’iPhone depuis 2007.',
    ),
    Question(
      category: Category.technologie,
      difficulty: Difficulty.facile,
      text: 'Que signifie HTML ?'
      ,
      answers: ['HyperText Markup Language', 'High Transfer Machine Language', 'Hyperlink Text Mode Layer', 'Hybrid Tool Markup Language'],
      correctIndex: 0,
      explanation: 'HTML est le langage de balisage du Web.',
    ),
    Question(
      category: Category.technologie,
      difficulty: Difficulty.moyen,
      text: 'Quel protocole sécurise les sites web en HTTPS ?'
      ,
      answers: ['TLS', 'FTP', 'SMTP', 'IMAP'],
      correctIndex: 0,
      explanation: 'HTTPS repose sur TLS pour chiffrer les échanges.',
    ),
    Question(
      category: Category.technologie,
      difficulty: Difficulty.moyen,
      text: 'Quel langage est utilisé pour développer avec Flutter ?'
      ,
      answers: ['Dart', 'Kotlin', 'Swift', 'TypeScript'],
      correctIndex: 0,
      explanation: 'Flutter utilise le langage Dart.',
    ),
    Question(
      category: Category.technologie,
      difficulty: Difficulty.moyen,
      text: 'Qui est l’un des cofondateurs de Microsoft ?'
      ,
      answers: ['Bill Gates', 'Steve Jobs', 'Larry Page', 'Mark Zuckerberg'],
      correctIndex: 0,
      explanation: 'Bill Gates a cofondé Microsoft avec Paul Allen.',
    ),
    Question(
      category: Category.technologie,
      difficulty: Difficulty.moyen,
      text: 'Quel est l’avantage principal d’un SSD par rapport à un HDD ?'
      ,
      answers: ['La vitesse', 'Le prix', 'La capacité', 'La chaleur'],
      correctIndex: 0,
      explanation: 'Les SSD sont beaucoup plus rapides que les disques durs.',
    ),
    Question(
      category: Category.technologie,
      difficulty: Difficulty.moyen,
      text: 'Quel protocole permet de récupérer des pages web ?'
      ,
      answers: ['HTTP', 'SMTP', 'SSH', 'SNMP'],
      correctIndex: 0,
      explanation: 'HTTP est le protocole du Web.',
    ),
    Question(
      category: Category.technologie,
      difficulty: Difficulty.difficile,
      text: 'Quel est le port par défaut utilisé par HTTPS ?'
      ,
      answers: ['443', '80', '21', '25'],
      correctIndex: 0,
      explanation: 'HTTPS utilise le port 443.',
    ),
    Question(
      category: Category.technologie,
      difficulty: Difficulty.difficile,
      text: 'Qui est le créateur de Linux ?'
      ,
      answers: ['Linus Torvalds', 'Dennis Ritchie', 'Ken Thompson', 'Bjarne Stroustrup'],
      correctIndex: 0,
      explanation: 'Linus Torvalds a lancé le kernel Linux en 1991.',
    ),
    Question(
      category: Category.technologie,
      difficulty: Difficulty.difficile,
      text: 'Que signifie GPU ?'
      ,
      answers: ['Graphics Processing Unit', 'General Processing Utility', 'Graphic Performance Unit', 'Global Processing Unit'],
      correctIndex: 0,
      explanation: 'Un GPU est un processeur graphique.',
    ),
    Question(
      category: Category.technologie,
      difficulty: Difficulty.difficile,
      text: 'Quel langage a été créé par Guido van Rossum ?'
      ,
      answers: ['Python', 'Ruby', 'PHP', 'Go'],
      correctIndex: 0,
      explanation: 'Guido van Rossum a créé Python en 1991.',
    ),
    Question(
      category: Category.technologie,
      difficulty: Difficulty.difficile,
      text: 'Quel algorithme de chiffrement asymétrique repose sur la factorisation ?'
      ,
      answers: ['RSA', 'AES', 'Blowfish', 'SHA-256'],
      correctIndex: 0,
      explanation: 'RSA se base sur la factorisation de grands nombres.',
    ),
    // Insolite
    Question(
      category: Category.insolite,
      difficulty: Difficulty.facile,
      text: 'Quel animal peut dormir debout ?'
      ,
      answers: ['Le cheval', 'Le dauphin', 'Le paresseux', 'Le kangourou'],
      correctIndex: 0,
      explanation: 'Les chevaux peuvent dormir debout grâce à leur musculature.',
    ),
    Question(
      category: Category.insolite,
      difficulty: Difficulty.facile,
      text: 'Quel est le seul mammifère capable de voler ?'
      ,
      answers: ['La chauve-souris', 'Le castor', 'Le chat', 'Le colibri'],
      correctIndex: 0,
      explanation: 'La chauve-souris est le seul mammifère volant.',
    ),
    Question(
      category: Category.insolite,
      difficulty: Difficulty.facile,
      text: 'Combien de cœurs a une pieuvre ?'
      ,
      answers: ['3', '1', '2', '4'],
      correctIndex: 0,
      explanation: 'La pieuvre possède trois cœurs.',
    ),
    Question(
      category: Category.insolite,
      difficulty: Difficulty.facile,
      text: 'Quel fruit est techniquement une baie ?'
      ,
      answers: ['La banane', 'La fraise', 'La cerise', 'La pomme'],
      correctIndex: 0,
      explanation: 'Botaniquement, la banane est une baie.',
    ),
    Question(
      category: Category.insolite,
      difficulty: Difficulty.facile,
      text: 'Quel est l’animal terrestre le plus rapide ?'
      ,
      answers: ['Le guépard', 'Le lion', 'L’antilope', 'Le cheval'],
      correctIndex: 0,
      explanation: 'Le guépard peut dépasser 100 km/h.',
    ),
    Question(
      category: Category.insolite,
      difficulty: Difficulty.moyen,
      text: 'Quelle planète a la journée la plus longue ?'
      ,
      answers: ['Vénus', 'Mars', 'Jupiter', 'Mercure'],
      correctIndex: 0,
      explanation: 'Vénus a une rotation très lente.',
    ),
    Question(
      category: Category.insolite,
      difficulty: Difficulty.moyen,
      text: 'Quel pays possède le plus de fuseaux horaires ?'
      ,
      answers: ['La France', 'La Russie', 'Les États-Unis', 'Le Canada'],
      correctIndex: 0,
      explanation: 'Avec ses territoires d’outre-mer, la France en compte 12.',
    ),
    Question(
      category: Category.insolite,
      difficulty: Difficulty.moyen,
      text: 'Quel est le plus petit os du corps humain ?'
      ,
      answers: ['L’étrier', 'Le fémur', 'La rotule', 'Le cubitus'],
      correctIndex: 0,
      explanation: 'L’étrier se situe dans l’oreille moyenne.',
    ),
    Question(
      category: Category.insolite,
      difficulty: Difficulty.moyen,
      text: 'Quel est l’animal national de l’Écosse ?'
      ,
      answers: ['La licorne', 'Le lion', 'L’aigle', 'Le cerf'],
      correctIndex: 0,
      explanation: 'La licorne est l’emblème national de l’Écosse.',
    ),
    Question(
      category: Category.insolite,
      difficulty: Difficulty.moyen,
      text: 'Quel métal est liquide à température ambiante ?'
      ,
      answers: ['Le mercure', 'Le fer', 'Le cuivre', 'L’aluminium'],
      correctIndex: 0,
      explanation: 'Le mercure est liquide vers 20°C.',
    ),
    Question(
      category: Category.insolite,
      difficulty: Difficulty.difficile,
      text: 'Quel est le seul continent sans désert ?'
      ,
      answers: ['L’Europe', 'L’Afrique', 'L’Australie', 'L’Amérique du Sud'],
      correctIndex: 0,
      explanation: 'L’Europe est le seul continent sans désert reconnu.',
    ),
    Question(
      category: Category.insolite,
      difficulty: Difficulty.difficile,
      text: 'Quelle langue est officielle au Paraguay en plus de l’espagnol ?'
      ,
      answers: ['Le guarani', 'Le quechua', 'Le nahuatl', 'Le mapudungun'],
      correctIndex: 0,
      explanation: 'Le guarani est co-officiel au Paraguay.',
    ),
    Question(
      category: Category.insolite,
      difficulty: Difficulty.difficile,
      text: 'Quel est le point le plus profond des océans ?'
      ,
      answers: ['La fosse des Mariannes', 'La fosse des Tonga', 'La fosse des Kouriles', 'La fosse de Java'],
      correctIndex: 0,
      explanation: 'Le Challenger Deep est le point le plus profond.',
    ),
    Question(
      category: Category.insolite,
      difficulty: Difficulty.difficile,
      text: 'Quelle est la plus grande île du monde hors continents ?'
      ,
      answers: ['Le Groenland', 'Madagascar', 'Bornéo', 'Sumatra'],
      correctIndex: 0,
      explanation: 'Le Groenland est la plus grande île du monde.',
    ),
    Question(
      category: Category.insolite,
      difficulty: Difficulty.difficile,
      text: 'Quel insecte peut marcher sur l’eau grâce à la tension superficielle ?'
      ,
      answers: ['Le gerris', 'La libellule', 'La coccinelle', 'Le moustique'],
      correctIndex: 0,
      explanation: 'Le gerris est surnommé patineur d’eau.',
    ),
  ];
}
