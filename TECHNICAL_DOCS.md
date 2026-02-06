# Documentation Technique KweekQR

## Architecture

KweekQR est une application React/TypeScript utilisant Vite pour le bundling. Elle génère des codes QR personnalisés avec la librairie `qr-code-styling`.

### Structure du projet

```
src/
├── main.tsx              # Point d'entrée
├── app/
│   ├── App.tsx          # Composant racine
│   └── components/
│       ├── qr-generator.tsx  # Composant principal (1400+ lignes)
│       └── figma/        # Composants Figma
└── styles/              # CSS et Tailwind
```

## Composants

### QRGenerator (qr-generator.tsx)

Le composant principal qui contient:

#### States (États)
```typescript
// Contenu
const [url, setUrl] = useState('https://www.google.com');
const [text, setText] = useState('Bienvenue sur mon QR Code!');
const [vcard, setVcard] = useState<VCardData>({...});
const [wifi, setWifi] = useState<WiFiData>({...});

// Design
const [qrColor, setQrColor] = useState('#000000');
const [bgColor, setBgColor] = useState('#ffffff');
const [shapeStyle, setShapeStyle] = useState('square');
const [hasLogo, setHasLogo] = useState(false);
const [logoSize, setLogoSize] = useState(25);
```

#### Fonctions Principales

##### `getQRValue(): string`
Génère la valeur QR basée sur le type de contenu sélectionné.

```typescript
switch (contentType) {
  case 'website': return url || 'https://www.google.com';
  case 'wifi': return generateWiFiString(wifi);
  case 'email': return `mailto:${emailTo}?subject=...`;
  // ... autres cas
}
```

##### `downloadQR(): void`
Télécharge le QR code dans le format sélectionné (PNG, PDF, SVG).

```typescript
if (downloadFormat === 'svg') {
  qrCodeInstance.current.download({
    name: 'qr-code',
    extension: 'svg'
  });
} else if (downloadFormat === 'png') {
  // Canvas to DataURL
}
```

##### `copyQR(): void`
Copie le QR code (image PNG) dans le presse-papiers.

```typescript
canvas.toBlob((blob) => {
  navigator.clipboard.write([
    new ClipboardItem({ 'image/png': blob })
  ]);
});
```

##### `shareQR(): void`
Utilise l'API Web Share ou ouvre une fenêtre popup.

```typescript
if (navigator.share) {
  navigator.share({
    title: 'QR Code',
    text: 'Check out my QR code!',
    url: dataUrl
  });
}
```

##### `printQR(): void`
Ouvre la fenêtre d'impression du navigateur avec le QR code.

```typescript
const printWindow = window.open('', '', 'height=600,width=600');
printWindow.document.write(`<img src="${img}" .../>`);
printWindow.print();
```

##### `handleLogoUpload(e): void`
Traite l'upload du logo et l'ajoute au QR code.

```typescript
const reader = new FileReader();
reader.onload = (event) => {
  const dataUrl = event.target.result;
  resizeLogoImage(dataUrl, logoSize).then((resized) => {
    setLogoFile(resized);
    setHasLogo(true);
  });
};
reader.readAsDataURL(file);
```

##### `resizeLogoImage(dataUrl, sizePercent): Promise<string>`
Redimensionne le logo à la taille spécifiée.

```typescript
const targetSize = Math.round((sizePercent / 100) * 300);
const canvas = document.createElement('canvas');
canvas.width = targetSize;
canvas.height = targetSize;
const ctx = canvas.getContext('2d');
ctx.drawImage(img, 0, 0, targetSize, targetSize);
return canvas.toDataURL('image/png');
```

#### Génération QR Code

```typescript
const qrCode = new QRCodeStyling({
  width: 250,
  height: 250,
  data: getQRValue(),
  dotsOptions: {
    color: isGradient ? gradientColor : qrColor,
    type: moduleType as 'square' | 'dots'
  },
  cornersSquareOptions: {
    color: isGradient ? gradientColor : qrColor,
    type: cornersType as 'square' | 'rounded' | 'extra-rounded'
  },
  backgroundOptions: {
    color: hasTransparentBg ? 'transparent' : bgColor
  },
  image: hasLogo && logoFile ? logoFile : undefined,
  imageOptions: {
    margin: logoMargin,
    imageSize: Math.min(3.0, logoSize / 100)
  }
});
```

#### Styles de Forme

| Style | Module Type | Corner Type | Description |
|-------|------------|-------------|-------------|
| square | square | square | Carré classique |
| rounded1 | square | rounded | Coins arrondis légers |
| rounded2 | square | extra-rounded | Coins très arrondis |
| rounded3 | dots | rounded | Petits dots + coins arrondis |
| rounded4 | dots | extra-rounded | Grands dots + coins arrondis |
| dots | dots | square | Tous en dots |

## Types de Contenu Supportés

### 1. Website
```
URL → QR Code → Ouvre dans navigateur
Défaut: https://www.google.com
```

### 2. Wi-Fi
```
WIFI:T:[sécurité];S:[SSID];P:[Password];;
Format: WPA, WEP, ou aucun
```

