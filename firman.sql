/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     26/04/2021 20:07:00                          */
/*==============================================================*/


drop table if exists BARANG;

drop table if exists PELANGGAN;

drop table if exists PENYEDIAAN;

drop table if exists SALES;

drop table if exists TRANSAKSI;

drop table if exists TRANSAKSI_BELI;

/*==============================================================*/
/* Table: BARANG                                                */
/*==============================================================*/
create table BARANG
(
   ID_BRG               int not null,
   NM_BRG               varchar(100),
   QTY                  int,
   UNIT                 varchar(100),
   HARGA                varchar(100),
   primary key (ID_BRG)
);

/*==============================================================*/
/* Table: PELANGGAN                                             */
/*==============================================================*/
create table PELANGGAN
(
   ID_PLGN              int not null,
   NM_PLGN              varchar(100),
   primary key (ID_PLGN)
);

/*==============================================================*/
/* Table: PENYEDIAAN                                            */
/*==============================================================*/
create table PENYEDIAAN
(
   ID_SUP               int not null,
   NM_SUP               varchar(100),
   primary key (ID_SUP)
);

/*==============================================================*/
/* Table: SALES                                                 */
/*==============================================================*/
create table SALES
(
   ID_SALES             int not null,
   NM_SALES             varchar(100),
   primary key (ID_SALES)
);

/*==============================================================*/
/* Table: TRANSAKSI                                             */
/*==============================================================*/
create table TRANSAKSI
(
   ID_JUAL              int not null,
   ID_BRG               int,
   ID_PLGN              int,
   ID_SALES             int,
   TGL_JUAL             datetime,
   JML_BRG_JUAL         int,
   TOT_HRG_JUAL         int,
   primary key (ID_JUAL)
);

/*==============================================================*/
/* Table: TRANSAKSI_BELI                                        */
/*==============================================================*/
create table TRANSAKSI_BELI
(
   ID_BARANG            int not null,
   ID_SUP               int,
   ID_SALES             int,
   NM_BELI              varchar(100),
   ALAMAT               varchar(100),
   TGL_BELI             datetime,
   TGL_TEMPO            datetime,
   DISCOUNT             varchar(10),
   PAJAK                varchar(20),
   TOT_PEMBELIAN        varchar(100),
   primary key (ID_BARANG)
);

alter table TRANSAKSI add constraint FK_RELATIONSHIP_1 foreign key (ID_PLGN)
      references PELANGGAN (ID_PLGN) on delete restrict on update restrict;

alter table TRANSAKSI add constraint FK_RELATIONSHIP_2 foreign key (ID_SALES)
      references SALES (ID_SALES) on delete restrict on update restrict;

alter table TRANSAKSI add constraint FK_RELATIONSHIP_4 foreign key (ID_BRG)
      references BARANG (ID_BRG) on delete restrict on update restrict;

alter table TRANSAKSI_BELI add constraint FK_RELATIONSHIP_3 foreign key (ID_SALES)
      references SALES (ID_SALES) on delete restrict on update restrict;

alter table TRANSAKSI_BELI add constraint FK_RELATIONSHIP_5 foreign key (ID_SUP)
      references PENYEDIAAN (ID_SUP) on delete restrict on update restrict;

