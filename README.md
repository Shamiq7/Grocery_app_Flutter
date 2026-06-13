# Grocery App Flutter

A full-stack grocery shopping application built using Flutter, Firebase Authentication, Cloud Firestore, and Provider State Management.

The application provides separate experiences for customers and administrators. Customers can browse products, search for items, view product details, manage their cart, and calculate checkout totals. Administrators can manage the entire product catalog through a dedicated admin dashboard with Create, Read, Update, and Delete (CRUD) functionality.

## Project Overview

This project was developed using Flutter as the frontend framework, Firebase Authentication for user authentication, Cloud Firestore as the database, and Provider for state management.

The application follows a centralized data architecture where Firestore acts as the primary source of truth. Product information including names, prices, images, categories, and weights are stored in Firestore and loaded dynamically into the application UI.

### Key Features

* Firebase Email Authentication
* Role-Based Login System (Admin & User)
* Cloud Firestore Integration
* Complete CRUD Operations
* Provider State Management
* Product Search Functionality
* Product Detail Page
* Shopping Cart Management
* Dynamic Product Loading from Firestore
* Checkout System with Total Price Calculation
* Category-Based Product Display
* Real-Time UI Updates

## Application Architecture

### Authentication

The application uses Firebase Authentication for user login.

* Regular users can sign in using any valid email.
* A dedicated administrator account has access to the Admin Dashboard.
* All authenticated users are recorded in Firebase Authentication.

### Database

Cloud Firestore stores all product-related information:

* Product Name
* Product Price
* Product Weight
* Product Image Path
* Product Category
* Quantity Information

All product data displayed inside the application is loaded directly from Firestore.

### State Management

Provider is used for managing application state.

Provider is responsible for:

* Loading products from Firestore
* Managing cart items
* Updating product quantities
* Synchronizing UI updates across screens

## Application Flow

Splash Screen → Login Page → Home Page / Admin Dashboard

### User Flow

1. User launches the application.
2. User enters login credentials.
3. After authentication, the user is redirected to the Home Page.
4. Products are loaded from Firestore.
5. User can:

   * Browse products
   * Search products
   * View product details
   * Add items to cart
   * Modify quantities
   * View checkout summary
   * Calculate total amount

### Admin Flow

1. Administrator logs in using admin credentials.
2. Administrator is redirected to the Admin Dashboard.
3. Administrator can:

   * Add new products
   * Edit existing products
   * Delete products
4. All modifications are stored inside Firestore and reflected throughout the application.

---

# Application Screens

## Splash Screen

**Screenshot:** `images/ss1.png`

The Splash Screen serves as the entry point of the application. It introduces users to the platform and provides a "Get Started" button that navigates users to the authentication page.

---

## Login Page

**Screenshots:** `images/ss2.png`, `images/ss3.png`

The Login Page allows users to enter their name, email address, and password.

Firebase Authentication is used to verify user credentials.

* Regular users are redirected to the Home Page.
* Administrators are redirected to the Admin Dashboard.

The Firebase Console shown in the screenshots demonstrates authenticated users being successfully stored and managed by Firebase Authentication.

---

## Home Page

**Screenshots:** `images/ss4.png`, `images/ss5.png`, `images/ss6.png`

The Home Page serves as the primary shopping interface.

Products are displayed under multiple categories:

* Recommended Products
* Fruits & Vegetables
* Utilities

Users can:

* Browse available products
* Add products to cart
* Navigate to the Checkout Page
* Open Product Detail Pages

The View Cart button and snack bar actions provide quick navigation to the cart.

---

## Product Search

**Screenshot:** `images/ss7.png`

The Home Page includes a live search feature.

Users can search for products by name, and matching products are displayed instantly. Selecting a product navigates the user directly to the Product Detail Page.

---

## Product Details Page

**Screenshot:** `images/ss8.png`

The Product Details Page provides detailed information about a selected product.

Displayed information includes:

* Product Image
* Product Name
* Product Price
* Product Weight

Users can:

* Add products to cart
* Increase quantity
* Decrease quantity
* Navigate directly to Checkout

---

## Admin Dashboard

**Screenshot:** `images/ss9.png`

The Admin Dashboard is accessible only through administrator credentials.

Administrators can manage the complete product catalog through a dedicated interface.

Available actions include:

* Create Products
* Read Products
* Update Products
* Delete Products

All modifications are synchronized with Firestore and reflected throughout the application.

---

## Product Creation

**Screenshots:** `images/ss10.png`, `images/ss11.png`

Administrators can create new products by entering:

* Product Name
* Price
* Weight
* Image Path
* Category

The screenshots demonstrate product information being entered through the Admin Dashboard and subsequently stored inside Cloud Firestore.

---

## Product Update

**Screenshot:** `images/ss12.png`

Administrators can modify existing product information using the Edit functionality.

Changes made through the update dialog are reflected in both:

* Cloud Firestore
* Application UI

This ensures product information remains consistent across the application.

---

## Checkout Page

**Screenshot:** `images/ss13.png`

The Checkout Page displays all products added to the shopping cart.

Features include:

* Product Quantity Display
* Product Pricing
* Dynamic Total Amount Calculation
* Checkout Button

Users can review their order before proceeding with the purchase process.

---

## Technologies Used

### Frontend

* Flutter
* Dart

### State Management

* Provider

### Backend Services

* Firebase Authentication
* Cloud Firestore

### Database

* Firebase Cloud Firestore

## Future Improvements

* Product Image Upload via Firebase Storage
* Order History
* Payment Gateway Integration
* User Profiles
* Product Reviews and Ratings
* Real-Time Inventory Tracking
* Push Notifications

## Author

Developed as a Flutter & Firebase learning project demonstrating authentication, Firestore integration, CRUD operations, state management, and shopping cart functionality.