### 3. Email
```
mailto:[email]?subject=[subject]&body=[body]
Ouvre l'application email
```

### 4. WhatsApp
```
https://wa.me/[numéro]?text=[message]
Format: +33612345678 (international)
```

### 5. SMS
```
sms:[numéro]?body=[message]
```

### 6. vCard
```
BEGIN:VCARD
VERSION:3.0
FN:[Nom]
TEL:[Téléphone]
EMAIL:[Email]
ORG:[Entreprise]
TITLE:[Titre]
URL:[Website]
ADR:[Adresse]
END:VCARD
```

## URLs Par Défaut

```typescript
// État initial
const [url, setUrl] = useState('https://www.google.com');

// Fallbacks dans getQRValue()
case 'website': return url || 'https://www.google.com';
case 'pdf': return url || 'https://www.w3.org/WAI/WCAG21/Techniques/pdf/pdf-table.pdf';
case 'images': return url || 'https://www.w3schools.com/css/img_5terre.jpg';
case 'video': return url || 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
case 'product': return productUrl || 'https://www.amazon.com';
case 'app': return appUrl || 'https://www.google.com/play';
case 'feedback': return feedbackUrl || 'https://forms.google.com';
```

## Formats de Téléchargement

### PNG
```typescript
const imgData = canvas.toDataURL('image/png');
link.href = imgData;
link.download = 'qr-code.png';
```

### PDF (A4)
```typescript
const pdf = new jsPDF({
  orientation: 'portrait',
  unit: 'mm',
  format: 'a4'
});
pdf.addImage(imgData, 'PNG', x, y, 100, 100);
link.href = pdf.output('dataurlstring');
link.download = 'qr-code.pdf';
```

### SVG
```typescript
qrCodeInstance.current.download({
  name: 'qr-code',
  extension: 'svg'
});
```

## Niveaux de Correction d'Erreur

```typescript
type ErrorLevel = 'L' | 'M' | 'Q' | 'H';

const errorLevels = {
  'L': { level: 7, best: 'Petits QR, peu d\'erreurs' },
  'M': { level: 15, best: 'Défaut, général' },
  'Q': { level: 25, best: 'Impression, produits' },
  'H': { level: 30, best: 'Maximum robustesse' }
};
```

## Cadres (Frames)

### Structure HTML
```tsx
{frameStyle === 'envelope' && (
  <div className="cadre-style">
    <div ref={qrContainerRef} /> {/* QR Code */}
    <div className="texte">{frameText}</div>
  </div>
)}
```

### Cadres Disponibles
1. **none** - Aucun cadre
2. **envelope** - Style enveloppe
3. **screen** - Écran moniteur
4. **hand** - Main tenant le QR
5. **laptop** - Écran portable
6. **mug** - Tasse/Mug
7. **scooter** - Livraison scooter
8. **banner** - Bannière avec texte

## Templating

### Save Template
Exporte tous les paramètres en JSON:

```json
{
  "contentType": "website",
  "data": {
    "url": "https://www.google.com",
    "text": "Bienvenue"
  },
  "design": {
    "qrColor": "#000000",
    "bgColor": "#ffffff",
    "shapeStyle": "square",
    "logoSize": 25
  }
}
```

## Performance

- **useRef** pour les références DOM (QR container, instance)
- **useEffect** pour la régénération du QR lors des changements
- **Lazy loading** des images de logo
- **Debouncing** implicite par React

## Accessibilité

- ✅ Labels pour tous les inputs
- ✅ Descriptions de boutons
- ✅ Contraste suffisant
- ✅ Navigation au clavier supportée

## Sécurité

- ✅ Pas de données stockées côté serveur
- ✅ Pas de sauvegarde de QR codes
- ✅ Traitement 100% client-side
- ✅ Cross-Origin: Anonymous pour les images

## Dépendances Principales

```json
{
  "react": "18.x",
  "typescript": "5.x",
  "vite": "5.x",
  "qr-code-styling": "1.x",
  "jspdf": "2.x",
  "lucide-react": "0.x",
  "tailwindcss": "3.x"
}
```

## Déploiement

### Build
```bash
npm run build
```

### Sortie
- `dist/` - Fichiers compilés
- Prêt pour serveurs statiques (Vercel, Netlify, etc.)

## Limitations Connues

1. **Taille maximale**: ~4296 caractères alphanumériques
2. **Logo**: Pas de support vidéo animée
3. **Dynamique**: Les QR codes ne changent pas une fois générés
4. **Stockage**: Aucune persistance côté serveur

## Améliorations Futures

- [ ] QR codes dynamiques (suivi scans)
- [ ] Batch generation (plusieurs QR)
- [ ] Analytics intégré
- [ ] API backend pour stockage
- [ ] Historique de QR codes
- [ ] Partage direct vers social media
- [ ] OCR reverse (extraire URL d'image)

---

**Version**: 1.0.0
**Dernière mise à jour**: 2026-02-03
**Statut**: Production ✅
