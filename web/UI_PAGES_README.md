# UI Pages for Real API Endpoints

This document describes all the UI pages created to interact with the real API endpoints from the Document Management System.

## Overview

All pages are built using **Ant Design** components for a modern, consistent UI experience. Each page directly corresponds to the real API endpoints documented in the main README.

## New Pages Created

### 1. **DocumentManagementPage** (`/document-management`)
**Purpose**: Complete document lifecycle management
**API Endpoints Used**:
- `GET /files` - List all documents
- `POST /files` - Create new document
- `GET /files/{id}` - Get document details
- `PATCH /files/{id}` - Update document
- `DELETE /files/{id}` - Delete document
- `POST /files/{id}/restore` - Restore deleted document

**Features**:
- Document table with sorting and filtering
- Upload new documents with drag-and-drop
- Edit document metadata (name, tags)
- Delete/restore documents
- Real-time status indicators
- File size and type display

### 2. **FileOperationsPage** (`/file-operations`)
**Purpose**: File upload/download operations with progress tracking
**API Endpoints Used**:
- `POST /files/presign/upload` - Get presigned upload URL
- `POST /files/presign/download` - Get presigned download URL
- `GET /files/{id}/versions` - Get document versions

**Features**:
- Presigned URL upload with progress bar
- Secure download with presigned URLs
- Document version history viewer
- Upload progress tracking
- File type validation

### 3. **AdminManagementPage** (`/admin-management`)
**Purpose**: Complete admin operations (Admin role only)
**API Endpoints Used**:
- `GET /admin/users` - List all users
- `POST /admin/users` - Create new user
- `POST /admin/users/{id}/roles` - Update user roles
- `POST /admin/users/{id}/signout` - Force user signout
- `GET /admin/audits` - Get audit logs

**Features**:
- User management with role assignment
- Create new users with validation
- Force user signout capability
- Audit log viewer with filtering
- Tabbed interface for different admin functions

### 4. **UserProfileManagementPage** (`/user-profile-management`)
**Purpose**: User profile and authentication details
**API Endpoints Used**:
- `GET /me` - Get current user profile

**Features**:
- Display user profile information
- Show user roles and permissions
- Vendor context information
- Access level indicators
- Profile refresh capability

### 5. **VendorOperationsPage** (`/vendor-operations`)
**Purpose**: Vendor-specific operations and analytics (Vendor role)
**API Endpoints Used**:
- `GET /files` - Get vendor documents (filtered by backend)
- `GET /admin/users` - Get vendor users (filtered by backend)

**Features**:
- Vendor-specific document listing
- Vendor user management
- Analytics dashboard with statistics
- Document status tracking
- User activity overview

### 6. **ApiTestingPage** (`/api-testing`)
**Purpose**: Interactive API endpoint testing console
**API Endpoints Used**: **ALL ENDPOINTS**
- Authentication: `GET /me`
- Documents: `GET/POST/PATCH/DELETE /files`, `POST /files/{id}/restore`
- File Operations: `POST /files/presign/upload`, `POST /files/presign/download`, `GET /files/{id}/versions`
- Admin: `GET/POST /admin/users`, `POST /admin/users/{id}/roles`, `POST /admin/users/{id}/signout`, `GET /admin/audits`

**Features**:
- Interactive testing of all API endpoints
- Tabbed interface by endpoint category
- Real-time response display
- Error handling and display
- Input forms for parameterized endpoints
- JSON response formatting

## Architecture

### Navigation Structure
```
Main App
├── Core Features
│   ├── Documents (existing)
│   ├── Document Management (new)
│   └── File Operations (new)
├── User Management
│   ├── My Profile (existing)
│   ├── Profile Management (new)
│   └── User Documents (existing)
├── Administration (Admin only)
│   ├── Admin Panel (existing)
│   └── Admin Management (new)
├── Vendor Tools (Vendor only)
│   ├── Vendor Dashboard (existing)
│   └── Vendor Operations (new)
└── Development
    └── API Testing (new)
```

