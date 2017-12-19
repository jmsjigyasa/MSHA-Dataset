/*Microsoft SQL server database - MSHA dataset

Author:Mahesh M. Nair (mmn9)
Class: IS 631 101 (FALL 2016)
Professor: James Markulic

*/

Use [MSHA]
go
--(2405363 row(s) affected)

/*1.Inspect table*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_mine_inspect] 
([event_no],[mine_id],[acty_cd],[beg_dt],[end_dt],[controller_id],[operator_id],[cal_yr],
[cal_qtr],[fiscal_yr],[fiscal_qtr],[inspect_office_cd]
,[active_sections],[idle_sections],
[shaft_slope_sink],[impound_constr],[bldg_constr_sites],[draglines],[unclassified_constr],
[co_records],[surf_ug_mine],[surf_facility_mine],[refuse_piles],[explosive_storage],
[outby_areas],[major_constr],[shafts_slopes],[impoundments],[misc_area],[program_area],
[sample_cnt_air],[sample_cnt_dustspot],[sample_cnt_dustsurvey],[sample_cnt_respdust],
[sample_cnt_noise],[sample_cnt_other],[nbr_inspectors],[total_on_site_hours],[total_insp_hours],
[coal_metal_ind],[inspection_begin_year],[inspection_end_year],[msha_Inspect_sig_sub_y],
[msha_Inspect_sig_sub_n],[cmmdty_cd])
select [msha_Inspect_event_no],[msha_Inspect_mine_id],[msha_Inspect_acty_cd],
cast([msha_Inspect_beg_dt] as date),
cast([msha_Inspect_end_dt] as date),[msha_Inspect_controller_id],[msha_Inspect_operator_id],
case
when [msha_Inspect_cal_yr]=' ' then NULL
when [msha_Inspect_cal_yr]='' then NULL
else cast([msha_Inspect_cal_yr] as numeric(4))
end,
cast([msha_Inspect_cal_qtr] as numeric),
case
when [msha_Inspect_fiscal_yr]=' ' then NULL
when [msha_Inspect_fiscal_yr]='' then NULL
else cast([msha_Inspect_fiscal_yr] as numeric(4))
end,
cast([msha_Inspect_fiscal_qtr] as numeric),
[msha_Inspect_inspect_office_cd],
cast([msha_Inspect_active_sections] as numeric(2))
,cast([msha_Inspect_idle_sections] as numeric(2)),
cast([msha_Inspect_shaft_slope_sink] as numeric(2)),cast([msha_Inspect_impound_constr] as numeric(2)),
cast([msha_Inspect_bldg_constr_sites] as numeric(2)),cast([msha_Inspect_draglines] as numeric(1)),
cast([msha_Inspect_unclassified_constr] as numeric(2)),[msha_Inspect_co_records],[msha_Inspect_surf_ug_mine],
[msha_Inspect_surf_facility_mine],[msha_Inspect_refuse_piles],[msha_Inspect_explosive_storage],
[msha_Inspect_outby_areas],[msha_Inspect_major_constr],[msha_Inspect_shafts_slopes],[msha_Inspect_impoundments],
[msha_Inspect_misc_area],[msha_Inspect_program_area],[msha_Inspect_sample_cnt_air],[msha_Inspect_sample_cnt_dustspot],
[msha_Inspect_sample_cnt_dustsurvey],[msha_Inspect_sample_cnt_respdust],[msha_Inspect_sample_cnt_noise],
[msha_Inspect_sample_cnt_other],[msha_Inspect_nbr_inspectors],
convert(float(6), [msha_Inspect_total_on_site_hours]),
convert(float(6), [msha_Inspect_total_insp_hours]),[msha_Inspect_coal_metal_ind],
cast([msha_Inspect_inspection_begin_year] as numeric(4)),
cast([msha_Inspect_inspection_end_year] as numeric(4)),[msha_Inspect_sig_sub_y],[msha_Inspect_sig_sub_n],
msha_commodity_lookup_cmmdty_cd
from MSHA_Full
go


/*2.Load Mine*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_mine] 
([mine_id],[mine_nm],[c_m_ind],[mine_type_cd],[state_abbr],[fips_cnty_cd],[full_sic_cd],
[bom_state_cd],[cong_dist_cd],[company_type],[district],[office_cd],[assess_ctrl_no],
[primary_sic_cd_grp],[primary_sic_cd_sfx],[secondary_sic_cd],[secondary_sic_cd_sfx],
[secondary_sic_cd_grp],[primary_canvass_cd],[secondary_canvass_cd],[port_oprn_ind],
[port_fips_state_cd],[days_per_week],[hrs_per_shift],[prod_shifts_per_day],
[maint_shifts_per_day],[employee_cnt],[exempt_ind],[longitude],[latitude],[avg_mine_height],
[gas_category_cd],[methn_librtn],[prod_pits_cnt],[non_prod_pits_cnt],[tail_pond_cnt],
[pillar_rcvry_ind],[highwall_mnr_ind],[multiple_pits_ind],[miners_rep_ind],[safety_committee_ind],
[miles_ofc],[directions_to_mine],[nearest_town],[sic_code_4_digit])
select
distinct [msha_Mine_mine_id],[msha_Mine_curr_mine_nm],[msha_Mine_c_m_ind],[msha_Mine_mine_type_cd],[msha_Mine_state_abbr],
[msha_Mine_fips_cnty_cd],[msha_Mine_full_sic_cd],[msha_Mine_bom_state_cd],
[msha_Mine_cong_dist_cd]s,[msha_Mine_company_type],[msha_Mine_district],[msha_Mine_office_cd],
[msha_Mine_assess_ctrl_no],[msha_Mine_primary_sic_cd_grp],[msha_Mine_primary_sic_cd_sfx],
[msha_Mine_secondary_sic_cd],[msha_Mine_secondary_sic_cd_sfx],[msha_Mine_secondary_sic_cd_grp],
[msha_Mine_primary_canvass_cd],[msha_Mine_secondary_canvass_cd],[msha_Mine_port_oprn_ind],
[msha_Mine_port_fips_state_cd],cast([msha_Mine_days_per_week] as numeric(1)),
case
when [msha_Mine_hrs_per_shift] ='' then NULL
else cast([msha_Mine_hrs_per_shift] as numeric(2))
end,
case
when [msha_Mine_prod_shifts_per_day] = '' then NULL
else cast([msha_Mine_prod_shifts_per_day] as numeric(2))
end,
case
when [msha_Mine_maint_shifts_per_day] = '' then NULL
else cast([msha_Mine_maint_shifts_per_day] as numeric(2))
END,
case 
when [msha_Mine_employee_cnt] ='' then NULL
else cast([msha_Mine_employee_cnt] as numeric(4))
END,
[msha_Mine_exempt_ind],
case
when [msha_Mine_longitude]='' then null
else cast([msha_Mine_longitude] as decimal(9,6))
end,
case
when [msha_Mine_latitude] ='' then NULL
else cast([msha_Mine_latitude] as decimal(9,6))
end,
case
when [msha_Mine_avg_mine_height]='' then NULL
else cast([msha_Mine_avg_mine_height] as numeric(5))
end,
case
when [msha_Mine_mine_gas_category_cd]='' then null
else [msha_Mine_mine_gas_category_cd]
end,
case
when [msha_Mine_methn_librtn]='' then NULL
else cast([msha_Mine_methn_librtn] as numeric(8))
end,
case
when [msha_Mine_prod_pits_cnt]='' then null
else cast([msha_Mine_prod_pits_cnt] as numeric(2))
end,
case 
when [msha_Mine_non_prod_pits_cnt]='' then null
else cast([msha_Mine_non_prod_pits_cnt] as numeric(2))
end,
case
when [msha_Mine_tail_pond_cnt]='' then null
else cast([msha_Mine_tail_pond_cnt] as numeric(2))
end,[msha_Mine_pillar_rcvry_ind],
[msha_Mine_highwall_mnr_ind],[msha_Mine_multiple_pits_ind],[msha_Mine_miners_rep_ind],
[msha_Mine_safety_committee_ind],cast([msha_Mine_mine_miles_ofc] as numeric(3)),[msha_Mine_directions_to_mine],
[msha_Mine_nearest_town],
case
when [msha_Mine_sic_code_4_digit]='' then NULL
else cast([msha_Mine_sic_code_4_digit] as numeric(4))
end
from MSHA_Full
go


/*3.Load Curr_stat*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_curr_stat] 
([mine_id],[curr_stat_cd],[curr_stat_dt],[controller_id],
[oper_id],
[curr_ownr_beg_dt]
,[curr_103i_cd]
,[curr_103i_dt]
)
select 
distinct [msha_Mine_mine_id],[msha_Mine_curr_stat_cd]
,[msha_Mine_curr_stat_dt],
case
when [msha_Mine_controller_id]='' then NULL
when [msha_Mine_controller_id]=' ' then NULL
else [msha_Mine_controller_id]
end,
case
when [msha_Mine_oper_id]='' then null
when [msha_Mine_oper_id]=' ' then null
else [msha_Mine_oper_id]
end,
case
when [msha_Mine_curr_ownr_beg_dt]='' then null
when [msha_Mine_curr_ownr_beg_dt]=' ' then null
else [msha_Mine_curr_ownr_beg_dt] 
end,
case 
when [msha_Mine_mine_103i_desc]='' then null
when [msha_Mine_mine_103i_desc]=' ' then null
else [msha_Mine_mine_103i_desc]
end,
case
when [msha_Mine_curr_103i_dt]='' then null
when [msha_Mine_curr_103i_dt]=' ' then null
else [msha_Mine_curr_103i_dt]
end
from MSHA_Full
go


/*4.Load State*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_state] 
([state_cd],[state_abbr])
select 
distinct msha_Mine_bom_state_cd,msha_Mine_state_abbr from MSHA_Full
go

/*5.Load canvass*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_canvass] 
([canvass_cd],[canvass_desc])
select 
distinct [msha_Mine_primary_canvass_cd],[msha_Mine_primary_canvass_desc] from MSHA_Full
where [msha_Mine_primary_canvass_cd]<>''
go

/*6.Load county*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_cnty] 
([cnty_cd],[cnty_nm])
select 
msha_Mine_fips_cnty_cd,min(msha_Mine_fips_cnty_nm)
 from MSHA_Full group by msha_Mine_fips_cnty_cd
go

/*7.Commodity Lookup*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_commodity_lookup] 
(cmmdty_cd,cmmdty_desc,
naics_cd,sffx_cd,old_sic_cd,actv_ind,actv_dt,
inactv_dt)
select 
distinct
msha_commodity_lookup_cmmdty_cd,msha_commodity_lookup_cmmdty_desc,
msha_commodity_lookup_naics_cd,msha_commodity_lookup_sffx_cd,
msha_commodity_lookup_old_sic_cd,msha_commodity_lookup_actv_ind,
cast([msha_commodity_lookup_actv_dt] as date),
case
when [msha_commodity_lookup_inactv_dt]='"' then NULL
else cast([msha_commodity_lookup_inactv_dt] as date)
end
from MSHA_Full
go
delete from [msha_commodity_lookup] where [cmmdty_cd]=''
go

/*8.Contractor*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_contractor] 
(cntctr_id,cntctr_nm)
select 
distinct
msha_contractor_cntctr_id,msha_contractor_cntctr_nm
from MSHA_Full
go
delete from [msha_contractor] where [cntctr_id]=''
go

/*9. Mine Contract*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_mine_contract] 
([contractor_cntctr_id],
[contractor_mine_id],
[cntctr_start_dt],
[cntctr_end_dt])
select 
distinct
msha_mine_contractor_cntctr_id,
msha_mine_contractor_mine_id,
msha_mine_contractor_cntctr_start_dt,
msha_mine_contractor_cntctr_end_dt
from MSHA_Full
go
delete from [msha_mine_contract] where [contractor_cntctr_id]=''
go


/*10. Mine Controller*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_controller] 
(ctrlr_id,
ctrlr_nm)
(select msha_Inspect_controller_id, min(msha_Inspect_controller_name)
from MSHA_Full group by msha_Inspect_controller_id)
go
delete from [msha_controller] where [ctrlr_id]=''
go

/*11. Mine Controller History*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_controller_history] 
(ctrlr_id,
oper_id,
ctrlr_start_dt,
ctrlr_end_dt)
(select 
 msha_controller_history_ctrlr_id,
 msha_controller_history_oper_id,
 (msha_controller_history_ctrlr_start_dt),
 min(msha_controller_history_ctrlr_end_dt)
from MSHA_Full where
msha_controller_history_ctrlr_id not in (
select 
 msha_controller_history_ctrlr_id
from MSHA_Full where msha_controller_history_ctrlr_id='')
group by msha_controller_history_ctrlr_id,
 msha_controller_history_oper_id,msha_controller_history_ctrlr_start_dt
)
go


/*12. Acty*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_acty] 
(acty_cd,
acty_desc)
(select
distinct msha_Inspect_acty_cd,msha_Inspect_acty_desc
from MSHA_Full)
go
delete from [msha_operator] where operator_id=''
go

/*13. Mine Operator*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_operator] 
(operator_id,
operator_name)
(select msha_Inspect_operator_id, min(msha_Inspect_operator_name)
from MSHA_Full group by msha_Inspect_operator_id)
go
delete from [msha_operator] where operator_id=''
go


/*14.SIC*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_sic] 
(sic_cd,
old_sic_cd,
sic_desc)
(select
[msha_Mine_full_sic_cd],msha_Inspect_sic_code_4_digit,
min(msha_Mine_sic_desc)
 from MSHA_Full where 
 [msha_Mine_full_sic_cd] not in (select
[msha_Mine_full_sic_cd] from MSHA_Full where [msha_Mine_full_sic_cd]='')
group by [msha_Mine_full_sic_cd],msha_Inspect_sic_code_4_digit)
go


/*15. Office*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_office] 
(office_cd,
office_name)
(select
distinct
msha_Mine_office_cd,msha_Mine_office_name
 from MSHA_Full)
go

/*16.Load 103i*/
SET ANSI_PADDING OFF
GO
INSERT into [dbo].[msha_mine_103i] 
([mine_103i_cd],[mine_103i_desc])
select 
msha_Mine_mine_103i_desc,min(msha_Mine_curr_103i_cd)
from MSHA_Full where 
msha_Mine_mine_103i_desc not in 
(select msha_Mine_mine_103i_desc from MSHA_Full where
msha_Mine_mine_103i_desc='')
group by msha_Mine_mine_103i_desc;
go