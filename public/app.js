const DATASET = {
  culture: [
    {
      question: "Quelle est la capitale du Canada ?",
      options: ["Ottawa", "Toronto", "Montréal", "Vancouver"],
      answer: 0,
      difficulty: "Facile",
      explanation: "Ottawa est la capitale politique du Canada, située dans la province de l'Ontario."
    },
    {
      question: "Quel peintre est associé à la Joconde ?",
      options: ["Michel-Ange", "Léonard de Vinci", "Raphaël", "Botticelli"],
      answer: 1,
      difficulty: "Facile",
      explanation: "Léonard de Vinci a peint la Joconde au début du XVIe siècle."
    },
    {
      question: "Quel élément chimique a pour symbole Fe ?",
      options: ["Fluor", "Fer", "Fermium", "Francium"],
      answer: 1,
      difficulty: "Facile",
      explanation: "Fe vient du latin ferrum, qui signifie fer."
    },
    {
      question: "En quelle année est tombé le mur de Berlin ?",
      options: ["1985", "1989", "1991", "1995"],
      answer: 1,
      difficulty: "Moyen",
      explanation: "Le 9 novembre 1989 marque l'ouverture du mur de Berlin."
    },
    {
      question: "Quel est le plus grand océan du monde ?",
      options: ["Atlantique", "Arctique", "Pacifique", "Indien"],
      answer: 2,
      difficulty: "Facile",
      explanation: "Le Pacifique couvre environ un tiers de la surface du globe."
    },
    {
      question: "Quel écrivain a créé le personnage de Sherlock Holmes ?",
      options: ["Agatha Christie", "Arthur Conan Doyle", "Jules Verne", "Victor Hugo"],
      answer: 1,
      difficulty: "Moyen",
      explanation: "Arthur Conan Doyle a publié les premières aventures en 1887."
    },
    {
      question: "Quelle planète est surnommée la planète rouge ?",
      options: ["Mars", "Vénus", "Jupiter", "Mercure"],
      answer: 0,
      difficulty: "Facile",
      explanation: "Mars doit sa couleur rouge à l'oxyde de fer présent sur sa surface."
    },
    {
      question: "Quel est le roman de Victor Hugo publié en 1862 ?",
      options: ["Notre-Dame de Paris", "Les Misérables", "Germinal", "Bel-Ami"],
      answer: 1,
      difficulty: "Moyen",
      explanation: "Les Misérables raconte la trajectoire de Jean Valjean."
    },
    {
      question: "Combien de continents compte la Terre ?",
      options: ["5", "6", "7", "8"],
      answer: 2,
      difficulty: "Facile",
      explanation: "On compte généralement 7 continents : Afrique, Amériques, Asie, Europe, Océanie, Antarctique."
    },
    {
      question: "Quel pays a remporté la Coupe du monde de football 2018 ?",
      options: ["Allemagne", "Brésil", "France", "Argentine"],
      answer: 2,
      difficulty: "Moyen",
      explanation: "La France a remporté la Coupe du monde 2018 en Russie."
    }
  ],
  sport: [
    {
      question: "Combien de joueurs composent une équipe de basket sur le terrain ?",
      options: ["4", "5", "6", "7"],
      answer: 1,
      difficulty: "Facile",
      explanation: "Chaque équipe joue à 5 contre 5 sur le terrain."
    },
    {
      question: "Quel pays a inventé le judo ?",
      options: ["Chine", "Corée", "Japon", "Thaïlande"],
      answer: 2,
      difficulty: "Facile",
      explanation: "Le judo a été créé au Japon par Jigoro Kano."
    },
    {
      question: "Combien de tours comporte un Grand Prix de Formule 1 ?",
      options: ["Environ 20", "Environ 50", "Environ 70", "Environ 100"],
      answer: 2,
      difficulty: "Moyen",
      explanation: "Un Grand Prix compte généralement autour de 60 à 70 tours selon le circuit."
    },
    {
      question: "Quel pays a remporté le plus de Coupes du monde de football ?",
      options: ["Allemagne", "Italie", "Brésil", "Argentine"],
      answer: 2,
      difficulty: "Moyen",
      explanation: "Le Brésil compte 5 titres de champion du monde."
    },
    {
      question: "Combien y a-t-il de trous dans un parcours de golf standard ?",
      options: ["9", "12", "18", "24"],
      answer: 2,
      difficulty: "Facile",
      explanation: "Un parcours standard comporte 18 trous."
    },
    {
      question: "Quelle distance mesure un marathon ?",
      options: ["21,1 km", "42,195 km", "50 km", "100 km"],
      answer: 1,
      difficulty: "Moyen",
      explanation: "La distance officielle d'un marathon est de 42,195 km."
    },
    {
      question: "Dans quel sport utilise-t-on un volant ?",
      options: ["Badminton", "Tennis", "Squash", "Paddle"],
      answer: 0,
      difficulty: "Facile",
      explanation: "Le volant est spécifique au badminton."
    },
    {
      question: "Quel est le surnom de l'équipe de France de rugby ?",
      options: ["Les Bleus", "Les Coqs", "Les Tricolores", "Les Mousquetaires"],
      answer: 1,
      difficulty: "Moyen",
      explanation: "L'équipe est surnommée le XV de France ou les Coqs."
    },
    {
      question: "Combien de points vaut un tir à trois points au basket ?",
      options: ["2", "3", "4", "5"],
      answer: 1,
      difficulty: "Facile",
      explanation: "Le tir derrière l'arc vaut 3 points."
    },
    {
      question: "Dans quel pays se déroule le Tour de France ?",
      options: ["Italie", "Espagne", "France", "Belgique"],
      answer: 2,
      difficulty: "Facile",
      explanation: "Le Tour de France traverse les régions françaises chaque été."
    }
  ],
  insolite: [
    {
      question: "Quel animal peut dormir debout ?",
      options: ["Girafe", "Cheval", "Koala", "Chat"],
      answer: 1,
      difficulty: "Facile",
      explanation: "Le cheval peut dormir debout grâce à un système de verrouillage des membres."
    },
    {
      question: "Quelle ville possède des canaux surnommés les \"grachten\" ?",
      options: ["Venise", "Amsterdam", "Copenhague", "Bruges"],
      answer: 1,
      difficulty: "Moyen",
      explanation: "Amsterdam est célèbre pour ses canaux appelés grachten."
    },
    {
      question: "Quel fruit flotte toujours dans l'eau ?",
      options: ["Pomme", "Orange", "Banane", "Raisin"],
      answer: 0,
      difficulty: "Facile",
      explanation: "La pomme flotte grâce à sa densité inférieure à celle de l'eau."
    },
    {
      question: "Quel animal a un cœur situé dans sa tête ?",
      options: ["Crevette", "Étoile de mer", "Escargot", "Dauphin"],
      answer: 0,
      difficulty: "Moyen",
      explanation: "Chez la crevette, le cœur est situé dans la tête."
    },
    {
      question: "Quelle est la longueur approximative de la Grande Muraille de Chine ?",
      options: ["2 000 km", "6 000 km", "21 000 km", "40 000 km"],
      answer: 2,
      difficulty: "Difficile",
      explanation: "Les relevés modernes estiment la longueur totale à plus de 21 000 km."
    },
    {
      question: "Quel est le nom de la peur des plantes ?",
      options: ["Botanophobie", "Herbophobie", "Phyllophobie", "Floraphobie"],
      answer: 2,
      difficulty: "Difficile",
      explanation: "La phyllophobie désigne la peur irrationnelle des feuilles ou des plantes."
    },
    {
      question: "Quel pays possède la ville de la \"porte du paradis\" (Heaven's Gate) ?",
      options: ["Chine", "Mexique", "Nouvelle-Zélande", "Norvège"],
      answer: 0,
      difficulty: "Difficile",
      explanation: "Heaven's Gate se trouve au parc national de Zhangjiajie en Chine."
    },
    {
      question: "Quel insecte peut soulever jusqu'à 50 fois son poids ?",
      options: ["Fourmi", "Libellule", "Coccinelle", "Sauterelle"],
      answer: 0,
      difficulty: "Moyen",
      explanation: "Les fourmis sont réputées pour leur force proportionnelle."
    },
    {
      question: "Quel océan contient le triangle des Bermudes ?",
      options: ["Pacifique", "Atlantique", "Indien", "Arctique"],
      answer: 1,
      difficulty: "Facile",
      explanation: "Le triangle des Bermudes se situe dans l'océan Atlantique nord."
    },
    {
      question: "Quelle ville est construite sur 118 îlots ?",
      options: ["Venise", "Stockholm", "Hambourg", "Lisbonne"],
      answer: 1,
      difficulty: "Moyen",
      explanation: "Stockholm est souvent appelée la \"Venise du Nord\" avec ses 118 îlots."
    }
  ],
  maman: [
    {
      question: "Quel est le nombre moyen de câlins qu'une maman distribue par jour ?",
      options: ["5", "10", "15", "20"],
      answer: 2,
      difficulty: "Facile",
      explanation: "Ce chiffre est symbolique : l'important, c'est la dose d'affection !"
    },
    {
      question: "Quelle astuce anti-stress les mamans citent le plus ?",
      options: ["Respirer profondément", "Courir", "Dessiner", "Cuisiner"],
      answer: 0,
      difficulty: "Facile",
      explanation: "La respiration profonde est un réflexe efficace et rapide."
    },
    {
      question: "Quel aliment est souvent présenté comme l'allié des mamans pressées ?",
      options: ["Pâtes", "Salade", "Soupe", "Couscous"],
      answer: 0,
      difficulty: "Facile",
      explanation: "Les pâtes sont rapides à préparer et déclinables à l'infini."
    },
    {
      question: "Quelle compétence la plupart des mamans développent rapidement ?",
      options: ["Organisation", "Spéléologie", "Comptabilité", "Pilotage"],
      answer: 0,
      difficulty: "Moyen",
      explanation: "L'organisation devient un super-pouvoir du quotidien."
    },
    {
      question: "Quelle phrase est la plus répétée par les mamans ?",
      options: ["On se lave les mains", "On met le feu", "On démarre", "On oublie"],
      answer: 0,
      difficulty: "Facile",
      explanation: "Le rituel du lavage de mains est incontournable !"
    },
    {
      question: "Quel objet ne quitte jamais le sac d'une maman ?",
      options: ["Stylo", "Mouchoirs", "Câble USB", "Boussole"],
      answer: 1,
      difficulty: "Moyen",
      explanation: "Les mouchoirs sont l'outil multifonction par excellence."
    },
    {
      question: "Quel est le super-héros préféré des enfants selon les mamans ?",
      options: ["Maman", "Batman", "Spiderman", "Iron Man"],
      answer: 0,
      difficulty: "Facile",
      explanation: "Dans ce quiz, les mamans sont nos héroïnes !"
    },
    {
      question: "Quelle activité est idéale pour créer un moment calme ?",
      options: ["Lecture", "Course", "Concert", "Bricolage bruyant"],
      answer: 0,
      difficulty: "Moyen",
      explanation: "La lecture est parfaite pour se recentrer en douceur."
    },
    {
      question: "Quel mantra aide les mamans à tenir le cap ?",
      options: ["Tout ira bien", "Jamais", "Plus tard", "Pourquoi"],
      answer: 0,
      difficulty: "Moyen",
      explanation: "Répéter \"tout ira bien\" aide à garder confiance."
    },
    {
      question: "Quelle petite victoire rend fière une maman ?",
      options: ["Un sourire", "Un orage", "Un oubli", "Un retard"],
      answer: 0,
      difficulty: "Facile",
      explanation: "Les sourires sont des récompenses du quotidien."
    }
  ]
};

