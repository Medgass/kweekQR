# 🚀 KweekQR - Guide d'Automatisation

## Scripts Disponibles

### Développement Local
```bash
npm run dev
```
Lance le serveur de développement sur http://localhost:3002

### Build Production
```bash
npm run build
```
Construit l'application pour la production dans le dossier `dist/`

### Preview du Build
```bash
npm run preview
```
Prévisualise le build production localement

### Déploiement

#### Option 1: Netlify (Recommandé)
```bash
npm run deploy:netlify
```
Déploie automatiquement sur Netlify

#### Option 2: Vercel
```bash
npm run deploy:vercel
```
Déploie automatiquement sur Vercel

#### Option 3: Build Simple
```bash
npm run deploy
```
Crée juste le build, prêt à être déployé ailleurs

## 🤖 Automatisation CI/CD

### GitHub Actions
Le projet est configuré avec GitHub Actions pour automatiser:
- ✅ Installation des dépendances
- ✅ Build du projet
- ✅ Tests de vérification
- ✅ Déploiement automatique sur Netlify (branche main)

### Configuration Requise pour Netlify
1. Installer Netlify CLI: `npm install -g netlify-cli`
2. Configurer les secrets GitHub:
   - `NETLIFY_AUTH_TOKEN`: Token d'authentification Netlify
   - `NETLIFY_SITE_ID`: ID du site Netlify

### Configuration Requise pour Vercel
1. Installer Vercel CLI: `npm install -g vercel`
2. Initialiser: `vercel`

## 📁 Structure de Build

```
dist/
├── index.html
├── assets/
│   ├── [nom].js
│   └── [nom].css
└── logo.svg
```

## 🔄 Processus Automatique

1. **Push sur GitHub** → Déclenche GitHub Actions
2. **Installation** → npm install
3. **Build** → vite build
4. **Déploiement** → Upload sur Netlify (si configuré)

## 🛠️ Personnalisation

Pour ajouter des étapes custom, modifiez:
- `.github/workflows/deploy.yml` pour GitHub Actions
- `vite.config.ts` pour la configuration de build

## ✨ Informations du Site

- **Nom**: KweekQR
- **Description**: Générateur de QR Code Professionnel
- **Réalisé par**: KweekTech
- **Contact**: kweektechcontact@gmail.com
- **Téléphone**: +216 29 072 208

---

**Dernière mise à jour**: Février 2026
