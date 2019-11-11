/*==============================================================*/
/* Table: Shawarma                                              */
/*==============================================================*/
create table Shawarma
(
   ID                   int not null auto_increment,
   Type                 varchar(30) not null,
   Description          varchar(300),
   primary key (ID)
);

/*==============================================================*/
/* Table: Owners                                                */
/*==============================================================*/
create table Owners
(
   ID                   int not null auto_increment,
   Owner_name           varchar(40) not null,
   primary key (ID)
);

/*==============================================================*/
/* Table: Outlets                                               */
/*==============================================================*/
create table Outlets
(
   ID                   int not null auto_increment,
   Owner_ID             int not null,
   Outlet_name          varchar(100) not null,
   primary key (ID),
   constraint FK_OUTLETS_OWNERS_OU_OWNERS foreign key (Owner_ID)
      references Owners (ID) on delete cascade on update cascade
);

/*==============================================================*/
/* Table: Outlet_Shawarma_Price                                 */
/*==============================================================*/
create table Outlet_Shawarma_Price
(
   Outlet_ID            int not null,
   Shawarma_ID          int not null,
   "Price, rubles"      int not null,
   primary key (Outlet_ID, Shawarma_ID),
   constraint FK_OUTLET_S_SHAWARMA__SHAWARMA foreign key (Shawarma_ID)
      references Shawarma (ID) on delete restrict on update restrict,
   constraint FK_OUTLET_S_REFERENCE_OUTLETS foreign key (Outlet_ID)
      references Outlets (ID) on delete restrict on update restrict
);

/*==============================================================*/
/* Index: OUTLET_SHAWARMA_PRICE_UNIQUE                          */
/*==============================================================*/
create unique index OUTLET_SHAWARMA_PRICE_UNIQUE on Outlet_Shawarma_Price
(
   Outlet_ID,
   Shawarma_ID
);

/*==============================================================*/
/* Table: Reviews                                               */
/*==============================================================*/
create table Reviews
(
   ID                   int not null auto_increment,
   Outlet_ID            int not null,
   Review               varchar(500),
   Rating               int not null,
   primary key (ID),
   constraint FK_REVIEWS_REFERENCE_OUTLETS foreign key (Outlet_ID)
      references Outlets (ID) on delete restrict on update restrict
);

/*==============================================================*/
/* Index: UNIQUE_TYPE                                           */
/*==============================================================*/
create unique index UNIQUE_TYPE on Shawarma
(
   Type
);
