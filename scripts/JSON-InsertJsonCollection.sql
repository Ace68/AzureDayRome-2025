USE [AzureDayRome]
GO

INSERT INTO [dbo].[JsonOrders]
           ([OrderId]
           ,[OrderDetails])
     VALUES
           (2025,
           '{
  "CustomerId": "12345",
  "CustomerName": "John Doe"
}' )
GO


