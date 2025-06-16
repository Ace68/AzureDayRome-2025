SELECT OrderId, JSON_VALUE(OrderDetails, '$.CustomerName') AS CustomerName
FROM JsonOrders