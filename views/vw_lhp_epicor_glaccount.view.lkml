# The name of this view in Looker is "Vw Lhp Epicor Glaccount"
view: vw_lhp_epicor_glaccount {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: dbo.vw_LHP_EPICOR_GLAccount ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Balance Amt" in Explore.

  dimension: balance_amt {
    type: number
    sql: ${TABLE}.Balance_Amt ;;
  }

  dimension: book_id {
    type: string
    sql: ${TABLE}.BookID ;;
  }

  dimension: budget_revenue {
    type: string
    sql: ${TABLE}.budget_revenue ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.Company ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: fiscal_period {
    type: string
    sql: ${TABLE}.FiscalPeriod ;;
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}.FiscalYear ;;
  }

  dimension: glaccount_account_description {
    type: string
    sql: ${TABLE}.GLAccount_Account_Description ;;
  }

  dimension: glaccount_seg_value1 {
    type: string
    sql: ${TABLE}.GLAccount_SegValue1 ;;
  }

  dimension: interest_bearing_debt {
    type: number
    sql: ${TABLE}.Interest_Bearing_Debt ;;
  }

  dimension: interest_debt_account_desc {
    type: string
    sql: ${TABLE}.InterestDebt_Account_Desc ;;
  }

  dimension: interest_debt_seg_value1 {
    type: string
    sql: ${TABLE}.InterestDebt_SegValue1 ;;
  }
  measure: count {
    type: count
  }
}
