-- Create Customer table
CREATE TABLE IF NOT EXISTS Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DOB DATE NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Contact VARCHAR(255) NOT NULL
);

-- Create Country table
CREATE TABLE IF NOT EXISTS Country (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(255) NOT NULL
);

-- Create Province table
CREATE TABLE IF NOT EXISTS Province (
    ProvinceID INT PRIMARY KEY,
    ProvinceName VARCHAR(255) NOT NULL
);

-- Create City table
CREATE TABLE IF NOT EXISTS City (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(255) NOT NULL
);

-- Create ZipCode table
CREATE TABLE IF NOT EXISTS ZipCode (
    ZipCodeID INT PRIMARY KEY,
    CityID INT NOT NULL,
    ProvinceID INT NOT NULL,
    CountryID INT NOT NULL,
    FOREIGN KEY (CityID) REFERENCES City(CityID),
    FOREIGN KEY (ProvinceID) REFERENCES Province(ProvinceID),
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

-- Create Address table
CREATE TABLE IF NOT EXISTS Address (
    AddressID INT PRIMARY KEY,
    HouseNo VARCHAR(255) NOT NULL,
    Street INT NOT NULL,
    CustomerID INT NOT NULL,
    ZipCodeID INT NOT NULL,
    Area VARCHAR(255) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ZipCodeID) REFERENCES ZipCode(ZipCodeID)
);

-- Create Category table
CREATE TABLE IF NOT EXISTS Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

-- Create Vendor table
CREATE TABLE IF NOT EXISTS Vendor (
    VendorID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address TEXT NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Contact VARCHAR(255) NOT NULL
);

-- Create Product table
CREATE TABLE IF NOT EXISTS Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- Create VendorProduct table
CREATE TABLE IF NOT EXISTS VendorProduct (
    VendorProductID INT PRIMARY KEY,
    VendorID INT NOT NULL,
    ProductID INT NOT NULL,
    Price DECIMAL(19, 2) NOT NULL,
    Quantity INT NOT NULL,
    Description TEXT NOT NULL,
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Create Courier table
CREATE TABLE IF NOT EXISTS Courier (
    CourierID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Contact VARCHAR(255) NOT NULL
);

-- Create VendorCourier table
CREATE TABLE IF NOT EXISTS VendorCourier (
    VendorCourierID INT PRIMARY KEY,
    VendorID INT NOT NULL,
    CourierID INT NOT NULL,
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID)
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    AddressID INT NOT NULL,
    VendorCourierID INT NOT NULL,
    TrackingID VARCHAR(255) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
    FOREIGN KEY (VendorCourierID) REFERENCES VendorCourier(VendorCourierID)
);

