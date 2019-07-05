/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2019/7/1 15:17:38                            */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('CallbackRecord')
            and   type = 'U')
   drop table CallbackRecord
go

/*==============================================================*/
/* Table: CallbackRecord                                        */
/*==============================================================*/
create table CallbackRecord (
   id                   int                  identity,
   phone                char(20)             null,
   callResult           int                  null,
   billsec              decimal(8,2)         null,
   path                 varchar(255)         null,
   uniqueId             varchar(100)         null,
   level                int                  null,
   callDate             varchar(50)          null,
   createTime           datetime             null default getdate(),
   constraint PK_CALLBACKRECORD primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('CallbackRecord') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'CallbackRecord' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '拨打记录表', 
   'user', @CurrentUser, 'table', 'CallbackRecord'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CallbackRecord')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ID',
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CallbackRecord')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'phone')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'phone'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '被叫号码',
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'phone'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CallbackRecord')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'callResult')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'callResult'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '呼叫结果 0:呼叫失败/1:呼叫成功',
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'callResult'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CallbackRecord')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'billsec')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'billsec'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '通话时长',
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'billsec'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CallbackRecord')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'path')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'path'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '完整录音路径',
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'path'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CallbackRecord')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'uniqueId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'uniqueId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '客户唯一标识',
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'uniqueId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CallbackRecord')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'level')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'level'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '客户等级 1:A级/2:B级/3:C级/4:D级/5:E级',
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'level'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CallbackRecord')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'callDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'callDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '呼叫时间',
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'callDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CallbackRecord')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'createTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'createTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'CallbackRecord', 'column', 'createTime'
go

