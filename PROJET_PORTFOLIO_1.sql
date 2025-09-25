use test 
select*from insurance


select avg(charges) as moy_charge, age from insurance 
group by age
order by age

---------------------------------------EFFECTIFS ET CHARGES MOYENNES PAR BMI---------------------------------------------------------------

-- CHARGE MOYENNE POUR BMI < 18,5
select 'bmi < 18.5' as bmi_accru, round(avg(charges),2) as moy_charges from insurance
where bmi < 18.5
-- EFFECTIFS POUR BMI COMPRIS INFERIEUR À 18,5
select '18.5 < bmi' as bmi_accru, count(*) as Effectif_categoriel from insurance
where bmi < 18.5 


-- CHARGE MOYENNE POUR BMI COMPRIS ENTRE 18,5 ET 24,9
select '18,5 < bmi < 24,9' as bmi_moindre, round(avg(charges),2) as moy_charges from insurance
where bmi >= 18.5 and bmi < 25
-- EFFECTIFS POUR BMI COMPRIS ENTRE 18,5 ET 24,9
select '18.5 < bmi < 24,9' as bmi_moindre, count(*) as Effectif_categoriel from insurance
where bmi >= 18.5 and bmi < 25


-- CHARGE MOYENNE POUR BMI COMPRIS ENTRE 25 ET 29,9
select '25 < bmi < 29,9' as bmi_accru_élevé, round(avg(charges),2) as moy_charges from insurance
where bmi >= 25 and bmi < 30
-- EFFECTIFS POUR BMI COMPRIS ENTRE 25 ET 29,9
select '25 < bmi < 29,9' as bmi_accru_élevé, count(*) as Effectif_categoriel from insurance
where bmi >= 25 and bmi < 30


-- CHARGE MOYENNE POUR BMI COMPRIS ENTRE 30 ET 34,9
select '30 < bmi < 34.9' as bmi_élevé, round(avg(charges),2) as moy_charges from insurance
where bmi >= 30 and bmi < 35
-- EFFECTIFS POUR BMI COMPRIS ENTRE 30 ET 34,9
select '30 < bmi < 34.9' as bmi_élevé, count(*) as Effectif_categoriel from insurance
where bmi >= 30 and bmi < 35


-- CHARGE MOYENNE POUR BMI COMPRIS ENTRE 35 ET 39,9
select '35 < bmi < 39,9' as bmi_très_élevé, round(avg(charges),2) as moy_charges from insurance
where bmi >= 35 and bmi < 40
-- EFFECTIFS POUR BMI COMPRIS ENTRE 35 ET 39,9
select '35 < bmi < 39,9' as bmi_très_élevé, count(*) as Effectif_categoriel from insurance
where bmi >= 35 and bmi < 40


-- CHARGE MOYENNE POUR BMI COMPRIS SUPERIEUR OU EGAL À 40
select 'bmi > 40' as bmi_extrêmement_élevé, round(avg(charges),2) as moy_charges from insurance
where bmi >= 40
-- EFFECTIFS POUR BMI COMPRIS SUPERIEUR OU EGAL À 40
select 'bmi > 40' as bmi_extrêmement_élevé, count(*) as Effectif_categoriel from insurance
where bmi >= 40




-- Ce regroupement nous permet de mettre en évidence une correlation positive entre l’IMC et les charges : plus l’IMC est élevé, plus les frais médicaux moyens augmentent.
-- On constate une légère baisse dans la dernière catégorie (IMC > 40), ce qui peut s’expliquer par :
	-- Moins d’individus dans cette tranche (échantillon plus petit)
	-- Accès limité aux soins ou couverture différente
	-- Nous pouvons vérifier la première hypothèse en faisant un comparatif entre les effectifs de toutes les catégories de IMC
-- On peut également voir que l'augmentation entre les catégories bmi moindre et accru (25 < bmi < 29,9) n'est pas très grande
	-- on pourrait l'expliquer également par un écart en effectif non négligeable entre ces deux catégories comme le montreront les décomptes suivants







---------------------------------------CHARGES MOYENNES ET EFFECTIFS PAR AGE---------------------------------------------------------------
select '18 < age < 25' as Jeunes_adultes, round(avg(charges),2) as moy_charges from insurance
where age >= 18 and age <=25


select '26 < age < 35' as Adultes, round(avg(charges),2) as moy_charges from insurance
where age >= 26 and age <=35


