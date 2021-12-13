
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/08/2021 22:17:16
-- Generated from EDMX file: C:\Users\pavilion\source\repos\demka\demka\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [kai];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Login] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Role] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PrepodSet'
CREATE TABLE [dbo].[PrepodSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FIO] nvarchar(max)  NOT NULL,
    [Position] nvarchar(max)  NOT NULL,
    [PersonalData] nvarchar(max)  NOT NULL,
    [Photo] nvarchar(max)  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'StudentSet'
CREATE TABLE [dbo].[StudentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FIO] nvarchar(max)  NOT NULL,
    [NumberGroup] int  NOT NULL,
    [Photo] nvarchar(max)  NOT NULL,
    [PersonalData] nvarchar(max)  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'AdminSet'
CREATE TABLE [dbo].[AdminSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FIO] nvarchar(max)  NOT NULL,
    [PersonalData] nvarchar(max)  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'MarkSet'
CREATE TABLE [dbo].[MarkSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SubjectSet'
CREATE TABLE [dbo].[SubjectSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Prepod_Id] int  NOT NULL
);
GO

-- Creating table 'ProgressSet'
CREATE TABLE [dbo].[ProgressSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Data] datetime  NOT NULL,
    [Mark_Id] int  NOT NULL,
    [Subject_Id] int  NOT NULL,
    [Prepod_Id] int  NOT NULL,
    [Student_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PrepodSet'
ALTER TABLE [dbo].[PrepodSet]
ADD CONSTRAINT [PK_PrepodSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StudentSet'
ALTER TABLE [dbo].[StudentSet]
ADD CONSTRAINT [PK_StudentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AdminSet'
ALTER TABLE [dbo].[AdminSet]
ADD CONSTRAINT [PK_AdminSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MarkSet'
ALTER TABLE [dbo].[MarkSet]
ADD CONSTRAINT [PK_MarkSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SubjectSet'
ALTER TABLE [dbo].[SubjectSet]
ADD CONSTRAINT [PK_SubjectSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProgressSet'
ALTER TABLE [dbo].[ProgressSet]
ADD CONSTRAINT [PK_ProgressSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [User_Id] in table 'AdminSet'
ALTER TABLE [dbo].[AdminSet]
ADD CONSTRAINT [FK_UserAdmin]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserAdmin'
CREATE INDEX [IX_FK_UserAdmin]
ON [dbo].[AdminSet]
    ([User_Id]);
GO

-- Creating foreign key on [User_Id] in table 'PrepodSet'
ALTER TABLE [dbo].[PrepodSet]
ADD CONSTRAINT [FK_UserPrepod]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPrepod'
CREATE INDEX [IX_FK_UserPrepod]
ON [dbo].[PrepodSet]
    ([User_Id]);
GO

-- Creating foreign key on [User_Id] in table 'StudentSet'
ALTER TABLE [dbo].[StudentSet]
ADD CONSTRAINT [FK_UserStudent]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserStudent'
CREATE INDEX [IX_FK_UserStudent]
ON [dbo].[StudentSet]
    ([User_Id]);
GO

-- Creating foreign key on [Prepod_Id] in table 'SubjectSet'
ALTER TABLE [dbo].[SubjectSet]
ADD CONSTRAINT [FK_PrepodSubject]
    FOREIGN KEY ([Prepod_Id])
    REFERENCES [dbo].[PrepodSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrepodSubject'
CREATE INDEX [IX_FK_PrepodSubject]
ON [dbo].[SubjectSet]
    ([Prepod_Id]);
GO

-- Creating foreign key on [Mark_Id] in table 'ProgressSet'
ALTER TABLE [dbo].[ProgressSet]
ADD CONSTRAINT [FK_MarkProgress]
    FOREIGN KEY ([Mark_Id])
    REFERENCES [dbo].[MarkSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MarkProgress'
CREATE INDEX [IX_FK_MarkProgress]
ON [dbo].[ProgressSet]
    ([Mark_Id]);
GO

-- Creating foreign key on [Subject_Id] in table 'ProgressSet'
ALTER TABLE [dbo].[ProgressSet]
ADD CONSTRAINT [FK_SubjectProgress]
    FOREIGN KEY ([Subject_Id])
    REFERENCES [dbo].[SubjectSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubjectProgress'
CREATE INDEX [IX_FK_SubjectProgress]
ON [dbo].[ProgressSet]
    ([Subject_Id]);
GO

-- Creating foreign key on [Prepod_Id] in table 'ProgressSet'
ALTER TABLE [dbo].[ProgressSet]
ADD CONSTRAINT [FK_PrepodProgress]
    FOREIGN KEY ([Prepod_Id])
    REFERENCES [dbo].[PrepodSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrepodProgress'
CREATE INDEX [IX_FK_PrepodProgress]
ON [dbo].[ProgressSet]
    ([Prepod_Id]);
GO

-- Creating foreign key on [Student_Id] in table 'ProgressSet'
ALTER TABLE [dbo].[ProgressSet]
ADD CONSTRAINT [FK_StudentProgress]
    FOREIGN KEY ([Student_Id])
    REFERENCES [dbo].[StudentSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentProgress'
CREATE INDEX [IX_FK_StudentProgress]
ON [dbo].[ProgressSet]
    ([Student_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------