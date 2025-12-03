view: vw_lhp_epicor_glaccount {
  sql_table_name: dbo.vw_LHP_EPICOR_GLAccount ;;

  # --- Primary Key ---
  # Define a primary key for better join performance and query accuracy.
  # Adjust the SQL CONCAT fields to form a unique combination for this view.
  dimension: pk_glaccount {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${company}, '-', ${fiscal_year}, '-', ${fiscal_period}, '-', ${glaccount_seg_value1}) ;;
  }

  # --- Dimensions ---

  dimension: book_id {
    label: "Book ID"
    description: "The identifier for the accounting book."
    type: string
    sql: ${TABLE}.BookID ;;
  }

  dimension: company {
    label: "Company"
    description: "The company identifier associated with the GL account."
    type: string
    sql: ${TABLE}.Company ;;
  }

  dimension_group: date {
    label: "Date"
    type: time
    timeframes: [raw, date, day_of_month, day_of_year, week, month, month_name, month_num, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  # Grouping Fiscal Date Information
  dimension: fiscal_period {
    label: "Fiscal Period"
    group_label: "Fiscal Date"
    description: "The period within the fiscal year."
    type: number
    sql: ${TABLE}.FiscalPeriod ;;
  }

  dimension: fiscal_year {
    label: "Fiscal Year"
    group_label: "Fiscal Date"
    description: "The financial year for the record."
    type: string
    sql: ${TABLE}.FiscalYear ;;
  }

  # Grouping GL Account Details
  dimension: glaccount_account_description {
    label: "Account Description"
    group_label: "GL Account"
    description: "Description of the GL Account."
    type: string
    sql: ${TABLE}.GLAccount_Account_Description ;;
  }

  dimension: glaccount_seg_value1 {
    label: "Segment Value 1"
    group_label: "GL Account"
    description: "Primary segment value for the GL Account."
    type: string
    sql: ${TABLE}.GLAccount_SegValue1 ;;
  }

  # Grouping Interest Debt Information
  dimension: interest_debt_account_desc {
    label: "Interest Account Description"
    group_label: "Interest Debt"
    type: string
    sql: ${TABLE}.InterestDebt_Account_Desc ;;
  }

  dimension: interest_debt_seg_value1 {
    label: "Interest Segment Value 1"
    group_label: "Interest Debt"
    type: string
    sql: ${TABLE}.InterestDebt_SegValue1 ;;
  }

  # --- Measures ---

  measure: count {
    label: "Count"
    type: count
    drill_fields: [company, fiscal_year, glaccount_account_description]
  }

  measure: total_balance_amt {
    label: "Total Balance Amount"
    description: "Sum of the balance amount."
    type: sum
    sql: ${TABLE}.Balance_Amt ;;
    value_format_name: usd
  }

  measure: total_budget_revenue {
    label: "Total Budget Revenue"
    description: "Sum of budget revenue."
    type: sum
    # Cast to number if the underlying field is actually a string
    sql: CAST(${TABLE}.budget_revenue as DECIMAL(18,2)) ;;
    value_format_name: usd
  }

  measure: total_interest_bearing_debt {
    label: "Total Interest Bearing Debt"
    description: "Sum of interest-bearing debt."
    type: sum
    sql: ${TABLE}.Interest_Bearing_Debt ;;
    value_format_name: usd
  }
}