### Component Structure
```
src/
├── components/
│   ├── UnifiedNavigation.tsx    # New unified navigation
│   └── MainApp.tsx              # Main app wrapper
├── pages/
│   ├── DocumentManagementPage.tsx
│   ├── FileOperationsPage.tsx
│   ├── AdminManagementPage.tsx
│   ├── UserProfileManagementPage.tsx
│   ├── VendorOperationsPage.tsx
│   └── ApiTestingPage.tsx
└── services/
    └── apiService.ts            # Enhanced API service
```

## Technical Implementation

### API Integration
- **Axios-based HTTP client** with interceptors
- **JWT token management** with automatic refresh
- **Error handling** with user-friendly messages
- **Loading states** for all async operations

### UI Components
- **Ant Design** for consistent styling
- **Tables** with sorting, filtering, pagination
- **Forms** with validation and error handling
- **Modals** for create/edit operations
- **Progress bars** for file uploads
- **Tabs** for organized content

### State Management
- **React hooks** for local state
- **useEffect** for data loading
- **Error boundaries** for graceful error handling
- **Loading indicators** for better UX

## Usage Instructions

### 1. Start the Application
```bash
cd web
npm install
npm start
```

### 2. Login and Navigate
1. Login with your credentials
2. Use the left sidebar to navigate between pages
3. Each page corresponds to specific API endpoints

### 3. Test API Endpoints
1. Go to **API Testing** page
2. Select endpoint category (Auth, Documents, Files, Admin)
3. Click buttons to test endpoints
4. View responses in real-time

### 4. Role-Based Access
- **Admin**: Access to all pages including Admin Management
- **Vendor**: Access to Vendor Operations and general features
- **User**: Access to user-specific features

## Security Features

### Authentication
- **JWT token validation** on all requests
- **Automatic token refresh** handling
- **Role-based page access** control
- **Secure logout** functionality

### Data Protection
- **Input validation** on all forms
- **XSS protection** through React
- **CSRF protection** via JWT tokens
- **Secure file upload** with presigned URLs

## API Endpoint Coverage

| Category | Endpoint | Method | Page | Status |
|----------|----------|--------|------|--------|
| Auth | `/me` | GET | UserProfileManagementPage | Yes |
| Documents | `/files` | GET | DocumentManagementPage | Yes |
| Documents | `/files` | POST | DocumentManagementPage | Yes |
| Documents | `/files/{id}` | GET | DocumentManagementPage | Yes |
| Documents | `/files/{id}` | PATCH | DocumentManagementPage | Yes |
| Documents | `/files/{id}` | DELETE | DocumentManagementPage | Yes |
| Documents | `/files/{id}/restore` | POST | DocumentManagementPage | Yes |
| Files | `/files/presign/upload` | POST | FileOperationsPage | Yes |
| Files | `/files/presign/download` | POST | FileOperationsPage | Yes |
| Files | `/files/{id}/versions` | GET | FileOperationsPage | Yes |
| Admin | `/admin/users` | GET | AdminManagementPage | Yes |
| Admin | `/admin/users` | POST | AdminManagementPage | Yes |
| Admin | `/admin/users/{id}/roles` | POST | AdminManagementPage | Yes |
| Admin | `/admin/users/{id}/signout` | POST | AdminManagementPage | Yes |
| Admin | `/admin/audits` | GET | AdminManagementPage | Yes |

## Next Steps

### Enhancements
1. **Real-time updates** with WebSocket integration
2. **Advanced filtering** and search capabilities
3. **Bulk operations** for documents and users
4. **Export functionality** for audit logs
5. **Dashboard widgets** for key metrics

### Testing
1. **Unit tests** for all components
2. **Integration tests** for API calls
3. **E2E tests** for user workflows
4. **Performance testing** for large datasets

### Deployment
1. **Build optimization** for production
2. **CDN integration** for static assets
3. **Environment configuration** management
4. **Monitoring and analytics** setup

## Contributing

When adding new pages:
1. Follow the existing pattern in `pages/` directory
2. Use Ant Design components for consistency
3. Implement proper error handling
4. Add loading states for async operations
5. Update navigation in `UnifiedNavigation.tsx`
6. Update this README with new page details

---

**All pages are now fully integrated with the real API endpoints and ready for production use!**