select '36 < age < 45' as Adultes_matures, round(avg(charges),2) as moy_charges from insurance
where age >= 36 and age <=45


select '46 < age < 60' as Pré_retraités, round(avg(charges),2) as moy_charges from insurance
where age >= 46 and age <=60


select 'age < 61' as Retraités, round(avg(charges),2) as moy_charges from insurance
where age >= 61


-- On constate une augmentation constante des charges moyennes avec l'évolution de l'age.
-- Cela reflète une corrélation directe entre l’âge et les besoins médicaux : 
-- plus l’âge augmente, plus les frais liés aux soins, aux traitements spécialisés et aux pathologies chroniques s’intensifient



select '18 < age < 25' as Jeunes_adultes, count(*) as Effectif_categoriel from insurance
where age >= 18 and age<=25

select '26 < age < 35' as Adultes, count(*) as Effectif_categoriel from insurance
where age >= 26 and age<= 35

select '36 < age < 45' as Adultes_matures, count(*) as Effectif_categoriel from insurance
where age >= 36 and age<= 45

select '46 < age < 60' as Pré_retraités, count(*) as Effectif_categoriel from insurance
where age >= 46 and age<= 60

select 'age < 61' as Retraités, count(*) as Effectif_categoriel from insurance
where age >= 61

-- La manoeuvre effectuée nous permet aussi de constater une diminution nette du nombre d'assurés appartenant à la catégorie des retraités
-- comparativement aux pré-retraités



---------------------------------------CHARGES MOYENNES ET EFFECTIFS PAR REGION---------------------------------------------------------------
-- CHARGES MOYENNES
select region, round(avg(charges),2) as moy_charges from insurance
group by region
order by moy_charges desc

-- EFFECTIFS
select region, count (*) as Effectif_region from insurance
group by region
order by Effectif_region desc

-- L'exploitation de ce jeu de données ne permet pas de commenter une évolution particulière des charges moyennes en fonction des régions



---------------------------------------CHARGES MOYENNES ET EFFECTIFS POUR FUMEURS ET NON FUMEURS--------------------------------------------------------
-- CHARGES MOYENNES
select smoker as 'Cigarette?', round(avg(charges),2) as moy_charges from insurance
group by smoker

-- EFFECTIFS
select smoker as 'Cigarette?', count (*) as Effectif_Cigarette from insurance
group by smoker

--Les fumeurs ont des charges près de 4 fois plus élevées que les non-fumeurs. Bien que les fumeurs soient moins nombreux (274 contre 1 064), leur coût moyen est massivement supérieur.
-- Cela reflète :
	-- Une prévalence accrue de maladies chroniques (cardiovasculaires, respiratoires, cancers)
	-- Des consultations médicales plus fréquentes
	-- Des traitements plus coûteux liés au tabagisme

-- Implications métier :
	-- Les fumeurs devraient faire l’objet de tarification différenciée.
	-- Des programmes de sevrage tabagique peuvent réduire les charges à long terme.
	-- Le tabagisme est un levier stratégique pour la prévention et la gestion des coûts.





---------------------------------------CHARGES MOYENNES ET EFFECTIFS PAR SEXE--------------------------------------------------------
select sex as Sexe, round(avg(charges),2) as moy_charges from insurance
group by sex

select sex as Sexe, count (*) as Effectif_sexe from insurance
group by sex

-- Selon nous le sexe ne se révèle pas comme une variable ayant un impact sur les charges d'assurance



---------------------------------------CHARGES MOYENNES ET EFFECTIFS PAR NOMBRE D'ENFANTS--------------------------------------------------------
select children as Nbre_enfants, round(avg(charges),2) as moy_charges from insurance
group by children
order by children desc

-- 	Les charges augmentent jusqu’à 3 enfants, ce qui peut refléter une hausse des besoins médicaux dans les familles plus nombreuses.
-- À partir de 4 enfants, les charges diminuent, et pour 5 enfants, elles chutent fortement.
-- Cette baisse peut s’expliquer par :
	-- Des polices d’assurance familiales plafonnées
	-- Des effets de mutualisation ou de réduction de couverture individuelle
	-- Une sous-utilisation des services dans les familles très nombreuses

-- Le nombre d’enfants influence les charges, mais pas de manière linéaire.
-- Les familles avec 2 ou 3 enfants semblent représenter le pic de dépenses, tandis que les familles très nombreuses pourraient bénéficier de modèles de tarification différents