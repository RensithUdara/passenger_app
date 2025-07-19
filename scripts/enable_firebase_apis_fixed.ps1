# Firebase API Enabler Script for Windows PowerShell
# This script enables the required Firebase APIs for the project

$PROJECT_ID = "safe-driver-system"

Write-Host "Firebase APIs Enabler for project: $PROJECT_ID" -ForegroundColor Green
Write-Host "Please make sure you are authenticated with gcloud CLI first:" -ForegroundColor Yellow
Write-Host "Run: gcloud auth login" -ForegroundColor Cyan
Write-Host ""

# Check if gcloud is installed
if (-not (Get-Command gcloud -ErrorAction SilentlyContinue)) {
    Write-Host "gcloud CLI is not installed. Please install it first:" -ForegroundColor Red
    Write-Host "Visit: https://cloud.google.com/sdk/docs/install" -ForegroundColor Cyan
    exit 1
}

# Set the project
Write-Host "Setting project to $PROJECT_ID..." -ForegroundColor Blue
gcloud config set project $PROJECT_ID

# Enable required APIs
Write-Host "Enabling Firebase APIs..." -ForegroundColor Blue

# Core Firebase APIs
gcloud services enable firebase.googleapis.com
gcloud services enable firebasehosting.googleapis.com
gcloud services enable firebasestorage.googleapis.com
gcloud services enable firebaseremoteconfig.googleapis.com

# Firestore API
Write-Host "Enabling Firestore API..." -ForegroundColor Blue
gcloud services enable firestore.googleapis.com

# Authentication APIs
Write-Host "Enabling Authentication APIs..." -ForegroundColor Blue
gcloud services enable identitytoolkit.googleapis.com
gcloud services enable securetoken.googleapis.com

# Analytics and Crashlytics
Write-Host "Enabling Analytics and Crashlytics..." -ForegroundColor Blue
gcloud services enable firebaseanalytics.googleapis.com
gcloud services enable crashlytics.googleapis.com

# Messaging API
Write-Host "Enabling Firebase Messaging..." -ForegroundColor Blue
gcloud services enable fcm.googleapis.com

# Additional Google APIs
Write-Host "Enabling additional Google APIs..." -ForegroundColor Blue
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable cloudbilling.googleapis.com
gcloud services enable serviceusage.googleapis.com

Write-Host ""
Write-Host "All Firebase APIs have been enabled!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Go to Firebase Console: https://console.firebase.google.com/" -ForegroundColor White
Write-Host "2. Select your project: $PROJECT_ID" -ForegroundColor White
Write-Host "3. Create a Firestore database in production mode" -ForegroundColor White
Write-Host "4. Enable Authentication with Email/Password and Google sign-in" -ForegroundColor White
Write-Host "5. Set up Storage in production mode" -ForegroundColor White
Write-Host ""
Write-Host "Useful links:" -ForegroundColor Cyan
Write-Host "Firebase Console: https://console.firebase.google.com/project/$PROJECT_ID" -ForegroundColor Blue
Write-Host "Firestore: https://console.firebase.google.com/project/$PROJECT_ID/firestore" -ForegroundColor Blue
Write-Host "Authentication: https://console.firebase.google.com/project/$PROJECT_ID/authentication" -ForegroundColor Blue
Write-Host "Storage: https://console.firebase.google.com/project/$PROJECT_ID/storage" -ForegroundColor Blue
