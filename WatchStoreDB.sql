
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/03/2020 01:12:40
-- Generated from EDMX file: C:\Users\Youcode\source\repos\WatchStore\WatchStore.Data\WatchStoreDbModels.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [WatchStore];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_FKCategory659318]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Category] DROP CONSTRAINT [FK_FKCategory659318];
GO
IF OBJECT_ID(N'[dbo].[FK_FKDiscount_P183819]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Discount_Product] DROP CONSTRAINT [FK_FKDiscount_P183819];
GO
IF OBJECT_ID(N'[dbo].[FK_FKDiscount_P926886]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Discount_Product] DROP CONSTRAINT [FK_FKDiscount_P926886];
GO
IF OBJECT_ID(N'[dbo].[FK_FKOrder_deta379629]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order_details] DROP CONSTRAINT [FK_FKOrder_deta379629];
GO
IF OBJECT_ID(N'[dbo].[FK_FKOrder_deta942081]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order_details] DROP CONSTRAINT [FK_FKOrder_deta942081];
GO
IF OBJECT_ID(N'[dbo].[FK_FKProduct365906]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_FKProduct365906];
GO
IF OBJECT_ID(N'[dbo].[FK_FKReview837460]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Review] DROP CONSTRAINT [FK_FKReview837460];
GO
IF OBJECT_ID(N'[dbo].[FK_FKReview970746]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Review] DROP CONSTRAINT [FK_FKReview970746];
GO
IF OBJECT_ID(N'[dbo].[FK_FKTags_Produ186786]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tags_Product] DROP CONSTRAINT [FK_FKTags_Produ186786];
GO
IF OBJECT_ID(N'[dbo].[FK_FKTags_Produ292557]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tags_Product] DROP CONSTRAINT [FK_FKTags_Produ292557];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductImages] DROP CONSTRAINT [FK_ProductID];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[__MigrationHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[__MigrationHistory];
GO
IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[Category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category];
GO
IF OBJECT_ID(N'[dbo].[Discount]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Discount];
GO
IF OBJECT_ID(N'[dbo].[Discount_Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Discount_Product];
GO
IF OBJECT_ID(N'[dbo].[Order]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order];
GO
IF OBJECT_ID(N'[dbo].[Order_details]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order_details];
GO
IF OBJECT_ID(N'[dbo].[Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product];
GO
IF OBJECT_ID(N'[dbo].[ProductImages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductImages];
GO
IF OBJECT_ID(N'[dbo].[Review]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Review];
GO
IF OBJECT_ID(N'[dbo].[Tags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tags];
GO
IF OBJECT_ID(N'[dbo].[Tags_Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tags_Product];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'C__MigrationHistory'
CREATE TABLE [dbo].[C__MigrationHistory] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ContextKey] nvarchar(300)  NOT NULL,
    [Model] varbinary(max)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [CategoryID] int  NULL,
    [CategorieName] varchar(255)  NULL,
    [CategorieIcon] varchar(255)  NULL
);
GO

-- Creating table 'Discounts'
CREATE TABLE [dbo].[Discounts] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Percent] real  NOT NULL,
    [Created_at] datetime  NULL,
    [Expiration_date] datetime  NULL
);
GO

-- Creating table 'Discount_Product'
CREATE TABLE [dbo].[Discount_Product] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DiscountID] int  NOT NULL,
    [ProductID] int  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Date] datetime  NULL
);
GO

-- Creating table 'Order_details'
CREATE TABLE [dbo].[Order_details] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Quantity] int  NOT NULL,
    [StatusOrder] varchar(255)  NULL,
    [TotalPrice] real  NOT NULL,
    [SubTotalPrice] real  NOT NULL,
    [ProductID] int  NULL,
    [OrderID] int  NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [CategoryID] int  NULL,
    [Name] varchar(255)  NULL,
    [Price] real  NULL,
    [Desc] varchar(255)  NULL,
    [Created_at] datetime  NULL,
    [Udated_at] datetime  NULL,
    [TagName] varchar(255)  NULL,
    [inStock] int  NULL,
    [ReviewsNumber] int  NULL,
    [Poster] varchar(255)  NULL,
    [Note] float  NULL
);
GO

-- Creating table 'ProductImages'
CREATE TABLE [dbo].[ProductImages] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [imgUrl] varchar(255)  NOT NULL,
    [ProductID] int  NULL
);
GO

-- Creating table 'Reviews'
CREATE TABLE [dbo].[Reviews] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [UserID] int  NOT NULL,
    [ProductID] int  NOT NULL,
    [Created_at] datetime  NULL,
    [Review_content] varchar(255)  NULL,
    [Note] float  NULL
);
GO

-- Creating table 'Tags'
CREATE TABLE [dbo].[Tags] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [TagName] varchar(255)  NULL
);
GO

-- Creating table 'Tags_Product'
CREATE TABLE [dbo].[Tags_Product] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TagsID] int  NOT NULL,
    [ProductID] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [LoginStatus] varchar(255)  NULL,
    [FirstName] varchar(255)  NULL,
    [LastName] varchar(255)  NULL,
    [Phone] varchar(255)  NULL,
    [Sexe] varchar(255)  NULL,
    [AccountAdress] varchar(255)  NULL,
    [ShippingAdress] varchar(255)  NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers_Id] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MigrationId], [ContextKey] in table 'C__MigrationHistory'
ALTER TABLE [dbo].[C__MigrationHistory]
ADD CONSTRAINT [PK_C__MigrationHistory]
    PRIMARY KEY CLUSTERED ([MigrationId], [ContextKey] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ID] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Discounts'
ALTER TABLE [dbo].[Discounts]
ADD CONSTRAINT [PK_Discounts]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Id] in table 'Discount_Product'
ALTER TABLE [dbo].[Discount_Product]
ADD CONSTRAINT [PK_Discount_Product]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Order_details'
ALTER TABLE [dbo].[Order_details]
ADD CONSTRAINT [PK_Order_details]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Id] in table 'ProductImages'
ALTER TABLE [dbo].[ProductImages]
ADD CONSTRAINT [PK_ProductImages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ID] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [PK_Reviews]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Tags'
ALTER TABLE [dbo].[Tags]
ADD CONSTRAINT [PK_Tags]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Id] in table 'Tags_Product'
ALTER TABLE [dbo].[Tags_Product]
ADD CONSTRAINT [PK_Tags_Product]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [CategoryID] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [FK_FKCategory659318]
    FOREIGN KEY ([CategoryID])
    REFERENCES [dbo].[Categories]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKCategory659318'
