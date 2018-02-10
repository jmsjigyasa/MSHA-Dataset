/*Microsoft SQL server database - MSHA dataset

Author:Jigyasa Kohli (jk423)
Class: IS 631 101 (FALL 2016)
Professor: James Markulic

*/
Use [MSHA]
go

update MSHA_Full 
set ["msha_Inspect_event_no] = REPLACE(["msha_Inspect_event_no],'"','')
go

exec sp_rename 'MSHA_Full.""msha_Inspect_event_no"', 'msha_Inspect_event_no', 'COLUMN';
go

Use [MSHA]
go

/*1.Inspection table*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_mine_inspect', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_mine_inspect];
GO
create table [dbo].[msha_mine_inspect](
[event_no] varchar(7) not null,
[mine_id] varchar(10) not null,
[acty_cd] varchar(3) null,
[beg_dt] date not null,
[end_dt] date null,
[controller_id] varchar(10) not null,
[operator_id] varchar(10) null,
[cal_yr] numeric(4) null,
[cal_qtr] numeric(1) null,
[fiscal_yr] numeric(4) null,
[fiscal_qtr] numeric(1) null,
[inspect_office_cd] varchar(5) null,
[active_sections] numeric(2) null,
[idle_sections] numeric(2) null,
[shaft_slope_sink] numeric(2) null,
[impound_constr] numeric(2) null,
[bldg_constr_sites] numeric(2) null,
[draglines] numeric(1) null,
[unclassified_constr] numeric(2) null,
[co_records] varchar(1) null,
[surf_ug_mine] varchar(1) null,
[surf_facility_mine] varchar(1) null,
[refuse_piles] varchar(1) null,
[explosive_storage] varchar(1) null,
[outby_areas] varchar(1) null,
[major_constr] varchar(1) null,
[shafts_slopes] varchar(1) null,
[impoundments] varchar(1) null,
[misc_area] varchar(1) null, 
[program_area] varchar(62) null, -- might have to make another table
[sample_cnt_air] varchar(10) null,
[sample_cnt_dustspot] varchar(5) null,
[sample_cnt_dustsurvey] varchar(5) null,
[sample_cnt_respdust] varchar(5) null,
[sample_cnt_noise] varchar(5) null,
[sample_cnt_other] varchar(4) null,
[nbr_inspectors] varchar(2) null,
[total_on_site_hours] float(6) null,
[total_insp_hours] float(6) null,
[coal_metal_ind] varchar(1) null,
[inspection_begin_year] numeric(4) null,
[inspection_end_year] numeric(4) null,
[msha_Inspect_sig_sub_y] varchar(1) null,
[msha_Inspect_sig_sub_n] varchar(1) null,
[cmmdty_cd] varchar(10) null
primary key ([event_no],[controller_id])
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO

/*2.Mine table*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_mine', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_mine];
GO
create table [dbo].[msha_mine](
[mine_id] varchar(10) not null,
[mine_nm] varchar(42) not null,
[c_m_ind] varchar(1) null,
[mine_type_cd] varchar(15) null,
[state_abbr] varchar(2) null,
[fips_cnty_cd] varchar(3) null,
[full_sic_cd] varchar(6) null,
[bom_state_cd] varchar(2) null,
[cong_dist_cd] varchar(2) null,
[company_type] varchar(14) null,
[district] varchar(3) null,
[office_cd] varchar(5) null,
[assess_ctrl_no] varchar(16) null,
[primary_sic_cd_grp] varchar(4) null,
[primary_sic_cd_sfx] varchar(4) null,
[secondary_sic_cd] varchar(6) null,
[secondary_sic_cd_sfx] varchar(4) null,
[secondary_sic_cd_grp] varchar(4) null,
[primary_canvass_cd] varchar(1) null,
[secondary_canvass_cd] varchar(1) null,
[port_oprn_ind] varchar(1) null,
[port_fips_state_cd] varchar(2) null,
[days_per_week] numeric(1) null,
[hrs_per_shift] numeric(2) null,
[prod_shifts_per_day] numeric(2) null,
[maint_shifts_per_day] numeric(2) null,
[employee_cnt] numeric(4) null,
[exempt_ind] varchar(2) null,
[longitude] decimal(9,6) null,
[latitude] decimal(9,6) null,
[avg_mine_height] numeric(5) null,
[gas_category_cd] varchar(3) null,
[methn_librtn] numeric(8) null,
[prod_pits_cnt] numeric(2) null,
[non_prod_pits_cnt] numeric(2) null,
[tail_pond_cnt] numeric(2) null,
[pillar_rcvry_ind] varchar(1) null,
[highwall_mnr_ind] varchar(1) null,
[multiple_pits_ind] varchar(1) null,
[miners_rep_ind] varchar(1) null,
[safety_committee_ind] varchar(1) null,
[miles_ofc] numeric(3) null,
[directions_to_mine] varchar(2000) null,
[nearest_town] varchar(30) null,
[sic_code_4_digit] numeric(4) null,
primary key ([mine_id])
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO

/*3.Mine's current status table*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_curr_stat', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_curr_stat];
GO
create table [dbo].[msha_curr_stat](
[mine_id] varchar(10) not null,
[curr_stat_cd] varchar(15) not null,
[curr_stat_dt] date not null,
[controller_id] varchar(10) null,
[oper_id] varchar(10) null,
[curr_ownr_beg_dt] date null,
[curr_103i_cd] varchar(10) null,
[curr_103i_dt] date null
primary key ([mine_id])
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO

/*Status legend table*/
/*
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_status_leg', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_status_leg];
GO
create table [dbo].[msha_status_leg](
[stat_cd] varchar(1) not null,
[stat_desc] varchar(20) not null,

primary key ([stat_cd])
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO
*/

