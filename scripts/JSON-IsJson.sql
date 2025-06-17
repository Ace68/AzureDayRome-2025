SELECT OrderId, OrderDetails
FROM JsonOrders
WHERE ISJSON(OrderDetails) = 1 