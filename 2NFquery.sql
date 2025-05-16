-- Create the OrderLineItems table
CREATE TABLE OrderLineItems (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, Product), -- Composite Primary Key
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) -- Foreign Key Constraint
);

-- Populate the OrderLineItems table from the original OrderDetails
INSERT INTO OrderLineItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;