/*4.State legend table*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_state', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_state];
GO
create table [dbo].[msha_state](
[state_cd] varchar(2) not null,
[state_abbr] varchar(2) not null,
primary key ([state_cd])
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO

/*5.Canvass table*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_canvass', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_canvass];
GO
create table [dbo].[msha_canvass](
[canvass_cd] varchar(1) not null,
[canvass_desc] varchar(15) not null,
primary key ([canvass_cd])
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO

/*6.County legend table*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_cnty', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_cnty];
GO
create table [dbo].[msha_cnty](
[cnty_cd] varchar(3) not null,
[cnty_nm] varchar(21) not null
primary key ([cnty_cd])
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO

/*7.Commodity Lookup*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_commodity_lookup', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_commodity_lookup];
GO
create table [dbo].[msha_commodity_lookup](
cmmdty_cd varchar(10) not null,
cmmdty_desc varchar(450),
naics_cd varchar(8),
sffx_cd varchar(4),
old_sic_cd varchar(5),
actv_ind char(1),
actv_dt date,
inactv_dt date
primary key (cmmdty_cd)
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO

/*8.Contractor*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_contractor', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_contractor];
GO
create table [dbo].[msha_contractor](
cntctr_id varchar(10),
cntctr_nm varchar(50),
primary key (cntctr_id)
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO

/*9.Mine Contract*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_mine_contract', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_mine_contract];
GO
create table [dbo].[msha_mine_contract](
[contractor_cntctr_id] varchar(10) not null,
[contractor_mine_id] varchar(10) not null,
[cntctr_start_dt] date not null,
[cntctr_end_dt] date null
primary key (contractor_cntctr_id,contractor_mine_id,cntctr_start_dt)
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO

/*10.Controller*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_controller', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_controller];
GO
create table [dbo].[msha_controller](
ctrlr_id varchar(10),
ctrlr_nm varchar(75),
primary key (ctrlr_id)
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO

/*11.Controller_history*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_controller_history', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_controller_history];
GO
create table [dbo].[msha_controller_history](
ctrlr_id varchar(10),
oper_id varchar(10),
ctrlr_start_dt date,
ctrlr_end_dt date,
primary key (ctrlr_id,oper_id)
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO

/*12.Acty*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_acty', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_acty];
GO
create table [dbo].[msha_acty](
acty_cd varchar(3),
acty_desc varchar(55)
primary key (acty_cd)
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO

/*13.Operator*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_operator', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_operator];
GO
create table [dbo].[msha_operator](
operator_id varchar(10),
operator_name varchar(60)
primary key (operator_id)
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO


/*14.SIC*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_sic', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_sic];
GO
create table [dbo].[msha_sic](
sic_cd varchar(6),
old_sic_cd varchar(4),
sic_desc varchar(31)
primary key (sic_cd)
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO

/*15.Office*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_office', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_office];
GO
create table [dbo].[msha_office](
office_cd varchar(6),
office_name varchar(32)
primary key (office_cd)
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO

/*16.103i*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF OBJECT_ID (N'dbo.msha_mine_103i', N'U') IS NOT NULL
DROP TABLE [dbo].[msha_mine_103i];
GO
create table [dbo].[msha_mine_103i](
mine_103i_cd varchar(10),
mine_103i_desc varchar(32)
primary key (mine_103i_cd)
) on [PRIMARY]
go
SET ANSI_PADDING OFF
GO
