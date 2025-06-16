DECLARE @orderDetails NVARCHAR(100) = '{"CustomerId":"12345","CustomerName":"Unknown"}';

UPDATE JsonOrders
SET OrderDetails = JSON_MODIFY(@orderDetails, '$.CustomerName', 'Il Grottino del Muflone')
WHERE OrderId = 2025;