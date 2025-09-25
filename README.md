# analyse-charges-assurance_suite
Analyse des charges d’assurance selon le sexe, le tabagisme, le BMI et la région à l’aide de SQL.
# 🧠 Analyse SQL & Python des charges d’assurance santé

Ce projet explore les facteurs influençant les charges d’assurance santé à partir d’un jeu de données anonymisé. L’objectif est de comprendre comment des variables comme le sexe, le statut de fumeur, l’IMC (Indice de Masse Corporelle) et la région géographique affectent les frais médicaux annuels des assurés.

---

🎯 Titre du projet  
Analyse des charges d’assurance santé selon les profils démographiques et comportementaux

---

📌 Contexte & Objectif

Les assureurs doivent anticiper les coûts liés aux profils de leurs clients.  
À travers ce projet, j’ai analysé un jeu de données issu du secteur de l’assurance santé pour identifier les groupes les plus coûteux et comprendre les corrélations entre les caractéristiques individuelles et les charges médicales.

---

📊 Méthodologie

- Source des données : `insurance.csv` (Kaggle)
- Langages & outils :
  - SQL : agrégation et segmentation des données
  
- Variables étudiées :
  - Sexe (`sex`)
  - Statut de fumeur (`smoker`)
  - IMC (`bmi`)
  - Région (`region`)
- Étapes clés :
  1. Nettoyage et validation des données
  2. Groupement par catégories (ex. fumeur/non-fumeur, IMC par seuils, sexe)
  3. Calcul des moyennes de charges par groupe
  4. Visualisation des écarts et tendances

---

📊 Résultats par variable

🔸 IMC (Indice de Masse Corporelle)

| Catégorie IMC              | Moyenne des charges ($) | Effectif |
|----------------------------|--------------------------|----------|
| < 18,5                     | 8 852,20                 | Faible   |
| 18,5–24,9                  | 10 409,94                | Élevé    |
| 25–29,9                    | 10 661,68                | Élevé    |
| 30–34,9                    | 14 419,67                | Moyen    |
| 35–39,9                    | 17 022,26                | Faible   |
| ≥ 40                      | 20 234,41                | Très faible |

> 📈 Corrélation positive entre l’IMC et les charges.  
> 📉 Légère baisse dans la dernière catégorie (IMC ≥ 40), probablement liée à un **effectif réduit** ou à une **couverture différente**.

---

🔸 Âge

| Tranche d’âge        | Moyenne des charges ($) | Effectif |
|----------------------|--------------------------|----------|
| 18–25 (Jeunes adultes)   | 9 087,02                 | 306      |
| 26–35 (Adultes)          | 10 495,16                | 268      |
| 36–45 (Adultes matures)  | 13 493,49                | 264      |
| 46–60 (Pré-retraités)    | 16 340,99                | 409      |
| 61+ (Retraités)          | 21 063,16                | 91       |

> 📈 Les charges augmentent de manière constante avec l’âge.  
> 📉 Le nombre d’assurés diminue fortement chez les retraités, ce qui peut influencer la moyenne.

---

🔸 Statut de fumeur

| Fumeur | Moyenne des charges ($) | Effectif |
|--------|--------------------------|----------|
| Oui    | 32 050,23                | 274      |
| Non    | 8 434,27                 | 1 064    |

> 🚬 Les fumeurs ont des charges **près de 4 fois plus élevées** que les non-fumeurs.  
> Cela reflète une **prévalence accrue de pathologies chroniques**, des **consultations plus fréquentes**, et des **traitements plus coûteux**.

---

### 🔸 Région

| Région      | Moyenne des charges ($) | Effectif |
|-------------|--------------------------|----------|
| Southeast   | 14 735,41                | 364      |
| Northeast   | 13 406,36                | 324      |
| Northwest   | 12 417,58                | 325      |
| Southwest   | 12 346,94                | 325      |

> 🌍 Les différences régionales sont présentes mais **non significatives**.  
> L’analyse ne permet pas de conclure à une évolution systématique des charges selon la région.

---

💼 Implications métier

- **Tarification différenciée** selon les profils à risque (âge, IMC, tabagisme)
- **Segmentation client** pour adapter les produits d’assurance
- **Prévention ciblée** pour réduire les charges dans les groupes les plus exposés
- **Optimisation des primes** grâce à une approche data-driven

---

## 💡 Enseignements clés

- Le **statut de fumeur** est le facteur le plus impactant sur les charges.
- L’**IMC** et l’**âge** montrent une corrélation progressive avec les frais médicaux.
- Les **retraités** et les individus en **obésité sévère** représentent les segments les plus coûteux.
- Une analyse croisée permet d’identifier les **profils à très haut risque financier**.

---

## 🔜 Prochaines étapes

Je développe actuellement un **simulateur de prime dynamique** basé sur :
- L’âge
- L’IMC
- Le statut de fumeur
- La région

Objectif : proposer un outil prédictif pour estimer les charges et ajuster les primes en temps réel.

---

👨‍💻 Auteur

Joël MBASSI  
Passionné par la data science, l’analyse statistique et la modélisation des risques en assurance santé.  
📍 Québec, Canada  
🔗 [Mon profil LinkedIn]([https://www.linkedin.com/in/ton-nom-utilisateur](https://www.linkedin.com/in/jo%C3%ABl-mbassi-a70140183?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app))

---

## 📜 Licence

Ce projet est publié sous licence **MIT** — libre d’utilisation, de modification et de diffusion avec attribution.

## 📜 Licence

Ce projet est publié sous licence **MIT** — libre d’utilisation, de modification et de diffusion avec attribution.
