# ProductInventoryManagement
Download the project ProductInventoryManagement.zip here
Extract the zip file

Open the Project
-Open Visual Studio.
-Open Project or Solution
-Load the ProductInventoryManagement.sln.

Set Up the Database
-Open MySQL Workbench (or your preferred SQL client).
-Open the SQL script file: Script For ProductInventory.sql.
-Paste the commands into Workbench and run the script to create the database and tables.

Configure Database Connection
-Open appsettings.json in the project.
-Update the Username and Password to match your MySQL credentials.

Run the Application
-Press Ctrl + F5 (or click Start Without Debugging) in Visual Studio.
-The application should open in your browser.

Default User Accounts
You can log in using the following credentials:
Username    Password	
admin	    1234	    
user	    1234	

API ENDPOINTS
GET ALL PRODUCTS https://localhost:7081/api/products

GET PRODUCT BY ID https://localhost:7081/api/products/{id}

POST NEW PRODUCT https://localhost:7081/api/products
{
        "name": "Product Name",
        "description": "Product Description",
        "price": 1999.99, <-- Price
        "quantity": 22 <-- Quantity
}
PUT PRODUCT BY ID https://localhost:7081/api/products/{id}
{
        "name": "Product New Name",
        "description": "Product New Description",
        "price": 1999.99, <-- New price
        "quantity": 22 <-- New Quantity
}

DELETE PRODUCT BY ID https://localhost:7081/api/products/{id}

GET PRODUCTS BY NAME https://localhost:7081/api/products/search/{name}
