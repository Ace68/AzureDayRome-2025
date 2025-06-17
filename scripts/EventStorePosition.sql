/****** Object:  Table [dbo].[EventStorePosition]    Script Date: 6/15/2025 3:34:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EventStorePosition](
	[Id] [int] NOT NULL,
	[CommitPosition] [bigint] NOT NULL,
	[PreparePosition] [bigint] NOT NULL,
 CONSTRAINT [PK_EventStorePosition_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


