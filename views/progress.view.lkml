view: progress {
derived_table: {
  sql:

                SELECT DISTINCT
                bets.date,
                bets.time_of_day,
                bets.account_id,
                case  when chan.device_category in ('Tablet','Mobile')  then 'Mobile'
                else 'Desktop' end device_type,
--                case  when chan.operating_system in ('iOS','Mac OS')  then 'iOS'
--                else 'Android' end operating_system,
                mult_id bet_id,
                e.event_name,
                bets.selection_id,
                bets.selection_name,
                bets.market_name,
                sport_name sport,

                --vt.pp_value_tier As Value_Tier,

--                case
--                when vt.pp_value_tier in (0,1,2,3,4) then 'High Value'
--                when vt.pp_value_tier in (5,6,7,8,9) then 'Mass Market'
--                when vt.pp_value_tier in (10) then 'No_Value'
--                else 'FTDS' end Value_Tier_Group,
                --
                --case
                --when ms.sports_preference = 'Football' Then ms.sports_preference
                --when ms.sports_preference = 'Horse Racing' Then ms.sports_preference
                --when ms.sports_preference = 'Horse Racing Football' Then ms.sports_preference
                --when ms.sports_preference = 'Football Horse Racing' Then ms.sports_preference
                --when ms.sports_preference = 'Horse Racing Greyhounds Football' Then 'Horse Racing Other'
                --when ms.sports_preference Like 'Football%' Then 'Football Other'
                --when ms.sports_preference Like 'Other Football' Then 'Football Other'
                --else 'Other' End Sports_Preference,

                sum(vol_gbp) volume,
                sum(rev_gbp) revenue,
                sum(1/cast(bets.tot_num_legs as decimal(12,4))) bet_count

                FROM bets
                Inner Join ${SQL_TABLE_NAME.dim_account} usr On bets.account_id = usr.account_id
                left join ${SQL_TABLE_NAME.mds_software_application} chan on bets.application_key = chan.source_id
--                Inner Join omni.dim_date dt On dt.date = bets.date
                Inner Join ${SQL_TABLE_NAME.vw_events} e ON e.event_id = bets.parent_event_id
--                Left Join commercial_shared.monthly_segmentations vt On bets.account_id = vt.account_id And  dt.month_start_date = trunc(vt.calendar_month) And bets.brand = vt.brand
--                Left Join commercial_shared.monthly_segments ms on bets.account_id = ms.account_id And ms.calendar_month = dt.month_start_date And bets.brand = ms.brand

                WHERE
                usr.account_type != 'Internal - Test_Acct'
--                and dt.month_start_date >= '2019-02-01'
                AND usr.elite_flag = 'N' --- takes out HSU cust
--                AND chan.device_category in ('Tablet','Mobile')
                AND usr.registration_country in ('United Kingdom','Ireland')

                GROUP BY 1,2,3,4,5,6,7,8,9,10
  ;;
}

 }
