USE [global-azure-2025]
GO

INSERT INTO [dbo].[SalesOrder]
           ([Id]
           ,[OrderNumber]
           ,[CustomerId]
           ,[CustomerName]
           ,[OrderDate]
           ,[DeliveryDate]
           ,[Status])
     VALUES
           (NEWID(),
           '20250615-1155',
           NEWID(),
           'Il Grottino del Muflone',
           '2025-06-15 12:00:00',
           '2025-06-30 12:00:00',
           'created')
GO


