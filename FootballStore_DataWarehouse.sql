
Use NHUNGUYEN_DOANTOTNGHIEP

-- Tạo bảng Customer
CREATE TABLE Customer(
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(255)
);

-- Tạo bảng ProductCategory
CREATE TABLE ProductCategory (
    ProductCategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(255)
);

-- Tạo bảng ProductSubCategory
CREATE TABLE ProductSubCategory (
    ProductSubCategoryID INT IDENTITY(1,1) PRIMARY KEY,
    SubCategoryName NVARCHAR(255),
    ProductCategoryID INT FOREIGN KEY REFERENCES ProductCategory(ProductCategoryID)
);

-- Tạo bảng Product
CREATE TABLE Product (
    ProductID INT IDENTITY (1,1) PRIMARY KEY,
    ProductName NVARCHAR(255),
    ProductSubCategoryID INT FOREIGN KEY REFERENCES ProductSubCategory(ProductSubCategoryID),
    Brand NVARCHAR(255)
);

-- Tạo bảng ProductVariants
CREATE TABLE ProductVariants (
    VariantID INT IDENTITY(1,1) PRIMARY KEY,
	Barcode NVARCHAR(50),
    Attribute NVARCHAR(255),
    AttributeValue NVARCHAR(255),
    SellingPrice INT,
    ProductID INT FOREIGN KEY REFERENCES Product(ProductID)
);

-- Tạo bảng Region
CREATE TABLE Region (
    ProvinceID INT IDENTITY(1,1) PRIMARY KEY,
    ProvinceName NVARCHAR(255)
);

-- Tạo bảng PaymentMethod
CREATE TABLE PaymentMethod (
    PaymentMethodID INT IDENTITY(1,1) PRIMARY KEY,
    PaymentMethod NVARCHAR(255)
);

-- Tạo bảng CancellationReason
CREATE TABLE CancellationReason (
    CancellationReasonID INT IDENTITY(1,1) PRIMARY KEY,
    CancellationReason NVARCHAR(255)
);

-- Tạo bảng Sales
CREATE TABLE Sales (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID NVARCHAR(50),
    OrderDate DATE,
    VariantID INT FOREIGN KEY REFERENCES ProductVariants(VariantID),
    OrderQuantity INT,
    ActualPrice INT,
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
    PaymentMethodID INT FOREIGN KEY REFERENCES PaymentMethod(PaymentMethodID),
    ProvinceID INT FOREIGN KEY REFERENCES Region(ProvinceID)
);

-- Tạo bảng Returns
CREATE TABLE Returns(
    ReturnDate DATE,
    VariantID INT FOREIGN KEY REFERENCES ProductVariants(VariantID),
    ReturnQuantity INT,
	ActualPrice INT,
    ProvinceID INT FOREIGN KEY REFERENCES Region(ProvinceID)
);

-- Tạo bảng Cancels
CREATE TABLE Cancels (
    CancelDate DATE,
    VariantID INT FOREIGN KEY REFERENCES ProductVariants(VariantID),
    ProvinceID INT FOREIGN KEY REFERENCES Region(ProvinceID),
    CancelQuantity INT,
	ActualPrice INT,
    CancellationReasonID INT FOREIGN KEY REFERENCES CancellationReason(CancellationReasonID)
);


Drop table Sales
Drop table [Returns]
Drop table Cancels

Drop table ProductVariants
Drop table Product
Drop table ProductSubCategory
Drop table ProductCategory
Drop table CancellationReason
Drop table Customer
Drop table PaymentMethod
Drop table Region

Select *
From Customer

Select *	
From Region

Select *
From PaymentMethod

Select *
From CancellationReason

Select *
From ProductCategory

Select *
From ProductSubCategory

Select *
From Product

Select *
From ProductVariants

Select *
From Sales

Select *
From [Returns]

Select *
From Cancels

Delete from Sales
Delete from [Returns]
Delete from Cancels

Delete from ProductVariants
Delete from Product
Delete from ProductSubCategory
Delete from ProductCategory
Delete from CancellationReason
Delete from Customer
Delete from PaymentMethod
Delete from Region
Delete from ReturnReason

SELECT @@SERVERNAME;
