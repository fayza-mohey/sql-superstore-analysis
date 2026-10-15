USE Central_Superstore;

SELECT DB_NAME() AS CurrentDatabase;

CREATE TABLE DimCustomer (
    CustomerID VARCHAR(30) PRIMARY KEY,
    CustomerName VARCHAR(100),
    Segment VARCHAR(30)
);

CREATE TABLE DimProduct (
    ProductID VARCHAR(40) PRIMARY KEY,
    ProductName VARCHAR(70),
    Category VARCHAR(40),
    SubCategory VARCHAR(50)
);

CREATE TABLE DimLocation (
    LocationID INT IDENTITY(1,1) PRIMARY KEY,
    Country VARCHAR(40),
    City VARCHAR(40),
    State VARCHAR(30),
    PostalCode VARCHAR(20),
    Region VARCHAR(50)
);

CREATE TABLE DimShipMode (
    ShipModeID INT IDENTITY(1,1) PRIMARY KEY,
    ShipMode VARCHAR(25) UNIQUE
);

CREATE TABLE DimDate (
    DateID INT PRIMARY KEY,
    FullDate DATE,
    YearNo INT,
    MonthNo INT,
    MonthName VARCHAR(20),
    QuarterNo INT
);

CREATE TABLE Fact (
    SalesID INT IDENTITY(1,1) PRIMARY KEY,
    RowID INT,
    OrderID VARCHAR(50),
    OrderDate DATE,
    ShipDate DATE,
    DateID INT,
    CustomerID VARCHAR(50),
    ProductID VARCHAR(50),
    LocationID INT,
    ShipModeID INT,
    Sales DECIMAL(18,2),
    Quantity INT,
    Discount DECIMAL(10,4),
    Profit DECIMAL(18,2),

    CONSTRAINT FK_Fact_Customer
        FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),

    CONSTRAINT FK_Fact_Product
        FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),

    CONSTRAINT FK_Fact_Location
        FOREIGN KEY (LocationID) REFERENCES DimLocation(LocationID),

    CONSTRAINT FK_Fact_ShipMode
        FOREIGN KEY (ShipModeID) REFERENCES DimShipMode(ShipModeID),

    CONSTRAINT FK_Fact_Date
        FOREIGN KEY (DateID) REFERENCES DimDate(DateID)
);