const screens = {
  categories: document.getElementById("screen-categories"),
  quiz: document.getElementById("screen-quiz"),
  explanation: document.getElementById("screen-explanation"),
  results: document.getElementById("screen-results")
};

const startButton = document.getElementById("start-quiz");
const categoryButtons = document.querySelectorAll(".category-card");
const pillGroups = document.querySelectorAll(".pill-group");
const hint = document.querySelector(".hint");

const questionText = document.getElementById("question-text");
const answersContainer = document.getElementById("answers");
const progression = document.getElementById("progression");
const scoreDisplay = document.getElementById("score");
const timerPanel = document.getElementById("timer-panel");
const timerDisplay = document.getElementById("timer");
const metaCategory = document.getElementById("meta-category");
const metaDifficulty = document.getElementById("meta-difficulty");

const explanationText = document.getElementById("explanation-text");
const nextButton = document.getElementById("next-question");

const finalScore = document.getElementById("final-score");
const bestScore = document.getElementById("best-score");
const replayButton = document.getElementById("replay");
const changeCategoryButton = document.getElementById("change-category");

const state = {
  category: null,
  count: 5,
  difficulty: "Facile",
  mode: "Classique",
  questions: [],
  currentIndex: 0,
  score: 0,
  timerId: null,
  remaining: 15
};

