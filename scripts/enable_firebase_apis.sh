#!/bin/bash

# Firebase API Enabler Script
# This script enables the required Firebase APIs for the project

PROJECT_ID="safe-driver-system"

echo "🔥 Enabling Firebase APIs for project: $PROJECT_ID"
echo "Please make sure you're authenticated with gcloud CLI first:"
echo "Run: gcloud auth login"
echo ""

# Check if gcloud is installed
if ! command -v gcloud &> /dev/null; then
    echo "❌ gcloud CLI is not installed. Please install it first:"
    echo "Visit: https://cloud.google.com/sdk/docs/install"
    exit 1
fi

# Set the project
echo "📋 Setting project to $PROJECT_ID..."
gcloud config set project $PROJECT_ID

# Enable required APIs
echo "🔧 Enabling Firebase APIs..."

# Core Firebase APIs
gcloud services enable firebase.googleapis.com
gcloud services enable firebasehosting.googleapis.com
gcloud services enable firebasestorage.googleapis.com
gcloud services enable firebaseremoteconfig.googleapis.com

# Firestore API
echo "📊 Enabling Firestore API..."
gcloud services enable firestore.googleapis.com

# Authentication APIs
echo "🔐 Enabling Authentication APIs..."
gcloud services enable identitytoolkit.googleapis.com
gcloud services enable securetoken.googleapis.com

# Analytics and Crashlytics
echo "📈 Enabling Analytics and Crashlytics..."
gcloud services enable firebaseanalytics.googleapis.com
gcloud services enable crashlytics.googleapis.com

# Messaging API
echo "📱 Enabling Firebase Messaging..."
gcloud services enable fcm.googleapis.com

# Additional Google APIs
echo "🔍 Enabling additional Google APIs..."
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable cloudbilling.googleapis.com
gcloud services enable serviceusage.googleapis.com

echo ""
echo "✅ All Firebase APIs have been enabled!"
echo ""
echo "📋 Next steps:"
echo "1. Go to Firebase Console: https://console.firebase.google.com/"
echo "2. Select your project: $PROJECT_ID"
echo "3. Create a Firestore database:"
echo "   - Go to Firestore Database"
echo "   - Click 'Create database'"
echo "   - Start in production mode"
echo "   - Choose a location"
echo "4. Enable Authentication:"
echo "   - Go to Authentication"
echo "   - Click 'Get started'"
echo "   - Enable Email/Password and Google sign-in"
echo "5. Set up Storage:"
echo "   - Go to Storage"
echo "   - Click 'Get started'"
echo "   - Start in production mode"
echo ""
echo "🔗 Useful links:"
echo "Firebase Console: https://console.firebase.google.com/project/$PROJECT_ID"
echo "Firestore: https://console.firebase.google.com/project/$PROJECT_ID/firestore"
echo "Authentication: https://console.firebase.google.com/project/$PROJECT_ID/authentication"
echo "Storage: https://console.firebase.google.com/project/$PROJECT_ID/storage"