-- Create OrderedProduct table
CREATE TABLE IF NOT EXISTS OrderedProduct (
    OrderedProductID INT PRIMARY KEY,
    VendorProductID INT NOT NULL,
    OrderID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (VendorProductID) REFERENCES VendorProduct(VendorProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Create Review table
CREATE TABLE IF NOT EXISTS Review (
    ReviewID INT PRIMARY KEY,
    Rating TINYINT NOT NULL,
    Comment TEXT,
    CustomerID INT NOT NULL,
    OrderedProductID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (OrderedProductID) REFERENCES OrderedProduct(OrderedProductID)
);

-- Create Cart table
CREATE TABLE IF NOT EXISTS Cart (
    CartID INT PRIMARY KEY,
    DateCreated DATE NOT NULL,
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create CartProduct table
CREATE TABLE IF NOT EXISTS CartProduct (
    CartProductID INT PRIMARY KEY,
    VendorProductID INT NOT NULL,
    Quantity INT NOT NULL,
    CartID INT NOT NULL,
    FOREIGN KEY (VendorProductID) REFERENCES VendorProduct(VendorProductID),
    FOREIGN KEY (CartID) REFERENCES Cart(CartID)
);

-- Value insertion in customer table --
INSERT INTO Customer (CustomerID, FirstName, LastName, DOB, Email, Password, Contact) VALUES
(1, 'John', 'Doe', '1985-05-15', 'johndoe@example.com', 'password123', '123-456-7890'),
(2, 'Jane', 'Smith', '1990-08-20', 'janesmith@example.com', 'password123', '123-456-7891'),
(3, 'Alice', 'Johnson', '1988-01-10', 'alice.johnson@example.com', 'password123', '123-456-7892'),
(4, 'Bob', 'Williams', '1992-03-22', 'bob.williams@example.com', 'password123', '123-456-7893'),
(5, 'Charlie', 'Brown', '1995-07-30', 'charlie.brown@example.com', 'password123', '123-456-7894'),
(6, 'David', 'Jones', '1983-11-12', 'david.jones@example.com', 'password123', '123-456-7895'),
(7, 'Eve', 'Miller', '1991-06-05', 'eve.miller@example.com', 'password123', '123-456-7896'),
(8, 'Frank', 'Davis', '1989-12-25', 'frank.davis@example.com', 'password123', '123-456-7897'),
(9, 'Grace', 'Garcia', '1993-04-17', 'grace.garcia@example.com', 'password123', '123-456-7898'),
(10, 'Hank', 'Martinez', '1987-09-19', 'hank.martinez@example.com', 'password123', '123-456-7899'),
(11, 'Ivy', 'Hernandez', '1994-01-03', 'ivy.hernandez@example.com', 'password123', '123-456-7900'),
(12, 'Jack', 'Lopez', '1986-02-14', 'jack.lopez@example.com', 'password123', '123-456-7901'),
(13, 'Kathy', 'Gonzalez', '1990-10-21', 'kathy.gonzalez@example.com', 'password123', '123-456-7902'),
(14, 'Leo', 'Perez', '1992-05-28', 'leo.perez@example.com', 'password123', '123-456-7903'),
(15, 'Mona', 'Wilson', '1984-07-11', 'mona.wilson@example.com', 'password123', '123-456-7904'),
(16, 'Nathan', 'Anderson', '1985-08-22', 'nathan.anderson@example.com', 'password123', '123-456-7905'),
(17, 'Olivia', 'Thomas', '1993-09-03', 'olivia.thomas@example.com', 'password123', '123-456-7906'),
(18, 'Paul', 'Taylor', '1991-11-06', 'paul.taylor@example.com', 'password123', '123-456-7907'),
(19, 'Quincy', 'Moore', '1988-04-10', 'quincy.moore@example.com', 'password123', '123-456-7908'),
(20, 'Rachel', 'Jackson', '1992-06-18', 'rachel.jackson@example.com', 'password123', '123-456-7909'),
(21, 'Sam', 'White', '1989-03-25', 'sam.white@example.com', 'password123', '123-456-7910'),
(22, 'Tina', 'Lee', '1995-05-12', 'tina.lee@example.com', 'password123', '123-456-7911'),
(23, 'Uma', 'Harris', '1990-02-20', 'uma.harris@example.com', 'password123', '123-456-7912'),
(24, 'Victor', 'Clark', '1994-09-13', 'victor.clark@example.com', 'password123', '123-456-7913'),
(25, 'Wendy', 'Lewis', '1987-07-07', 'wendy.lewis@example.com', 'password123', '123-456-7914'),
(26, 'Xander', 'Robinson', '1992-08-30', 'xander.robinson@example.com', 'password123', '123-456-7915'),
(27, 'Yvonne', 'Walker', '1985-01-15', 'yvonne.walker@example.com', 'password123', '123-456-7916'),
(28, 'Zane', 'Hall', '1991-11-09', 'zane.hall@example.com', 'password123', '123-456-7917'),
(29, 'Aaron', 'Allen', '1993-06-25', 'aaron.allen@example.com', 'password123', '123-456-7918'),
(30, 'Beth', 'Young', '1986-12-05', 'beth.young@example.com', 'password123', '123-456-7919'),
(31, 'Cameron', 'King', '1994-04-28', 'cameron.king@example.com', 'password123', '123-456-7920'),
(32, 'Diana', 'Scott', '1991-07-18', 'diana.scott@example.com', 'password123', '123-456-7921'),
(33, 'Elena', 'Green', '1992-10-12', 'elena.green@example.com', 'password123', '123-456-7922'),
(34, 'Felix', 'Adams', '1989-03-03', 'felix.adams@example.com', 'password123', '123-456-7923'),
(35, 'Grace', 'Nelson', '1987-04-06', 'grace.nelson@example.com', 'password123', '123-456-7924'),
(36, 'Henry', 'Baker', '1993-01-28', 'henry.baker@example.com', 'password123', '123-456-7925'),
(37, 'Isla', 'Graham', '1990-11-11', 'isla.graham@example.com', 'password123', '123-456-7926'),
(38, 'Jackie', 'Morris', '1992-06-14', 'jackie.morris@example.com', 'password123', '123-456-7927'),
(39, 'Kyle', 'Roberts', '1985-09-17', 'kyle.roberts@example.com', 'password123', '123-456-7928'),
(40, 'Lena', 'Hughes', '1994-02-08', 'lena.hughes@example.com', 'password123', '123-456-7929'),
(41, 'Mark', 'Evans', '1986-05-01', 'mark.evans@example.com', 'password123', '123-456-7930'),
(42, 'Nina', 'Carter', '1990-01-19', 'nina.carter@example.com', 'password123', '123-456-7931'),
(43, 'Oscar', 'Mitchell', '1993-08-07', 'oscar.mitchell@example.com', 'password123', '123-456-7932'),
(44, 'Penny', 'Perez', '1988-12-03', 'penny.perez@example.com', 'password123', '123-456-7933'),
(45, 'Quinn', 'Bennett', '1992-03-04', 'quinn.bennett@example.com', 'password123', '123-456-7934'),
(46, 'Riley', 'Morris', '1991-10-15', 'riley.morris@example.com', 'password123', '123-456-7935'),
(47, 'Steve', 'Reed', '1994-07-22', 'steve.reed@example.com', 'password123', '123-456-7936'),
(48, 'Tessa', 'Cooper', '1986-02-25', 'tessa.cooper@example.com', 'password123', '123-456-7937'),
(49, 'Ursula', 'Parker', '1993-05-10', 'ursula.parker@example.com', 'password123', '123-456-7938'),
(50, 'Vince', 'Murphy', '1991-09-19', 'vince.murphy@example.com', 'password123', '123-456-7939');

-- Value insertion in country table --
INSERT INTO Country (CountryID, CountryName) VALUES
(1, 'United States'),
(2, 'Canada'),
(3, 'Mexico'),
(4, 'United Kingdom'),
(5, 'Germany'),
(6, 'France'),
(7, 'Italy'),
(8, 'Spain'),
(9, 'Australia'),
(10, 'Japan'),
(11, 'China'),
(12, 'India'),
(13, 'Brazil'),
(14, 'Russia'),
(15, 'South Korea'),
(16, 'South Africa'),
(17, 'Argentina'),
(18, 'Egypt'),
(19, 'Nigeria'),
(20, 'Saudi Arabia'),
(21, 'Turkey'),
(22, 'Indonesia'),
(23, 'Vietnam'),
(24, 'Thailand'),
(25, 'Malaysia'),
(26, 'Singapore'),
(27, 'Pakistan'),
(28, 'Bangladesh'),
(29, 'Colombia'),
(30, 'Chile'),
(31, 'Peru'),
(32, 'Kenya'),
(33, 'Greece'),
(34, 'Netherlands'),
(35, 'Poland'),
(36, 'Ukraine'),
(37, 'Belgium'),
(38, 'Sweden'),
(39, 'Norway'),
(40, 'Denmark'),
(41, 'Finland'),
(42, 'Switzerland'),
(43, 'Austria'),
(44, 'Ireland'),
(45, 'Portugal'),
(46, 'Israel'),
(47, 'United Arab Emirates'),
(48, 'Qatar'),
(49, 'Kuwait'),
(50, 'New Zealand');

-- Value insertion inprovince table --
INSERT INTO Province (ProvinceID, ProvinceName) VALUES
(1, 'Ontario'),
(2, 'Quebec'),
(3, 'British Columbia'),
(4, 'Alberta'),
(5, 'Nova Scotia'),
(6, 'New Brunswick'),
(7, 'Prince Edward Island'),
(8, 'Manitoba'),
(9, 'Saskatchewan'),
(10, 'Newfoundland and Labrador'),
(11, 'California'),
(12, 'Texas'),
(13, 'Florida'),
(14, 'New York'),
(15, 'Illinois'),
(16, 'Pennsylvania'),
(17, 'Ohio'),
(18, 'Georgia'),
(19, 'North Carolina'),
(20, 'Michigan'),
(21, 'Bavaria'),
(22, 'North Rhine-Westphalia'),
(23, 'Baden-Württemberg'),
(24, 'Hesse'),
(25, 'Saxony'),
(26, 'Lower Saxony'),
(27, 'Berlin'),
(28, 'Brandenburg'),
(29, 'Schleswig-Holstein'),
(30, 'Rhineland-Palatinate'),
(31, 'Buenos Aires'),
(32, 'CABA (City of Buenos Aires)'),
(33, 'Santa Fe'),
(34, 'Cordoba'),
(35, 'Mendoza'),
(36, 'Chaco'),
(37, 'Salta'),
(38, 'Tucumán'),
(39, 'Rio de Janeiro'),
(40, 'São Paulo'),
(41, 'Minas Gerais'),
(42, 'Bahia'),
(43, 'Pernambuco'),
(44, 'Paraná'),
(45, 'Santa Catarina'),
(46, 'Goias'),
(47, 'Pará'),
(48, 'Sergipe'),
(49, 'Ceará'),
(50, 'Piauí');

-- Value insertion in city table --
INSERT INTO City (CityID, CityName) VALUES
(1, 'Toronto'),
(2, 'Montreal'),
(3, 'Vancouver'),
(4, 'Calgary'),
(5, 'Ottawa'),
(6, 'Edmonton'),
(7, 'Winnipeg'),
(8, 'Quebec City'),
(9, 'Hamilton'),
(10, 'Kitchener'),
(11, 'Los Angeles'),
(12, 'New York City'),
(13, 'Chicago'),
(14, 'San Francisco'),
(15, 'Houston'),
(16, 'Dallas'),
(17, 'Phoenix'),
(18, 'Miami'),
(19, 'Boston'),
(20, 'Seattle'),
(21, 'Munich'),
(22, 'Berlin'),
(23, 'Hamburg'),
(24, 'Frankfurt'),
(25, 'Stuttgart'),
(26, 'Düsseldorf'),
(27, 'Cologne'),
(28, 'Dresden'),
(29, 'Leipzig'),
(30, 'Nuremberg'),
(31, 'Buenos Aires'),
(32, 'Córdoba'),
(33, 'Rosario'),
(34, 'Mendoza'),
(35, 'La Plata'),
(36, 'San Miguel de Tucumán'),
(37, 'Salta'),
(38, 'Mar del Plata'),
(39, 'Santa Fe'),
(40, 'Río de Janeiro'),
(41, 'São Paulo'),
(42, 'Brasília'),
(43, 'Salvador'),
(44, 'Belo Horizonte'),
(45, 'Fortaleza'),
(46, 'Curitiba'),
(47, 'Recife'),
(48, 'Porto Alegre'),
(49, 'Manaus'),
(50, 'Santiago');

-- Value insertion in zipcode table --
INSERT INTO ZipCode (ZipCodeID, CityID, ProvinceID, CountryID) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 1),
(5, 5, 5, 1),
(6, 6, 6, 1),
(7, 7, 7, 1),
(8, 8, 8, 1),
(9, 9, 9, 1),
(10, 10, 10, 1),
(11, 11, 11, 2),
(12, 12, 12, 2),
(13, 13, 13, 2),
(14, 14, 14, 2),
(15, 15, 15, 2),
(16, 16, 16, 2),
(17, 17, 17, 2),
(18, 18, 18, 2),
(19, 19, 19, 3),
(20, 20, 20, 3),
(21, 21, 21, 3),
(22, 22, 22, 3),
(23, 23, 23, 3),
(24, 24, 24, 3),
(25, 25, 25, 3),
(26, 26, 26, 3),
(27, 27, 27, 4),
(28, 28, 28, 4),
(29, 29, 29, 4),
(30, 30, 30, 4),
(31, 31, 31, 4),
(32, 32, 32, 4),
(33, 33, 33, 4),
(34, 34, 34, 4),
(35, 35, 35, 5),
(36, 36, 36, 5),
(37, 37, 37, 5),
(38, 38, 38, 5),
(39, 39, 39, 5),
(40, 40, 40, 5),
(41, 41, 41, 5),
(42, 42, 42, 5),
(43, 43, 43, 6),
(44, 44, 44, 6),
(45, 45, 45, 6),
(46, 46, 46, 6),
(47, 47, 47, 6),
(48, 48, 48, 6),
(49, 49, 49, 7),
(50, 50, 50, 7);

-- Value insertion in address table --
INSERT INTO Address (AddressID, HouseNo, Street, CustomerID, ZipCodeID, Area) VALUES
(1, '123', 101, 1, 1, 'Downtown'),
(2, '456', 202, 2, 2, 'Uptown'),
(3, '789', 303, 3, 3, 'Suburban'),
(4, '101', 404, 4, 4, 'East Side'),
(5, '202', 505, 5, 5, 'West End'),
(6, '303', 606, 6, 6, 'North Shore'),
(7, '404', 707, 7, 7, 'South Park'),
(8, '505', 808, 8, 8, 'Old Town'),
(9, '606', 909, 9, 9, 'City Center'),
(10, '707', 1010, 10, 10, 'Green Valley'),
(11, '808', 1111, 11, 11, 'Sunset Boulevard'),
(12, '909', 1212, 12, 12, 'Maple Ridge'),
(13, '1010', 1313, 13, 13, 'River Walk'),
(14, '1111', 1414, 14, 14, 'Hilltop'),
(15, '1212', 1515, 15, 15, 'Lake View'),
(16, '1313', 1616, 16, 16, 'Birchwood'),
(17, '1414', 1717, 17, 17, 'Pinecrest'),
(18, '1515', 1818, 18, 18, 'Mountain View'),
(19, '1616', 1919, 19, 19, 'Coastline'),
(20, '1717', 2020, 20, 20, 'Golden Gate'),
(21, '1818', 2121, 21, 21, 'Cedar Point'),
(22, '1919', 2222, 22, 22, 'Ocean Breeze'),
(23, '2020', 2323, 23, 23, 'Spring Meadows'),
(24, '2121', 2424, 24, 24, 'Sunnydale'),
(25, '2222', 2525, 25, 25, 'Clearwater'),
(26, '2323', 2626, 26, 26, 'Silver Springs'),
(27, '2424', 2727, 27, 27, 'Violet Hill'),
(28, '2525', 2828, 28, 28, 'Stone Ridge'),
(29, '2626', 2929, 29, 29, 'Redwood Forest'),
(30, '2727', 3030, 30, 30, 'Westbrook'),
(31, '2828', 3131, 31, 31, 'Maple Grove'),
(32, '2929', 3232, 32, 32, 'Fisher Heights'),
(33, '3030', 3333, 33, 33, 'Shady Acres'),
(34, '3131', 3434, 34, 34, 'Stonebridge'),
(35, '3232', 3535, 35, 35, 'Parkview'),
(36, '3333', 3636, 36, 36, 'Riverstone'),
(37, '3434', 3737, 37, 37, 'Morning Star'),
(38, '3535', 3838, 38, 38, 'Crescent Hills'),
(39, '3636', 3939, 39, 39, 'Twilight Valley'),
(40, '3737', 4040, 40, 40, 'Hillcrest Heights'),
(41, '3838', 4141, 41, 41, 'Shadowbrook'),
(42, '3939', 4242, 42, 42, 'Blue Ridge'),
(43, '4040', 4343, 43, 43, 'Golden Acres'),
(44, '4141', 4444, 44, 44, 'Lakeside'),
(45, '4242', 4545, 45, 45, 'Windward Pointe'),
(46, '4343', 4646, 46, 46, 'Silver Crest'),
(47, '4444', 4747, 47, 47, 'Sunny Brook'),
(48, '4545', 4848, 48, 48, 'Eagles Nest'),
(49, '4646', 4949, 49, 49, 'Birchwood Heights'),
(50, '4747', 5050, 50, 50, 'Golden Valley');

-- Value insertion in category table --
INSERT INTO Category (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Furniture'),
(3, 'Clothing'),
(4, 'Books'),
(5, 'Toys'),
(6, 'Sports'),
(7, 'Beauty'),
(8, 'Health'),
(9, 'Groceries'),
(10, 'Automotive'),
(11, 'Jewelry'),
(12, 'Kitchenware'),
(13, 'Pet Supplies'),
(14, 'Office Supplies'),
(15, 'Garden'),
(16, 'Home Decor'),
(17, 'Tools'),
(18, 'Computers'),
(19, 'Shoes'),
(20, 'Music'),
(21, 'Movies'),
(22, 'Art Supplies'),
(23, 'Baby Products'),
(24, 'Outdoor Gear'),
(25, 'Luggage');

-- Value insertion in vendor table --
INSERT INTO Vendor (VendorID, Name, Address, Email, Password, Contact) VALUES
(1, 'Tech Supplies Inc.', '123 Tech Lane, Silicon Valley, CA', 'contact@techsupplies.com', 'password123', '+1-800-123-4567'),
(2, 'Furniture World', '456 Comfort Ave, New York, NY', 'info@furnitureworld.com', 'password456', '+1-800-234-5678'),
(3, 'Fashion Hub', '789 Fashion St, Los Angeles, CA', 'support@fashionhub.com', 'password789', '+1-800-345-6789'),
(4, 'Book Haven', '321 Book Rd, Boston, MA', 'contact@bookhaven.com', 'password012', '+1-800-456-7890'),
(5, 'Toyland', '654 Toy Ave, Chicago, IL', 'info@toyland.com', 'password345', '+1-800-567-8901'),
(6, 'Sports Gear Pro', '987 Sports Blvd, Miami, FL', 'sales@sportsgearpro.com', 'password678', '+1-800-678-9012'),
(7, 'Beauty Essentials', '135 Beauty Ln, Dallas, TX', 'support@beautyessentials.com', 'password901', '+1-800-789-0123'),
(8, 'Health Mart', '246 Health St, San Francisco, CA', 'info@healthmart.com', 'password234', '+1-800-890-1234'),
(9, 'Fresh Groceries', '111 Fresh Rd, Seattle, WA', 'contact@freshgroceries.com', 'password567', '+1-800-901-2345'),
(10, 'Auto Parts Express', '222 Auto Blvd, Detroit, MI', 'sales@autopartsexpress.com', 'password890', '+1-800-012-3456'),
(11, 'Golden Jewelry', '333 Gold Ave, Houston, TX', 'info@goldenjewelry.com', 'password1234', '+1-800-123-4568'),
(12, 'Kitchen Masters', '444 Kitchen Rd, Denver, CO', 'support@kitchenmasters.com', 'password5678', '+1-800-234-5679'),
(13, 'Pet World', '555 Pet Blvd, Austin, TX', 'contact@petworld.com', 'password987', '+1-800-345-6780'),
(14, 'Office Supplies Plus', '666 Office St, Phoenix, AZ', 'info@officesuppliesplus.com', 'password3456', '+1-800-456-7891'),
(15, 'Garden Supplies Co.', '777 Garden Ln, Portland, OR', 'sales@gardensuppliesco.com', 'password6789', '+1-800-567-8902'),
(16, 'Home Decor Inc.', '888 Decor Dr, Atlanta, GA', 'contact@homedecorinc.com', 'password12345', '+1-800-678-9013'),
(17, 'Tool Masters', '999 Tool Ave, Las Vegas, NV', 'info@toolmasters.com', 'password54321', '+1-800-789-0124'),
(18, 'Computer Tech', '1010 Tech Blvd, San Diego, CA', 'support@computertech.com', 'password67890', '+1-800-890-1235'),
(19, 'Shoe World', '1111 Shoe St, Orlando, FL', 'sales@shoeworld.com', 'password1122', '+1-800-901-2346'),
(20, 'Music Instruments Co.', '1212 Music Rd, Nashville, TN', 'contact@musicinstrumentsco.com', 'password3344', '+1-800-012-3457'),
(21, 'Movie Mania', '1313 Cinema Blvd, Hollywood, CA', 'info@moviemania.com', 'password5566', '+1-800-123-4569'),
(22, 'Art Supplies Hub', '1414 Art Ln, Minneapolis, MN', 'sales@artsupplieshub.com', 'password7788', '+1-800-234-5670'),
(23, 'Baby World', '1515 Baby Blvd, Salt Lake City, UT', 'info@babyworld.com', 'password9900', '+1-800-345-6781'),
(24, 'Outdoor Gear Store', '1616 Outdoor St, Denver, CO', 'contact@outdoorgearstore.com', 'password1122', '+1-800-456-7892'),
(25, 'Luggage Express', '1717 Travel Rd, Miami, FL', 'info@luggageexpress.com', 'password3344', '+1-800-567-8903'),
(26, 'Gadget World', '1818 Gadget St, Chicago, IL', 'sales@gadgetworld.com', 'password5566', '+1-800-678-9014'),
(27, 'Bicycle Shop', '1919 Cycle Ln, Portland, OR', 'contact@bicycleshop.com', 'password7788', '+1-800-789-0125'),
(28, 'Camping Gear Co.', '2020 Camp Rd, Seattle, WA', 'info@campinggearco.com', 'password9900', '+1-800-890-1236'),
(29, 'Smart Home Devices', '2121 Smart St, Austin, TX', 'support@smarthomedevices.com', 'password112233', '+1-800-901-2347'),
(30, 'Electronic Gadgets', '2222 Tech Road, Los Angeles, CA', 'sales@electronicgadgets.com', 'password445566', '+1-800-012-3458'),
(31, 'Mobile World', '2323 Mobile Ave, Dallas, TX', 'info@mobileworld.com', 'password667788', '+1-800-123-4567'),
(32, 'Luxury Watches', '2424 Luxury Blvd, New York, NY', 'contact@luxurywatches.com', 'password889900', '+1-800-234-5678'),
(33, 'Home Appliances', '2525 Appliance St, San Francisco, CA', 'sales@homeappliances.com', 'password101010', '+1-800-345-6789'),
(34, 'SuperMart', '2626 Super Rd, Chicago, IL', 'info@supermart.com', 'password121212', '+1-800-456-7890'),
(35, 'Gourmet Delights', '2727 Gourmet Ave, Seattle, WA', 'support@gourmetdelights.com', 'password131313', '+1-800-567-8901'),
(36, 'Outdoor Adventure', '2828 Adventure Rd, Denver, CO', 'contact@outdooradventure.com', 'password141414', '+1-800-678-9012'),
(37, 'Art Gallery', '2929 Art St, Miami, FL', 'sales@artgallery.com', 'password151515', '+1-800-789-0123'),
(38, 'Beverage World', '3030 Beverage Blvd, Los Angeles, CA', 'info@beverageworld.com', 'password161616', '+1-800-890-1234'),
(39, 'Travel Accessories', '3131 Travel St, Austin, TX', 'contact@travelaccessories.com', 'password171717', '+1-800-901-2345'),
(40, 'Pet Supplies Plus', '3232 Pet Rd, Portland, OR', 'sales@petsuppliesplus.com', 'password181818', '+1-800-012-3456'),
(41, 'Fitness Gear', '3333 Fitness Blvd, San Diego, CA', 'info@fitnessgear.com', 'password191919', '+1-800-123-4568'),
(42, 'Office Furniture', '3434 Office St, New York, NY', 'support@officefurniture.com', 'password202020', '+1-800-234-5679'),
(43, 'Camping World', '3535 Camp Ln, Dallas, TX', 'contact@campingworld.com', 'password212121', '+1-800-345-6782'),
(44, 'Healthy Foods', '3636 Health Ave, Seattle, WA', 'sales@healthyfoods.com', 'password222222', '+1-800-456-7893'),
(45, 'Smart Gadgets', '3737 Smart Rd, Miami, FL', 'info@smartgadgets.com', 'password232323', '+1-800-567-8904'),
(46, 'Cycling Gear', '3838 Cycle Blvd, Austin, TX', 'sales@cyclinggear.com', 'password242424', '+1-800-678-9015'),
(47, 'Electronic Accessories', '3939 Gadget St, Chicago, IL', 'contact@electronicaccessories.com', 'password252525', '+1-800-789-0126'),
(48, 'Gaming World', '4040 Game Rd, San Francisco, CA', 'support@gamingworld.com', 'password262626', '+1-800-890-1237'),
(49, 'Mobile Accessories', '4141 Mobile Blvd, Portland, OR', 'sales@mobileaccessories.com', 'password272727', '+1-800-901-2348'),
(50, 'Tech Gadgets Co.', '4242 Tech Ln, New York, NY', 'info@techgadgetsco.com', 'password282828', '+1-800-012-3459');

-- Value insertion in product table --
INSERT INTO Product (ProductID, ProductName, CategoryID) VALUES
(1, 'Laptop', 1),
(2, 'Smartphone', 1),
(3, 'Headphones', 1),
(4, 'Smart Watch', 1),
(5, 'Camera', 1),
(6, 'Washing Machine', 2),
(7, 'Refrigerator', 2),
(8, 'Microwave Oven', 2),
(9, 'Blender', 2),
(10, 'Vacuum Cleaner', 2),
(11, 'Dining Table', 3),
(12, 'Sofa', 3),
(13, 'Bed', 3),
(14, 'Bookshelf', 3),
(15, 'Chair', 3),
(16, 'T-Shirt', 4),
(17, 'Jeans', 4),
(18, 'Jacket', 4),
(19, 'Sweater', 4),
(20, 'Sneakers', 4),
(21, 'Action Figure', 5),
(22, 'Doll', 5),
(23, 'Puzzle', 5),
(24, 'Board Game', 5),
(25, 'Stuffed Toy', 5),
(26, 'Guitar', 6),
(27, 'Piano', 6),
(28, 'Drum Kit', 6),
(29, 'Violin', 6),
(30, 'Microphone', 6),
(31, 'Fishing Rod', 7),
(32, 'Tennis Racket', 7),
(33, 'Football', 7),
(34, 'Basketball', 7),
(35, 'Baseball Glove', 7),
(36, 'Cooking Pot', 8),
(37, 'Knife Set', 8),
(38, 'Frying Pan', 8),
(39, 'Cutlery Set', 8),
(40, 'Coffee Maker', 8),
(41, 'Carpet', 9),
(42, 'Curtains', 9),
(43, 'Wall Art', 9),
(44, 'Lampshade', 9),
(45, 'Rug', 9),
(46, 'Camping Tent', 10),
(47, 'Sleeping Bag', 10),
(48, 'Backpack', 10),
(49, 'Camp Stove', 10),
(50, 'Flashlight', 10);

-- Value insertion in vendor product table --
INSERT INTO VendorProduct (VendorProductID, VendorID, ProductID, Price, Quantity, Description) VALUES
(1, 1, 1, 1000.00, 50, 'High performance laptop for gaming and professional use.'),
(2, 2, 2, 600.00, 100, 'Latest smartphone with high-resolution camera and fast processor.'),
(3, 3, 3, 150.00, 200, 'Noise-cancelling headphones for an immersive experience.'),
(4, 4, 4, 200.00, 150, 'Smartwatch with fitness tracking and heart rate monitor.'),
(5, 5, 5, 800.00, 80, 'Professional camera with high-definition video recording.'),
(6, 6, 6, 350.00, 70, 'Washing machine with advanced wash modes and energy efficiency.'),
(7, 7, 7, 500.00, 50, 'Refrigerator with large capacity and energy-saving features.'),
(8, 8, 8, 120.00, 60, 'Compact microwave oven with multiple cooking settings.'),
(9, 9, 9, 40.00, 100, 'Blender for smoothies and other kitchen applications.'),
(10, 10, 10, 100.00, 120, 'Vacuum cleaner with powerful suction and multi-surface capability.'),
(11, 11, 11, 300.00, 25, 'Modern dining table with four chairs, made from premium wood.'),
(12, 12, 12, 500.00, 30, 'Comfortable sofa with soft cushions and modern design.'),
(13, 13, 13, 700.00, 15, 'Spacious bed with memory foam mattress for ultimate comfort.'),
(14, 14, 14, 100.00, 60, 'Bookshelf made from solid oak wood, holds up to 100 books.'),
(15, 15, 15, 50.00, 200, 'Ergonomic chair for office or home use, adjustable and comfortable.'),
(16, 16, 16, 20.00, 500, 'Comfortable cotton T-shirt with various colors and sizes available.'),
(17, 17, 17, 40.00, 300, 'Stylish jeans for men and women, fits various body types.'),
(18, 18, 18, 80.00, 150, 'Warm and cozy jacket for winter, with multiple sizes available.'),
(19, 19, 19, 60.00, 250, 'Soft wool sweater, perfect for cold weather and layering.'),
(20, 20, 20, 70.00, 180, 'Durable sneakers with great grip and comfort for everyday wear.'),
(21, 21, 21, 25.00, 400, 'Superhero action figure with movable parts for imaginative play.'),
(22, 22, 22, 15.00, 600, 'Doll with clothes and accessories, perfect for gifting.'),
(23, 23, 23, 10.00, 800, 'Colorful puzzle set with 1000 pieces for all ages.'),
(24, 24, 24, 20.00, 500, 'Board game with strategic gameplay for family fun.'),
(25, 25, 25, 12.00, 1000, 'Soft stuffed toy for kids, safe and cuddly.'),
(26, 26, 26, 200.00, 40, 'Electric guitar, beginner-friendly and great for practice.'),
(27, 27, 27, 500.00, 25, 'Grand piano with exceptional sound quality and elegant design.'),
(28, 28, 28, 300.00, 35, 'Complete drum kit for beginners and professionals alike.'),
(29, 29, 29, 150.00, 50, 'Violin with high-quality strings and a durable wooden body.'),
(30, 30, 30, 100.00, 70, 'Dynamic microphone for clear sound recording and live performance.'),
(31, 31, 31, 50.00, 100, 'Fishing rod with durable material for outdoor use.'),
(32, 32, 32, 70.00, 150, 'Tennis racket with lightweight frame and excellent grip.'),
(33, 33, 33, 40.00, 200, 'Official size football with durable stitching and design.'),
(34, 34, 34, 60.00, 120, 'Basketball with non-slip grip for professional play.'),
(35, 35, 35, 35.00, 250, 'Baseball glove with leather material for easy catching.'),
(36, 36, 36, 25.00, 300, 'Cooking pot with non-stick surface for efficient cooking.'),
(37, 37, 37, 80.00, 150, 'Professional knife set for all kitchen tasks, with wooden block.'),
(38, 38, 38, 45.00, 200, 'Frying pan with heat-resistant handle and non-stick surface.'),
(39, 39, 39, 30.00, 400, 'Cutlery set with knives, forks, spoons, and serving utensils.'),
(40, 40, 40, 120.00, 90, 'Coffee maker with brewing timer and automatic shut-off.'),
(41, 41, 41, 100.00, 120, 'Stylish carpet, suitable for living rooms and offices.'),
(42, 42, 42, 50.00, 180, 'Curtains in various colors and sizes, made from durable fabric.'),
(43, 43, 43, 75.00, 200, 'Wall art in various styles, perfect for home decoration.'),
(44, 44, 44, 30.00, 250, 'Lampshade with modern design to fit various room styles.'),
(45, 45, 45, 90.00, 100, 'Luxurious rug, soft texture, and easy to maintain.'),
(46, 46, 46, 150.00, 60, 'Camping tent for four people with waterproof coating.'),
(47, 47, 47, 50.00, 100, 'Sleeping bag suitable for all seasons, warm and comfortable.'),
(48, 48, 48, 40.00, 150, 'Travel backpack with multiple compartments for organization.'),
(49, 49, 49, 80.00, 100, 'Camp stove with adjustable flame for outdoor cooking.'),
(50, 50, 50, 25.00, 300, 'High-quality flashlight with long battery life and durable casing.');

-- Value insertion in courier table --
INSERT INTO Courier (CourierID, Name, Contact) VALUES
(1, 'FedEx', '1-800-463-3339'),
(2, 'UPS', '1-800-742-5877'),
(3, 'DHL', '1-800-225-5345'),
(4, 'USPS', '1-800-275-8777'),
(5, 'Canada Post', '1-800-267-1177'),
(6, 'Royal Mail', '03457 740 740'),
(7, 'Australia Post', '13 13 18'),
(8, 'Japan Post', '0120-23-3100'),
(9, 'Hermes', '0330 333 6556'),
(10, 'Singapore Post', '1605'),
(11, 'TNT Express', '1-800-558-5555'),
(12, 'Aramex', '1-800-544-000'),
(13, 'YRC Freight', '1-800-610-6500'),
(14, 'Purolator', '1-888-744-7123'),
(15, 'GLS', '1-800-322-5555'),
(16, 'OnTrac', '1-800-334-5000'),
(17, 'Speed Post', '1800-11-2011'),
(18, 'La Poste', '3631'),
(19, 'PostNL', '0900 0990'),
(20, 'China Post', '11183'),
(21, 'Korea Post', '1588-1300'),
(22, 'India Post', '1800-11-2011'),
(23, 'EMS', '1-800-222-1811'),
(24, 'XPO Logistics', '1-800-877-5675'),
(25, 'ZTO Express', '400-826-6666'),
(26, 'Yamato Transport', '0570-200-000'),
(27, 'Schenker', '1-800-777-5555'),
(28, 'C.H. Robinson', '1-800-323-7587'),
(29, 'DB Schenker', '1-800-722-1012'),
(30, 'LBC Express', '1-800-10-858-5999'),
(31, 'Asendia', '1-800-229-8727'),
(32, 'Toll Group', '1800-465-546'),
(33, 'Poste Italiane', '803 160'),
(34, 'Ecom Express', '1800-120-3743'),
(35, 'DHL Express', '1-800-225-5345'),
(36, 'DHL eCommerce', '1-800-805-5800'),
(37, 'Royal Mail International', '03457 740 740'),
(38, 'Canada Post Expedited', '1-800-267-1177'),
(39, 'FedEx Ground', '1-800-463-3339'),
(40, 'UPS Freight', '1-800-333-7400'),
(41, 'Global Post', '1-800-805-5800'),
(42, 'TNT Air Freight', '1-800-558-5555'),
(43, 'SPSR Express', '8-800-100-05-50'),
(44, 'SF Express', '95338'),
(45, 'An Post', '1800 36 36 36'),
(46, 'Estafeta', '01-800-362-7842'),
(47, 'OmniPost', '1-800-987-2222'),
(48, 'A1 Express', '1-800-228-9020'),
(49, 'Interlink Express', '0333 144 0316'),
(50, 'Express Shipping', '1-800-555-6666');

-- Value insertion in vendor courier table --
INSERT INTO VendorCourier (VendorCourierID, VendorID, CourierID) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
(9, 2, 9),
(10, 2, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 3, 15),
(16, 4, 16),
(17, 4, 17),
(18, 4, 18),
(19, 4, 19),
(20, 4, 20),
(21, 5, 21),
(22, 5, 22),
(23, 5, 23),
(24, 5, 24),
(25, 5, 25);

-- Value insertion in order value --
INSERT INTO Orders (OrderID, CustomerID, OrderDate, AddressID, VendorCourierID, TrackingID) VALUES
(1, 1, '2025-04-01', 1, 1, 'TRACK123456'),
(2, 2, '2025-04-02', 2, 2, 'TRACK123457'),
(3, 3, '2025-04-03', 3, 3, 'TRACK123458'),
(4, 4, '2025-04-04', 4, 4, 'TRACK123459'),
(5, 5, '2025-04-05', 5, 5, 'TRACK123460'),
(6, 6, '2025-04-06', 6, 6, 'TRACK123461'),
(7, 7, '2025-04-07', 7, 7, 'TRACK123462'),
(8, 8, '2025-04-08', 8, 8, 'TRACK123463'),
(9, 9, '2025-04-09', 9, 9, 'TRACK123464'),
(10, 10, '2025-04-10', 10, 10, 'TRACK123465'),
(11, 11, '2025-04-11', 11, 11, 'TRACK123466'),
(12, 12, '2025-04-12', 12, 12, 'TRACK123467'),
(13, 13, '2025-04-13', 13, 13, 'TRACK123468'),
(14, 14, '2025-04-14', 14, 14, 'TRACK123469'),
(15, 15, '2025-04-15', 15, 15, 'TRACK123470'),
(16, 16, '2025-04-16', 16, 16, 'TRACK123471'),
(17, 17, '2025-04-17', 17, 17, 'TRACK123472'),
(18, 18, '2025-04-18', 18, 18, 'TRACK123473'),
(19, 19, '2025-04-19', 19, 19, 'TRACK123474'),
(20, 20, '2025-04-20', 20, 20, 'TRACK123475'),
(21, 21, '2025-04-21', 21, 21, 'TRACK123476'),
(22, 22, '2025-04-22', 22, 22, 'TRACK123477'),
(23, 23, '2025-04-23', 23, 23, 'TRACK123478'),
(24, 24, '2025-04-24', 24, 24, 'TRACK123479'),
(25, 25, '2025-04-25', 25, 25, 'TRACK123480');

-- Value insertion in orderedProduct table --
INSERT INTO OrderedProduct (OrderedProductID, VendorProductID, OrderID, Quantity) VALUES
(1, 1, 1, 2),
(2, 2, 1, 1),
(3, 3, 2, 3),
(4, 4, 2, 1),
(5, 5, 3, 2),
(6, 6, 3, 5),
(7, 7, 4, 1),
(8, 8, 4, 4),
(9, 9, 5, 6),
(10, 10, 5, 2),
(11, 11, 6, 3),
(12, 12, 6, 1),
(13, 13, 7, 4),
(14, 14, 7, 2),
(15, 15, 8, 5),
(16, 16, 8, 3),
(17, 17, 9, 2),
(18, 18, 9, 4),
(19, 19, 10, 6),
(20, 20, 10, 3),
(21, 21, 11, 1),
(22, 22, 11, 5),
(23, 23, 12, 4),
(24, 24, 12, 2),
(25, 25, 13, 6);

-- Value insertion in review table --
INSERT INTO Review (ReviewID, Rating, Comment, CustomerID, OrderedProductID) VALUES
(1, 5, 'Excellent product, highly recommend!', 1, 1),
(2, 4, 'Good quality but arrived a little late.', 2, 2),
(3, 3, 'Decent product, not exactly as expected.', 3, 3),
(4, 5, 'Loved it! Exactly what I was looking for.', 4, 4),
(5, 2, 'The product broke after a week of use.', 5, 5),
(6, 1, 'Very poor quality. I will not buy again.', 6, 6),
(7, 4, 'Great value for money. Satisfied with my purchase.', 7, 7),
(8, 3, 'Product was fine, but the customer service was terrible.', 8, 8),
(9, 5, 'Amazing! Exceeded my expectations!', 9, 9),
(10, 4, 'Very good, but shipping took longer than I hoped.', 10, 10),
(11, 3, 'It’s okay, but the color didn’t match the picture.', 11, 11),
(12, 2, 'Not worth the price. I regret purchasing it.', 12, 12),
(13, 4, 'Nice product, would buy again.', 13, 13),
(14, 5, 'Fantastic quality, I am very happy with this item.', 14, 14),
(15, 3, 'It works well, but a little disappointed with the size.', 15, 15);

-- Value insertion in cart table --
INSERT INTO Cart (CartID, DateCreated, CustomerID) VALUES
(1, '2025-04-01', 1),
(2, '2025-04-02', 2),
(3, '2025-04-03', 3),
(4, '2025-04-04', 4),
(5, '2025-04-05', 5),
(6, '2025-04-06', 6),
(7, '2025-04-07', 7),
(8, '2025-04-08', 8),
(9, '2025-04-09', 9),
(10, '2025-04-10', 10),
(11, '2025-04-11', 11),
(12, '2025-04-12', 12),
(13, '2025-04-13', 13),
(14, '2025-04-14', 14),
(15, '2025-04-15', 15),
(16, '2025-04-16', 16),
(17, '2025-04-17', 17),
(18, '2025-04-18', 18),
(19, '2025-04-19', 19),
(20, '2025-04-20', 20),
(21, '2025-04-21', 21),
(22, '2025-04-22', 22),
(23, '2025-04-23', 23),
(24, '2025-04-24', 24),
(25, '2025-04-25', 25);

-- Values insertion in cartProduct table --
INSERT INTO CartProduct (CartProductID, VendorProductID, Quantity, CartID) VALUES
(1, 1, 2, 1),
(2, 2, 1, 1),
(3, 3, 4, 2),
(4, 4, 2, 2),
(5, 5, 3, 3),
(6, 6, 5, 3),
(7, 7, 1, 4),
(8, 8, 6, 4),
(9, 9, 2, 5),
(10, 10, 3, 5),
(11, 11, 4, 6),
(12, 12, 2, 6),
(13, 13, 3, 7),
(14, 14, 5, 7),
(15, 15, 1, 8),
(16, 16, 4, 8),
(17, 17, 2, 9),
(18, 18, 3, 9),
(19, 19, 1, 10),
(20, 20, 5, 10),
(21, 21, 2, 11),
(22, 22, 4, 11),
(23, 23, 3, 12),
(24, 24, 6, 12),
(25, 25, 1, 13);

--  Stored Procedure to Get Customer Information by CustomerID --
DELIMITER //

CREATE PROCEDURE GetCustomerInfo (
    IN inputCustomerID INT,
    OUT outputFirstName VARCHAR(255),
    OUT outputLastName VARCHAR(255),
    OUT outputDOB DATE,
    OUT outputEmail VARCHAR(255),
    OUT outputContact VARCHAR(255)
)
BEGIN
    SELECT FirstName, LastName, DOB, Email, Contact
    INTO outputFirstName, outputLastName, outputDOB, outputEmail, outputContact
    FROM Customer
    WHERE CustomerID = inputCustomerID;
END //

DELIMITER ;

-- Stored Procedure to Update Customer Contact Information --
DELIMITER //

CREATE PROCEDURE UpdateCustomerContact (
    IN inputCustomerID INT,
    IN inputNewContact VARCHAR(255),
    OUT outputMessage VARCHAR(255)
)
BEGIN
    UPDATE Customer
    SET Contact = inputNewContact
    WHERE CustomerID = inputCustomerID;

    IF ROW_COUNT() > 0 THEN
        SET outputMessage = 'Contact updated successfully';
    ELSE
        SET outputMessage = 'Customer not found';
    END IF;
END //

DELIMITER ;



-- Stored Procedure to Retrieve All Address Records --
DELIMITER //

CREATE PROCEDURE GetAllAddresses()
BEGIN
    SELECT * FROM Address;
END //

DELIMITER ;

-- Stored Procedure to Insert a New Category --
DELIMITER //


-- Stored Procedure to Insert a New Category --
DELIMITER //

CREATE PROCEDURE InsertCategory (
    IN inputCategoryID INT,
    IN inputCategoryName VARCHAR(255)
)
BEGIN
    INSERT INTO Category (CategoryID, CategoryName)
    VALUES (inputCategoryID, inputCategoryName);
END //

DELIMITER ;

-- Stored Procedure to Retrieve Category Information by CategoryID --
DELIMITER //

CREATE PROCEDURE GetCategoryByID (
    IN inputCategoryID INT,
    OUT outputCategoryName VARCHAR(255)
)
BEGIN
    SELECT CategoryName
    INTO outputCategoryName
    FROM Category
    WHERE CategoryID = inputCategoryID;
END //

DELIMITER ;