const answerLabels = ["A", "B", "C", "D"];

function showScreen(target) {
  Object.values(screens).forEach((screen) => screen.classList.remove("screen--active"));
  screens[target].classList.add("screen--active");
}

function shuffle(items) {
  return [...items].sort(() => Math.random() - 0.5);
}

function updateStartButton() {
  if (state.category) {
    startButton.disabled = false;
    hint.textContent = "Prêt ? Lancez le quiz !";
  } else {
    startButton.disabled = true;
    hint.textContent = "Sélectionnez une catégorie pour commencer.";
  }
}

function setActive(buttons, selected) {
  buttons.forEach((btn) => btn.classList.toggle("is-active", btn === selected));
}

function selectCategory(event) {
  const button = event.currentTarget;
  state.category = button.dataset.category;
  setActive(categoryButtons, button);
  updateStartButton();
}

function selectPill(event) {
  const button = event.currentTarget;
  const group = button.closest(".pill-group");
  const setting = group.dataset.setting;
  setActive(group.querySelectorAll(".pill"), button);
  state[setting] = button.dataset.value;
}

function buildQuestions() {
  const base = DATASET[state.category] || [];
  let filtered = base;
  if (state.difficulty !== "Mix") {
    filtered = base.filter((item) => item.difficulty === state.difficulty);
  }
  if (filtered.length < state.count) {
    filtered = base;
  }
  const shuffled = shuffle(filtered);
  state.questions = shuffled.slice(0, Math.min(state.count, shuffled.length));
  state.currentIndex = 0;
  state.score = 0;
}

