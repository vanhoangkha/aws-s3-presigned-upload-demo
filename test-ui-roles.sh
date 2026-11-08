#!/bin/bash

echo "UI Role Testing - Deploy & Test"
echo "=================================="

# Check if web server is running
echo "Checking web server..."
if curl -s http://localhost:3000 > /dev/null; then
    echo "Web app running at http://localhost:3000"
else
    echo "Web app not running. Please start with: cd web && npm start"
    exit 1
fi

# Check API server
echo "Checking API server..."
API_URL="https://wcyez0q6t8.execute-api.us-east-1.amazonaws.com/v1"
if curl -s "$API_URL/health" > /dev/null 2>&1; then
    echo "API server accessible at $API_URL"
else
    echo "API server may not be accessible"
fi

echo ""
echo "ROLE TESTING INSTRUCTIONS:"
echo ""

echo "1️⃣ ADMIN ROLE TEST:"
echo "   Open: http://localhost:3000"
echo "   Login as admin user"
echo "   Expected Navigation Sections:"
echo "      Core Features (3 items)"
echo "      User Management (5 items)"
echo "      Administration (2 items)"
echo "      Development (1 item)"
echo "   Test Pages:"
echo "      • Document Management - Full CRUD"
echo "      • Admin Management - User creation/roles"
echo "      • API Testing - All admin endpoints"
echo ""

echo "2️⃣ VENDOR ROLE TEST:"
echo "   Login as vendor user"
echo "   Expected Navigation Sections:"
echo "      Core Features (3 items)"
echo "      User Management (5 items)"
echo "      Vendor Tools (2 items)"
echo "      Development (1 item)"
echo "      Administration (should be hidden)"
echo "   Test Pages:"
echo "      • Vendor Operations - Analytics/stats"
echo "      • API Testing - Vendor endpoints only"
echo ""

echo "3️⃣ USER ROLE TEST:"
echo "   Login as regular user"
echo "   Expected Navigation Sections:"
echo "      Core Features (3 items)"
echo "      User Management (5 items)"
echo "      Development (1 item)"
echo "      Administration (should be hidden)"
echo "      Vendor Tools (should be hidden)"
echo "   Test Pages:"
echo "      • User Documents - Own documents only"
echo "      • Enhanced Profile - Profile management"
echo ""

echo "VALIDATION CHECKLIST:"
echo "□ Navigation adapts to user role"
echo "□ Unauthorized pages show access denied"
echo "□ API calls return role-appropriate data"
echo "□ Error handling for forbidden actions"
echo "□ UI components show/hide based on permissions"

echo ""
echo "START TESTING: http://localhost:3000"
echo "Use browser dev tools to check API calls"
echo "Monitor network tab for endpoint responses"
