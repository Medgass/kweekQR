# Script d'automatisation - Build et Déploiement KweekQR

# Couleurs pour le terminal
$Green = [System.ConsoleColor]::Green
$Blue = [System.ConsoleColor]::Blue
$Yellow = [System.ConsoleColor]::Yellow

Write-Host "================================" -ForegroundColor $Blue
Write-Host "🚀 KweekQR - Automatisation" -ForegroundColor $Blue
Write-Host "================================" -ForegroundColor $Blue
Write-Host ""

# 1. Installer les dépendances
Write-Host "📦 Installation des dépendances..." -ForegroundColor $Yellow
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur lors de l'installation" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Dépendances installées" -ForegroundColor $Green
Write-Host ""

# 2. Builder le projet
Write-Host "🔨 Construction du projet..." -ForegroundColor $Yellow
npm run build
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur lors du build" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Build terminé" -ForegroundColor $Green
Write-Host ""

# 3. Information de déploiement
Write-Host "================================" -ForegroundColor $Blue
Write-Host "✨ Déploiement Réussi!" -ForegroundColor $Green
Write-Host "================================" -ForegroundColor $Blue
Write-Host ""
Write-Host "📁 Fichiers générés dans: dist/" -ForegroundColor $Blue
Write-Host ""
Write-Host "🌐 Options de déploiement:" -ForegroundColor $Yellow
Write-Host "  1. Netlify: npm install -g netlify-cli && netlify deploy --prod" -ForegroundColor $Blue
Write-Host "  2. Vercel: npm install -g vercel && vercel --prod" -ForegroundColor $Blue
Write-Host "  3. Server local: npx http-server dist/" -ForegroundColor $Blue
Write-Host ""