function startQuiz() {
  buildQuestions();
  metaCategory.textContent = getCategoryLabel(state.category);
  metaDifficulty.textContent = state.difficulty;
  showScreen("quiz");
  loadQuestion();
}

function getCategoryLabel(key) {
  const labels = {
    culture: "Culture générale",
    sport: "Sport",
    insolite: "Insolite",
    maman: "Maman"
  };
  return labels[key] || key;
}

function loadQuestion() {
  const question = state.questions[state.currentIndex];
  if (!question) {
    return showResults();
  }
  resetTimer();
  progression.textContent = `${state.currentIndex + 1}/${state.questions.length}`;
  scoreDisplay.textContent = state.score;
  questionText.textContent = question.question;
  answersContainer.innerHTML = "";

  question.options.forEach((option, index) => {
    const button = document.createElement("button");
    button.className = "answer";
    button.innerHTML = `<span>${answerLabels[index]}</span>${option}`;
    button.addEventListener("click", () => handleAnswer(index));
    answersContainer.appendChild(button);
  });

  if (state.mode === "Chrono") {
    timerPanel.classList.remove("hidden");
    startTimer();
  } else {
    timerPanel.classList.add("hidden");
  }
}

function startTimer() {
  state.remaining = 15;
  timerDisplay.textContent = state.remaining;
  state.timerId = setInterval(() => {
    state.remaining -= 1;
    timerDisplay.textContent = state.remaining;
    if (state.remaining <= 0) {
      clearInterval(state.timerId);
      handleAnswer(null, true);
    }
  }, 1000);
}

function resetTimer() {
  if (state.timerId) {
    clearInterval(state.timerId);
    state.timerId = null;
  }
}

function handleAnswer(selectedIndex, timedOut = false) {
  resetTimer();
  const question = state.questions[state.currentIndex];
  const answerButtons = answersContainer.querySelectorAll(".answer");
  const isCorrect = selectedIndex === question.answer;

  answerButtons.forEach((btn, index) => {
    btn.classList.add("disabled");
    if (index === question.answer) {
      btn.classList.add("correct");
    }
    if (selectedIndex !== null && index === selectedIndex && !isCorrect) {
      btn.classList.add("wrong");
    }
  });

  if (isCorrect) {
    state.score += 1;
  }

  if (timedOut) {
    explanationText.textContent = `Temps écoulé ! ${question.explanation}`;
  } else {
    explanationText.textContent = question.explanation;
  }

  setTimeout(() => {
    showScreen("explanation");
  }, 600);
}

function goToNextQuestion() {
  state.currentIndex += 1;
  if (state.currentIndex >= state.questions.length) {
    showResults();
  } else {
    showScreen("quiz");
    loadQuestion();
  }
}

function showResults() {
  resetTimer();
  showScreen("results");
  finalScore.textContent = `Score final : ${state.score}/${state.questions.length}`;
  const bestKey = `bestScore:${state.category}`;
  const storedBest = Number(localStorage.getItem(bestKey) || 0);
  if (state.score > storedBest) {
    localStorage.setItem(bestKey, state.score);
  }
  const updatedBest = Number(localStorage.getItem(bestKey) || 0);
  bestScore.textContent = `Meilleur score (${getCategoryLabel(state.category)}) : ${updatedBest}`;
}

function replayQuiz() {
  showScreen("quiz");
  buildQuestions();
  loadQuestion();
}

function changeCategory() {
  showScreen("categories");
}

categoryButtons.forEach((btn) => btn.addEventListener("click", selectCategory));

pillGroups.forEach((group) => {
  group.querySelectorAll(".pill").forEach((pill) => pill.addEventListener("click", selectPill));
});

startButton.addEventListener("click", startQuiz);
nextButton.addEventListener("click", goToNextQuestion);
replayButton.addEventListener("click", replayQuiz);
changeCategoryButton.addEventListener("click", changeCategory);

updateStartButton();
