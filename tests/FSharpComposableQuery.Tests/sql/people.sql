SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE [master];
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'MyPeople')
                DROP DATABASE MyPeople;
GO

-- Create the MyPeople database.
CREATE DATABASE MyPeople COLLATE SQL_Latin1_General_CP1_CI_AS;
GO

-- Specify a simple recovery model 
-- to keep the log growth to a minimum.
ALTER DATABASE MyPeople
                SET RECOVERY SIMPLE;
GO

USE MyPeople;
GO

CREATE TABLE [dbo].[People] (
    [Name] NVARCHAR (255) NOT NULL,
    [Age]   INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Name],[Age] ASC)
);

CREATE TABLE [dbo].[Couples] (
    [Her] NVARCHAR (255) NOT NULL,
    [Him] NVARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([Her],[Him] ASC)
);

USE MyPeople