CREATE INDEX [IX_FK_FKCategory659318]
ON [dbo].[Categories]
    ([CategoryID]);
GO

-- Creating foreign key on [CategoryID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_FKProduct365906]
    FOREIGN KEY ([CategoryID])
    REFERENCES [dbo].[Categories]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKProduct365906'
CREATE INDEX [IX_FK_FKProduct365906]
ON [dbo].[Products]
    ([CategoryID]);
GO

-- Creating foreign key on [DiscountID] in table 'Discount_Product'
ALTER TABLE [dbo].[Discount_Product]
ADD CONSTRAINT [FK_FKDiscount_P183819]
    FOREIGN KEY ([DiscountID])
    REFERENCES [dbo].[Discounts]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKDiscount_P183819'
CREATE INDEX [IX_FK_FKDiscount_P183819]
ON [dbo].[Discount_Product]
    ([DiscountID]);
GO

-- Creating foreign key on [ProductID] in table 'Discount_Product'
ALTER TABLE [dbo].[Discount_Product]
ADD CONSTRAINT [FK_FKDiscount_P926886]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKDiscount_P926886'
CREATE INDEX [IX_FK_FKDiscount_P926886]
ON [dbo].[Discount_Product]
    ([ProductID]);
GO

-- Creating foreign key on [OrderID] in table 'Order_details'
ALTER TABLE [dbo].[Order_details]
ADD CONSTRAINT [FK_FKOrder_deta379629]
    FOREIGN KEY ([OrderID])
    REFERENCES [dbo].[Orders]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKOrder_deta379629'
CREATE INDEX [IX_FK_FKOrder_deta379629]
ON [dbo].[Order_details]
    ([OrderID]);
GO

-- Creating foreign key on [ProductID] in table 'Order_details'
ALTER TABLE [dbo].[Order_details]
ADD CONSTRAINT [FK_FKOrder_deta942081]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKOrder_deta942081'
CREATE INDEX [IX_FK_FKOrder_deta942081]
ON [dbo].[Order_details]
    ([ProductID]);
GO

-- Creating foreign key on [ProductID] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [FK_FKReview837460]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKReview837460'
CREATE INDEX [IX_FK_FKReview837460]
ON [dbo].[Reviews]
    ([ProductID]);
GO

-- Creating foreign key on [ProductID] in table 'Tags_Product'
ALTER TABLE [dbo].[Tags_Product]
ADD CONSTRAINT [FK_FKTags_Produ292557]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKTags_Produ292557'
CREATE INDEX [IX_FK_FKTags_Produ292557]
ON [dbo].[Tags_Product]
    ([ProductID]);
GO

-- Creating foreign key on [ProductID] in table 'ProductImages'
ALTER TABLE [dbo].[ProductImages]
ADD CONSTRAINT [FK_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductID'
CREATE INDEX [IX_FK_ProductID]
ON [dbo].[ProductImages]
    ([ProductID]);
GO

-- Creating foreign key on [UserID] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [FK_FKReview970746]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[Users]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKReview970746'
CREATE INDEX [IX_FK_FKReview970746]
ON [dbo].[Reviews]
    ([UserID]);
GO

-- Creating foreign key on [TagsID] in table 'Tags_Product'
ALTER TABLE [dbo].[Tags_Product]
ADD CONSTRAINT [FK_FKTags_Produ186786]
    FOREIGN KEY ([TagsID])
    REFERENCES [dbo].[Tags]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKTags_Produ186786'
CREATE INDEX [IX_FK_FKTags_Produ186786]
ON [dbo].[Tags_Product]
    ([TagsID]);
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRole]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUser]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUser]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------