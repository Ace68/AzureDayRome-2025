SELECT OrderId, JSON_QUERY(OrderDetails, '$') AS OrderDetails
FROM JsonOrders