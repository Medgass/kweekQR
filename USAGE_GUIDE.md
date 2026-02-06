# Guide d'Utilisation KweekQR

## ✅ Problème Résolu: URLs 404

**Avant:** Les URLs par défaut utilisaient `https://example.com` qui conduisaient à des erreurs 404

**Après:** Toutes les URLs utilisent des sites web réels et valides:
- https://www.google.com
- https://www.youtube.com
- https://www.amazon.com
- https://forms.google.com
- Et d'autres sites éprouvés

## 📌 Guide Complet

### 1. Sélectionner le Type de Contenu

En haut de l'écran, vous verrez 23 boutons représentant différents types de QR Code. Cliquez sur celui qui vous intéresse.

### 2. Entrer le Contenu

**Pour Website/Video/PDF:**
- Entrez simplement une URL valide
- L'URL par défaut (Google) fonctionne si vous ne changez rien

**Pour Text:**
- Entrez du texte libre
- Supporte plusieurs lignes

**Pour Wi-Fi:**
- Nom du réseau (SSID)
- Mot de passe
- Type de sécurité

**Pour Email:**
- Email destinataire
- Sujet
- Message

**Pour vCard:**
- Prénom et nom
- Email et téléphone
- Entreprise et titre

### 3. Personnaliser le Design

#### Couleurs
- Cliquez sur le carré pour ouvrir le sélecteur de couleur
- Ou entrez directement un code hex (#000000)

#### Forme
- 6 styles disponibles avec aperçus visuels
- Chaque style change l'apparence des "points" du QR

#### Cadre
- 8 styles différents pour encadrer votre QR code
- Texte personnalisable dans le cadre

#### Fond Transparent
- Cochez pour avoir un fond transparent (PNG)
- Utile pour placer le QR sur d'autres images

#### Gradient
- Activez pour une couleur dégradée
- Sélectionnez la couleur secondaire

### 4. Ajouter un Logo

1. Cochez "Add logo to QR"
2. Cliquez "Choisir un fichier" et sélectionnez votre image
3. **Taille** - Ajustez de 1% à 300% avec le slider
4. **Espacement** - Ajustez la marge (0-20px)
5. Visualisez l'aperçu du logo

**Format recommandé:** PNG avec transparence

### 5. Niveau de Correction d'Erreur

- **L (7%)** - Pour petits QR codes, peu d'erreurs attendues
- **M (15%)** - Défaut recommandé
- **Q (25%)** - QR codes imprimés ou sur les produits
- **H (30%)** - Maximum, idéal pour petites tailles

### 6. Télécharger

**Choisissez le format:**
- **PNG** - Image standard (recommandé)
- **PDF** - Document A4 pour impression
- **SVG** - Vecteur scalable (sans perte)

**Bouton Download:**
- Clique simple pour télécharger
- Peut prendre 1-2 secondes

### 7. Actions Supplémentaires

- **Copy** - Copie le QR dans le presse-papiers
- **Reset** - Réinitialise tout à zéro
- **Share** - Partage sur réseaux sociaux
- **Print** - Ouvre la fenêtre d'impression
- **Save as Template** - Exporte vos paramètres en JSON
- **Create Dynamic QR** - À venir

## 🔍 Dépannage

### Le QR code ne fonctionne pas après le scan

**Cause possible:** L'URL entrée n'existe pas ou est incorrecte

**Solution:**
1. Vérifiez que l'URL commence par `https://` ou `http://`
2. Utilisez une URL valide comme `https://www.google.com`
3. Testez l'URL dans votre navigateur d'abord

### Le logo n'apparaît pas

**Causes possibles:**
1. Format d'image non supporté
2. Image trop petite
3. Taille du logo à 0%

**Solutions:**
1. Utilisez PNG ou JPG
2. Augmentez la taille du logo (au moins 10%)
3. Vérifiez le curseur d'espacement

### Le QR code est trop petit/grand

**Solution:** Utilisez le niveau de correction d'erreur
- H (30%) = QR plus grand
- L (7%) = QR plus petit

### La couleur ne change pas

**Solution:** Assurez-vous que:
1. Vous avez cliqué sur le bon sélecteur
2. Le code hex est valide (#RRGGBB)
3. Pas de fond transparent activé

## 💡 Conseils & Astuces

### Pour un QR code professionnel:
1. Utilisez noir/blanc (classic look)
2. Cadre "Bannière" avec texte "SCAN ME"
3. Logo de votre entreprise (25-50%)
4. Niveau correction M

### Pour impression:
1. Exporte en **PDF** ou **SVG**
2. Assure toi que le QR n'est pas trop petit
3. Teste le scan avant d'imprimer

### Pour réseaux sociaux:
1. Exporte en **PNG**
2. Utilise un cadre flashy
3. Ajoute un logo/avatar
4. Teste la scannabilité

### Pour appareils mobiles:
1. Utilise couleurs contrastées
2. Évite trop de logo (rend difficile à scanner)
3. Niveau correction H pour robustesse

## 📱 Types de QR Code Expliqués

### Website
Scannez pour ouvrir une URL dans le navigateur

### Wi-Fi
Scannez pour se connecter automatiquement au Wi-Fi (iOS/Android)

### Email
Scannez pour ouvrir l'application email avec le destinataire pré-rempli

### WhatsApp
Scannez pour envoyer un message WhatsApp à un numéro

### vCard
Scannez pour ajouter un contact à votre téléphone

### SMS
Scannez pour envoyer un SMS à un numéro

## 🎯 Cas d'Usage

### Restaurant
Type: Menu
- Contenu: Lien vers votre menu en ligne
- Design: Cadre "Mug", couleurs rouge/jaune
- Affichage: Sur la table ou à l'entrée

### E-commerce
Type: Product
- Contenu: Lien vers la page produit
- Design: Logo de votre marque
- Affichage: Sur étiquette ou emballage

### Événement
Type: Event
- Contenu: Titre, description, détails
- Design: Cadre "Banner", couleurs festives
- Affichage: Affiche, billet, email

### Visite Professionnel
Type: vCard
- Contenu: Vos infos de contact
- Design: Noir/blanc, professionnel
- Affichage: Carte de visite

### Livraison
Type: Coupon
- Contenu: Code promo + remise
- Design: Cadre "Scooter", couleurs vives
- Affichage: Email, SMS, poster

## ✨ FAQ

**Q: Combien de données peut contenir un QR code?**
R: Environ 4296 caractères alphanumériques

**Q: Puis-je modifier un QR code après création?**
R: Non, il faut en créer un nouveau. Utilisez "Save as Template" pour réutiliser les paramètres

**Q: Quel format est le meilleur pour imprimer?**
R: SVG ou PDF, car ils se redimensionnent sans perte

**Q: Le QR code fonctionne-t-il hors ligne?**
R: Non, il faut une connexion pour scanner

**Q: Puis-je utiliser ma propre police d'écriture?**
R: Non, le texte dans le cadre utilise la police par défaut

---

**Besoin d'aide?** Assurez-vous que toutes les URLs utilisent le protocole HTTPS et qu'elles sont valides!
